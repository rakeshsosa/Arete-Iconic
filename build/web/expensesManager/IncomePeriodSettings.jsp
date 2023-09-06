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
                    <jsp:include page="../login/headerlink.htm?submodule=Expenses Settings&tab=Payment Period Settings"/>

                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Payment Period Settings</h5>
                                                </div>
         <form class="myFormForValidation form-inline row" action="../Expenses/paymentPeriodFormSubmit.htm" id="coustmermnForm">
                         <div class="col-md-4 form-floating mb-3">
                                                       
                                                              
                                                                                                                        
                                                      <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            
                                                                         <input type="text" placeholder="fill" class="form-control" readonly="" name="paymentCatName" id="paymentCatName"  value="${list.paymentCatName}">
                                                                         <input type="hidden" class="form-control" readonly="" name="paymentPeriodNo" id="paymentPeriodNo"  value="${list.paymentPeriodNo}">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control"  readonly="" name="paymentCatName" value="${list.paymentCatName}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input placeholder="fill" type="text" class="form-control"  id="paymentCatName" name="paymentCatName" value="" required>								
					
																
																
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        
                                                          <label class="control-label"> Payment Category Name<span style="color:red">*</span></label>

                                                    </div>
                                                    
                                                     <div class="col-md-4 form-floating mb-3 pick1">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="hidden" id="applicableyearid" value="${list.applicableYear}"/>
                                                                            <input type="text" placeholder="fill" class="form-control datepicker10 form-for-valid"  name="applicableYear" id="fromdate" required="" value="${list.applicableYear}">                                                                      </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" placeholder="" class="form-control" name="applicableYear" readonly="" id="fromdate" value="${list.applicableYear}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>    
                                            <input type="text" placeholder="gill" class="form-control datepicker1 form-for-valid" name="applicableYear" id="fromdate"  required="">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                <label class="control-label">Applicable Year <span style="color:red">*</span></label>
                                                    </div>
                                                    
                                                   
                                              <div class="col-md-4 form-floating mb-3">
                                                           <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            
                                                                            <input type="text" placeholder="fill" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod"  value="${list.paymentPeriod}">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriod" id="paymentPeriod" value="${list.paymentPeriod}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <select class="form-select validate[required]" name="paymentPeriod" id="paymentPeriod" maxlength="30" required="" onchange="return customebudget()">
                                                                    <option value="">Select an option</option>   
                                                                      <option value="Defined Period Days">Defined Period Days</option> 
                                                                     <option value="Customized Period">Customized Period</option> 

                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>                                                       
                                                       
 <label class="control-label"> Payment Period <span style="color:red">*</span></label>
                                                    </div>
                                                        
                                                 
                                                 <div class="col-lg-4 form-group" id="timeline">
                                                        <label class="control-label" ><span style="color:red">*</span>Timeline</label>                                                                                                             
                                                                <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            
                                                                         <input type="text" class="form-control" readonly="" name="periodTimeline" id="periodTimeline"  value="${list.periodTimeline}">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="periodTimeline" id="periodTimeline"  value="${list.periodTimeline}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                 <select class="form-control  validate[required]" name="periodTimeline" id="periodTimeline" maxlength="30" required="">
                                                                    <option value="">Select an option</option>
                                                                       
                                                                        <option value="15 Days">15 Days</option>
                                                                    <option value="30 Days">30 Days</option>
                                                                    <option value="60 Days">60 Days</option>    
                                                                    <option value="120 Days">120 Days</option>    
                                                                    <option value="180 Days">180 Days</option>    
                                                                </select>   
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                
                                                
                                                   
                                                    <div class="col-lg-4 form-group pick2" id="periodfrom">
                                             <label class="control-label"> Payment Period From</label>  
                                             
                                         <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            
                                                                         <input type="text" class="form-control datepicker8"  name="paymentPeriodFrom" id="paymentPeriodFrom"  >
                                                                         <input type="hidden" class="form-control" readonly="" name="dateperiodFromId" id="dateperiodFromId" autocomplete="off" value="${fn:substring(list.paymentPeriodFrom, 0, 10)}">
                                                                        
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriodFrom" id="paymentPeriodFrom"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.paymentPeriodFrom}"/>" >

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input type="text" placeholder="" class="form-control datepicker2 form-for-valid" name="paymentPeriodFrom" id="paymentPeriodFrom" required="" autocomplete="off">
                                                            </c:otherwise>        
                                                        </c:choose>
                                             
                                             
                                          </div>
                                                   <div class="col-lg-4 form-group pick3" id="periodto">
                                             <label class="control-label"> Payment Period To</label>                                                                                                  
                                         
                                             
                                                  <c:choose>
                                                            <c:when test="${fn:length(paymentPeriodList) > 0}">
                                                                <c:forEach items="${paymentPeriodList}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            
                                                                         <input type="text" class="form-control datepicker9"  name="paymentPeriodTo" id="paymentPeriodTo" autocomplete="off" >
                                                                         <input type="hidden" class="form-control" readonly="" name="dateperiodToId" id="dateperiodToId" value="${fn:substring(list.paymentPeriodTo, 0, 10)}" >

                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" name="paymentPeriodTo" id="paymentPeriodTo" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.paymentPeriodTo}"/>"  >

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                
                                                                <input type="text" placeholder="" class="form-control datepicker3 form-for-valid" name="paymentPeriodTo" id="paymentPeriodTo" required="" autocomplete="off">
                                                  
                                                            </c:otherwise>        
                                                        </c:choose>
                                             
                                             
                                             
  
                                                   </div> 
                                                     
                                                   
                                         
                                             
                                                    <c:if test="${action ne 'view'}">
                                                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <button type="submit" id="savebtn" class="btn btn-primary mx-1" onclick="checkGrid()">Save</button>
                                                                <a href="../tenant/IncomePeriodSettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                                
                                                
                                                
                                                <c:if test="${action eq 'view'}">
                                                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <a href="../Expenses/incomePeriodList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
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

