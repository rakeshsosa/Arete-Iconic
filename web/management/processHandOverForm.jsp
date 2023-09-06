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


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5> Process Handover</h5>
                                                </div>
                                                <form class="form-inline" action="../login/rolesubmit.htm">
                                                    <div class="row">
                                                      <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Vacate Code</label>
                                                    </div>
                                                       <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="jointeeName1" name="jointeeName1" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="jointeeName11" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label"> <a class="text-danger">*</a> Property Name </label>
                                        </div>
                                                    
                                                   
                                        
                                                     <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Unit Number</label>
                                                    </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceper" class="form-control datepicker"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Tenant Date</label>
                                                    </div>
                                                        <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceper" class="form-control datepicker1"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Vacate Notice Date</label>
                                                    </div>
                                                        <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceper" class="form-control datepicker2"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Unit Vacate Date</label>
                                                    </div>
                                                      
                                                    <div class="col-md-12">
                                                           <h5>Exit Checklist</h5>
                                                    </div>
                                           <div class="my-3 col-lg-12" style="height: auto;width: 100%;">
                                            
                                                    <table  class="table table-striped" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                          
                                                            <th class="theader" style="">Name</th>
                                                            <th class="theader" style="">Status Of Inspection</th>
                                                             <th class="theader" style="">Remarks</th>
                                                               <th class="theader" style="">Approve</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                        <tr>
                                                            <td>Wall Painting</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Doors & Locks</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Electrical Outlets</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Flooring</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Lightning</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Closets & Wardrobes & Kitchen Cabinets</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Bathroom Plumbing</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Windows / Balcony Doors</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Gas Pipe Conections</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td>Unit Keys Handover</td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected disabled="">Select an option</option>
                                                                    <option value="Pending">Pending</option>
                                                                    <option value="Completed">Completed</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <input type="text" class="form-control">
                                                            </td>
                                                            <td>
                                                                <select class="form-select">
                                                                    <option selected="" disabled="">Select an option</option>
                                                                    <option value="Yes">Yes</option>
                                                                    <option value="No">No</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                    </tbody>               
                                              
                                                    </table>                                                  
                                                </div>
                                                  <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span>Repair Charges (if any)</label>
                                                    </div>
                                             <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Total Outstanding Dues</label>
                                                    </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Cheque Number</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> TRF Number</label>
                                                    </div>
                                            </div>
                                                    <div class="row">
                                              <div class="col-md-6 my-auto row mb-3">
                                                  <div class="col-md-5">
                                                  <label for="groupname"><span style="color:red">*</span> Total Outstanding Dues</label>
                                                  </div>
                                                  <div class="col-md-7">
                                                            <label class="Cleared">
                                                                <input type="checkbox" 
                                                                       name="checkbox" 
                                                                       value="Cleared">
                                                              Cleared
                                                          </label>
                                                          <label class="NotCleared ms-5">
                                                                <input type="checkbox" 
                                                                       name="checkbox" 
                                                                       value="NotCleared">
                                                              Not Cleared
                                                          </label>
                                                    </div>
                                                     </div>
                                    
                                                     <div class="col-md-6 row my-auto mb-3">
                                                         <div class="col-md-7">
                                                    <label for="groupname"><span style="color:red">*</span> Do you approve the unit for vacancy ?</label>
                                                         </div>
                                                         <div class="col-md-5">
                                                            <label class="Yes">
                                                                <input type="checkbox" 
                                                                       name="checkbox" 
                                                                       value="Yes">
                                                              Yes
                                                          </label>
                                                          <label class="No ms-5">
                                                                <input type="checkbox" 
                                                                       name="checkbox" 
                                                                       value="No">
                                                              No
                                                          </label>
                                                    </div>
                                                     </div>
                                                  
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../management/tenantExitList.htm" class="btn btn-danger">Cancel</a>
            
                                                        </div> 
            
                                                    </c:if>
                                               
                                        </div>
                                                     </form>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
                        <jsp:include page="../login/footer.jsp" />
<script>
            $('.datepicker').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            
               $('.datepicker1').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                todayHighlight: true,
            }).datepicker('update',new Date())
            
            $('.datepicker2').datepicker({
                format: 'dd-M-yyyy',
                autoclose: true,
                todayHighlight: true,
            }).datepicker('update',new Date())
            
    </script>
                    </body>

                    </html>