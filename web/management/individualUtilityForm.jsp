<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
    <script>
        function selectPropertyDetails()
        {
            myWindow = window.open("../insurance/selectPropertyName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            window.close();
        }

    </script>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Utility Management&tab=Utility Management&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5> Common Utility</h5>
                                                </div>
                                                <form class="form-inline row" action="../management/individualUtilityFormSubmit.htm">
                                                       <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="jointeeName1" name="jointeeName1" value="${list.propertyName}" onclick="return selectPropertyDetails();" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="sNo" value="${list.sNo}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.propertyName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="" onclick="return selectPropertyDetails();">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label"> <a class="text-danger">*</a> Property Name </label>
                                        </div>
                                                    
                                                   
                                        
                                                     <div class="col-md-4 form-floating mb-3">
                                                        
                                                        <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" value="${list.unitNumber}" maxlength="98" required onkeypress="isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" value="${list.unitNumber}" maxlength="98" readonly="" required onkeypress="isNumberKey(event);">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" required onkeypress="isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span> Unit Number</label>
                                                    </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                                        
                                                <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" value="${list.tenantName}" maxlength="98" required>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" value="${list.tenantName}" maxlength="98" readonly="" required>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" maxlength="98" required>
                                                </c:otherwise>        
                                            </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span>Tenant Name</label>
                                                    </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="jointeeName2" name="jointeeName2" value="${list.utilityBillNumber}" autocomplete="off" onkeypress="return isNumberKey(event);">
                                                                <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.sNo}" required>
                                                                </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName2" value="${list.utilityBillNumber}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName2" name="jointeeName2" value="" onkeypress="return isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label"> <a class="text-danger">*</a> Utility Bill Number </label>
                                        </div>
                                                      <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="jointeeName3" name="jointeeName3" value="${list.utilityType}" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName3" value="${list.utilityType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select placeholder="Fill" class="form-select" id="jointeeName3" name="jointeeName3" >
                                                        <option>Common</option>
                                                        <option>Individual</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label"> <a class="text-danger">*</a> Utility Type </label>
                                        </div>
                                                  
                                                       <div class="col-md-4 form-floating mb-3 pick2">
                                           
                                          <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text"  required  id="startDate" name="startDate"  class="form-control datepicker2 capitalize validate[required]"  placeholder="DD/MM/YYYY" value="${list.billingStartDate}" readonly="" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  required  id="startDate" name="startDate"  class="form-control datepicker2 capitalize validate[required]"  placeholder="DD/MM/YYYY" value="${list.billingStartDate}" readonly="" />
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input type="text"  required  id="startDate" name="startDate"  class="form-control datepicker2 capitalize validate[required]"  placeholder="DD/MM/YYYY" value="" readonly="" />
                                                </c:otherwise>        
                                            </c:choose>
                                           <label class="control-label"><span style="color:red">*</span>Billing Start Date</label>          
                                       </div>
                                  
                                       <div class="col-md-4 form-floating mb-3 pick3">
                                           
                                        <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" required id="endDate" name="endDate"  class="form-control datepicker3 validate[required]" placeholder="DD/MM/YYYY" value="${list.billingEndDate}"  readonly="">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" required id="endDate" name="endDate"  class="form-control datepicker3 validate[required]" placeholder="DD/MM/YYYY" value="${list.billingEndDate}" readonly="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input type="text" required id="endDate" name="endDate"  class="form-control datepicker3 validate[required]" placeholder="DD/MM/YYYY"  readonly="">
                                                </c:otherwise>        
                                            </c:choose>
                                           <label class="control-label"><span style="color:red">*</span>Billing End Date</label>     
                                       </div>
<!--                                           <div class="my-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th>Unit Name</th>
                                                            <th class="theader" style="">Previous Reading</th>
                                                            <th class="theader" style="">Current Reading</th>
                                                             <th class="theader" style="">Charges Per Unit</th>
                                                               <th class="theader" style="">Consumption</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                    </tbody>               
                                              
                                                    </table>                                                  
                                                </div>-->
                                           
                                                    <div class="col-md-4 form-floating mb-3">
                                                        
                                                        <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Org Name" id="serviceinterval1" class="form-control"  name="serviceinterval1" maxlength="98" value="${list.fixChargeShare}"  required onkeypress="isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Org Name" id="serviceinterval1" class="form-control"  name="serviceinterval1" maxlength="98" value="${list.fixChargeShare}" readonly="" required onkeypress="isNumberKey(event);">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input type="text" placeholder="Org Name" id="serviceinterval1" class="form-control"  name="serviceinterval1" maxlength="98" required onkeypress="isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span> Fix Charge Share</label>
                                                    </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                                        
                                                         <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Org Name" id="serviceinterval2" class="form-control"  name="serviceinterval2" maxlength="98" value="${list.additionalCharges}" required onkeypress="isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Org Name" id="serviceinterval2" class="form-control"  name="serviceinterval2" maxlength="98" value="${list.additionalCharges}" readonly="" required onkeypress="isNumberKey(event);">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input type="text" placeholder="Org Name" id="serviceinterval2" class="form-control"  name="serviceinterval2" maxlength="98" required onkeypress="isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span> Additional Charges</label>
                                                    </div>
                                                   <div class="col-md-4 form-floating mb-3">
                                                        
                                                        <c:choose>
                                                <c:when test="${fn:length(utilityManagementList) > 0}">
                                                    <c:forEach items="${utilityManagementList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" placeholder="Org Name" id="serviceinterval3" class="form-control"  name="serviceinterval3" maxlength="98" value="${list.totalBillConsuption}" required onkeypress="isNumberKey(event);">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" placeholder="Org Name" id="serviceinterval3" class="form-control"  name="serviceinterval3" maxlength="98" value="${list.totalBillConsuption}" readonly="" required onkeypress="isNumberKey(event);">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                   <input type="text" placeholder="Org Name" id="serviceinterval3" class="form-control"  name="serviceinterval3" maxlength="98" required onkeypress="isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span> Total Bill Consumption For Month</label>
                                                    </div>
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../management/utilityManagementList.htm" class="btn btn-danger">Cancel</a>
            
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
                              
                              
                               $(function () {
                var today = new Date();
                $('#endDate').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick3'
                }).datepicker('update', new Date());
            });
            
            
              $(function () {
                var today = new Date();
                $('#startDate').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    startDate: today,
                    todayHighlight: true,
                    container: '.pick3'
                }).datepicker('update', new Date());
            });
//                $(document).ready(function () {
//                    $('.datepicker2').datepicker({
//                format: 'dd-M-yyyy',
//                startDate: '0m +0m',
//                autoclose: true,
//                todayHighlight: true,
//                container: '.pick2'
//            }).datepicker('update',new Date())
//            
//            
//               $('.datepicker3').datepicker({
//                format: 'dd-M-yyyy',
//                startDate: '0m +0m',
//                autoclose: true,
//                todayHighlight: true,
//                container: '.pick3'
//            }).datepicker('update',new Date())
//            
//    })
    </script>
                    </body>

                    </html>