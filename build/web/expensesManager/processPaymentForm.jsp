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

                        <title>arête Assets Management</title>
                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                    <jsp:include page="../login/headerlink.htm?submodule=Expense Settings&tab=Payment Period Settings"/>

                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Process Payment Form</h5>
                                                </div>
         <form class="myFormForValidation form-inline row" action="../Expenses/paymentPeriodFormSubmit.htm" id="coustmermnForm">
                          <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   
                                                                </select>                                                                          </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Payment Type</option>   
                                                                   
                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Expense Category<span style="color:red">*</span></label>
                                                    </div>
                   <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   
                                                                </select>                                                                          </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Vendor Name</option>   
                                                                   
                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Expense Type<span style="color:red">*</span></label>
                                                    </div>
                <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                 <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   <option value="General">General</option>   
                                                                   <option value="Petty Cash">Petty Cash</option>   
                                                                </select>                                                                         </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   <option value="General">General</option>   
                                                                   <option value="Petty Cash">Petty Cash</option>   
                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Ref PO / Invoice<span style="color:red">*</span></label>
                                                    </div>
                                                
                              <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                                                                                         </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input placeholder="fill" class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Amount<span style="color:red">*</span></label>
                                                    </div>                     
                                                      <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   
                                                                </select>                                                                          </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                   
                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label">Payment Mode<span style="color:red">*</span></label>
                                                    </div>
                                                 
                                                <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                     <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                    <input type="date" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                               
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Payment Due Date<span style="color:red">*</span></label>
                                                    </div>
                                                     
                                                        <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesCategoryList) > 0}">
                                                                <c:forEach items="${expensesCategoryList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" name="expensesCategoryNumber" value="${type[0]}" maxlength="98">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" name="expensesCategoryNumber" maxlength="98" id="expno"  required onkeypress="return isAlphaNumeric(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
  <label class="control-label">Description</label>
                                                    </div>
                                              <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesCategoryList) > 0}">
                                                                <c:forEach items="${expensesCategoryList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" name="expensesCategoryNumber" value="${type[0]}" maxlength="98">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>        
                                                                <select class="form-select"  name="expensesCategoryNumber" maxlength="98" id="expno"  required class="form-select">
                                                                    <option value="" disabled=" selected">Select an option</option>
                                                                      <option value="Full Payment">Full Payment</option>
                                                                        <option value="Partial Payment">Partial Payment</option>
                                                                     <option value="Payment Pending">Payment Pending</option>
                                                                
                                                                </select>
                                                              
                                                            </c:otherwise>        
                                                        </c:choose>
  <label class="control-label" > Status<span style="color:red">*</span></label>
                                                    </div>
                                                  <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                                                                                         </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input placeholder="fill" class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> Amount Paid<span style="color:red">*</span></label>
                                                    </div>        
              <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                  <select class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                                                                                         </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input placeholder="fill" class="form-control validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
                                                        <label class="control-label"> TRF Number<span style="color:red">*</span></label>
                                                    </div>          
                                                    <c:if test="${action ne 'view'}">
                                                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <button type="submit" id="savebtn" class="btn btn-primary mx-1" onclick="checkGrid()">Save</button>
                                                                <a href="../expensesManager/bookedExpensesTracking.jsp" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                                
                                                
                                                
                                                <c:if test="${action eq 'view'}">
                                                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <a href="../expensesManager/bookedExpensesTracking.jsp" class="btn mx-1 btn-danger">Cancel</a>
                                                            
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
        $(document).ready(function(){
            
        
                var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
                $('.datepicker').datepicker({
                    format: 'yyyy',
                     viewMode: 'years',
                    minViewMode: 'years',
                    autoclose: true,
                    todayHighlight: true,
                  
                    container: '.pick'
                }).datepicker('update', new Date());
               
                 var applicableyearid = $("#applicableyearid").val();
                 
               $('.datepicker10').datepicker({
                  format: 'yyyy',
                     viewMode: 'years',
                    minViewMode: 'years',
                    startDate: '0m 0y',
                    autoclose: true,
                    todayHighlight: true,
                  
                    container: '.pick1'
               }).datepicker('setDate', new Date(applicableyearid));
               
                   var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
                    $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick2'
                }).datepicker('update', new Date());
                
                
                
