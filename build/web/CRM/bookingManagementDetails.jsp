<%-- 
    Document   : bookingManagementDetails
    Created on : 24 Jan, 2022, 1:33:29 PM
    Author     : buvan
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
           <jsp:include page="../login/headerlink.htm?submodule=Property Profile&tab=Property Profile&pagetype=form"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Booking Details Form</h5></div>
                                    <form class="row validateForm" id="userform" action="../assets/assetsDetailsFormSubmit.htm"  method="post" enctype="multipart/form-data" onsubmit="return checkMand();">
                                        <div class="col-md-4 form-floating mb-3">
                                                       select class="form-select" name="clientType" placeholder="Category" id="doctype" maxlength="98" required>
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                        <option value="IT & Services">Prop 1</option>
                                                                        <option value="Manufacturing">Prop 2</option>
                                                                        <option value="E-Commerce">Prop 3</option>
                                                                    </select>
                                                        <label for="groupname"><span style="color:red">*</span> Select Property</label>
                                                    </div>
                                        <div class="col-lg-12">
                                            <div class="d-flex">
                                                <div>Total Units <br> 50</div>
                                                <div>Occupied <br> 5</div>
                                                <div>Booked <br> 15</div>
                                                <div>Vacant <br> 10</div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="bookID" class="form-control"  name="bookID" maxlength="98" required>
                                                        <label for="groupname"><span style="color:red">*</span> Booking ID</label>
                                                    </div>   
                                        <div class="col-md-4 form-floating mb-3">
                                                                    <select class="form-select" name="clientType" placeholder="Category" id="doctype" maxlength="98" required>
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                        <option value="IT & Services">IT & Services</option>
                                                                        <option value="Manufacturing">Manufacturing</option>
                                                                        <option value="E-Commerce">E-Commerce</option>
                                                                    </select>
                                                        <label for="clientType"><span style="color:red">*</span> Booking Reference</label>
                                                    </div>
                                                    <div class="col-md-4 form-floating mb-3 pick1">
                                                        <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker1"  name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Booking Date</label>
                                                    </div>
                                            <div class="col-md-4 mb-3">
                                                         <label > 
                                                             <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                                                Convert Rent Quote To Booking</label>
                                                     
                                                    </div>  
                                        
                                        
                                        
                                                                        <c:if test="${action ne 'view' && action ne 'edit'}">
                                            <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/assetsDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
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
<jsp:include page="../login/footer.jsp"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
    <script>
          $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                  //  container: '.pick1'
                }).datepicker('update', new Date());
    </script>
    </body>

</html>
