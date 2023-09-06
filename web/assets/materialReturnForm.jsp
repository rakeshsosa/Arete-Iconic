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
       <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
        


        </head>
        <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>
       
                <jsp:include page="../login/menu.htm"/>
               
                                
                                   <main id="main" class="main">
       <div>
           <jsp:include page="../login/headerlink.htm?submodule=Material Return&tab=Material Return&pagetype=form"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Property Details Form</h5></div>
                                    <form class="form-inline" action="../quality/gmcApprovalSubmit.htm"  method="post" enctype="multipart/form-data">
                                        <div class="col-md-4">
                                            <label>Do You Wish to Confirm your Return of the Material?</label>
                                            <div class="d-flex justify-content-between col-md-6">
                                                <div><input type="checkbox" ><label>&nbsp; Yes</label></div>
                                                <div><input type="checkbox" ><label>&nbsp; No</label></div>
                                            </div>
                                        </div>
                                           <div class="col-md-4 my-3">
                                            <label><input type="checkbox" > If there is any exchange of and Material?</label>
                                          
                                        </div>
                                        <div class="row">
                                           
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Material Return Code
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                             <div class="col-md-4 form-floating mb-3">
                                                    <select id="assetType" name="assetType" required="" class="form-select validate[required]">
                                                            <option value="" disabled="" selected="">Select your option</option>
                                                            <option value="Purchase Order">Purchase Order</option>     
                                                            <option value="Petty Cash">Petty Cash</option>
                                                             </select> 
                                                  <label class="control-label">Purchase Type   <a style="color:red;">*</a></label>
                                            </div>
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text"  placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Purchase Order Number
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                            
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Purchase Order Date
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="wallNo" name="wallNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="wallNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_4} id="wallNo" name="wallNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Wallet Number
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Vendor Name
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                            
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="date" placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Material Return Date
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                            
                                             <div class="col-md-4 form-floating mb-3">
                                                
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(assetDetails) > 0}">
                                                        <c:forEach items="${assetDetails}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="${list.blockNo}" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_4} id="blockNo1" name="blockNo1" maxlength="40" value="${list.blockNo}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="blockNo" value="${list.blockNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" readonly placeholder="Fill" class="form-control" ${mand_status_4} id="blockNo" name="blockNo" maxlength="40" value="" onkeypress="return isNumberKey(event)">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label">Requested By
                                                    <a  style="color:red;">*</a>
                                                </label>
                                            </div>
                                            
                                            <table class="table table-bordered my-4">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th>Item Name</th>
                                                        <th>Quantity Received</th>
                                                        <th>Total Invoice Amount</th>
                                                        <th>Return Quantity</th>
                                                        <th>Total Returned Quantity Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                            </table>
                                             <div class="col-md-4">
                                            <label>Choose the payment method for the returned Quantity?</label>
                                            <div class="d-flex justify-content-between col-md-8">
                                                <div><input type="checkbox" ><label>&nbsp; Credit Note</label></div>
                                                <div><input type="checkbox" ><label>&nbsp; Refund</label></div>
                                            </div>
                                        </div>
                                            <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../quality/materialReturnList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </div>

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
<jsp:include page="../login/footer.jsp"/>
  <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
            <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
            <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
            <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

        
        


    </body>

</html>