//                 $('.datepicker3').datepicker({
//                    format: 'dd-mm-yyyy',
//                    autoclose: true,
//                    todayHighlight: true,
//                
//                    container: '.pick3'
//                }).datepicker('update', new Date());
                
                 var dateperiodFromId = $("#dateperiodFromId").val();
                 
               $('.datepicker8').datepicker({
                   format: 'dd-mm-yyyy',
                   autoclose: true,
                   todayHighlight: true,

                   container: '.pick2'
               }).datepicker('setDate', new Date(dateperiodFromId));
               
               var dateperiodToId = $("#dateperiodToId").val();
                    $('.datepicker9').datepicker({
                       format: 'dd-mm-yyyy',
                       autoclose: true,
                       todayHighlight: true,

                       container: '.pick3'
                   }).datepicker('setDate', new Date(dateperiodToId));
             })                                        
              
</script>
<script>
         $("#paymentPeriodFrom").change(function(){
          var periodFrom = $("#paymentPeriodFrom").val();
          console.log(periodFrom);
          $('.datepicker3').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    container: '.pick3'
                }).datepicker('setStartDate', periodFrom).datepicker('update', periodFrom);
                //$('#paymentPeriodTo').datepicker('setStartDate', periodFrom);
     })
</script>    
 <script>
       function customebudget() {
         let  budgetotion = document.getElementById("paymentPeriod").value;
           if(budgetotion == "Defined Period Days") {
                  $("#periodfrom").hide();
                   $("#periodto").hide();
               $("#timeline").show();
           }
             if(budgetotion == "Customized Period") {
                  $("#periodfrom").show();
                   $("#periodto").show();
               $("#timeline").hide();
           }
       }
   </script>
   <script>
            $(document).ready(function () {
                    $("#periodfrom").hide();
                    $("#periodto").hide();
                    $("#timeline").hide();
                    var  budgetotion = document.getElementById("paymentPeriod").value;
                        if(budgetotion == "Defined Period Days") {
                               $("#periodfrom").hide();
                                $("#periodto").hide();
                            $("#timeline").show();
                        }
                          else if(budgetotion == "Customized Period") {
                               $("#periodfrom").show();
                                $("#periodto").show();
                            $("#timeline").hide();
                        }

            });</script>
   
  
   <script>

    $("#paymentCatName").change(function () {
        $("#applicableYear").empty();
        var paymentCatName = document.getElementById("paymentCatName").value;

        $.ajax
                ({
                    type: "POST",
                    url: '../Expenses/getAppYearList.htm',
                    data: {
                        paymentCatName: paymentCatName
                    },
                    success: function (data) {
                        //                                    swal(data)
                        data = data.split(",");
                        var len = data.length;
                        //                                    swal(len)
                        //     brandName                               swal((len - 1) / 2)
                        $("#applicableYear").append('<option value="">Select An Option</option>');


                        if (data != 'a') {

                            for (var i = 0; i < len; i++) {

                                var name = data[i];
                                if (name != '') {
                                    $("#applicableYear").append("<option value='" + name + "'>" + name + "</option>");

                                }



                            }

                        }

                    }
                });


    });








</script>
 <script>
      var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
                $('.datepicker1').datepicker({
                    format: 'yyyy',
                    viewMode: 'years',
                    minViewMode: 'years',
                    startDate: '0m 0y',
                    autoclose: true,
                    todayHighlight: true,
                  
                    container: '.pick1'
                }).datepicker('update', new Date());
                 
              
</script>
   
</body>

</html>

