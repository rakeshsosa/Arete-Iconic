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
                         <link rel="icon" href="../common/theme/images/favicon.png" type="image/png" sizes="16x16">
                         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <title>Arete Iconic</title>
           <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                        <script type="text/javascript">
                             $(document).ready(function () {
                 var chkbox = $("#vatCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".vatperAmt").show();
                    } else {
                        $(".vatperAmt").hide();
                    }
                $("#vatCheck").change(function(event){
                     var chkbox = $("#vatCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".vatperAmt").show();
                    } else {
                        $(".vatperAmt").hide();
                    }
                })         
                
            });   
                    </script>
                  
                        
                    </head>
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <ul class="nav nav-pills">
                                   <li class="nav-item "><a class="nav-link active" href="#">Service</a></li>
                                </ul> 
                                <br>
                                <div class="text-end"> 
                                    <a class="btn btn-primary btn-sm " href="../tenant/serviceChargeList.jsp"><i class="bi bi-eye"></i> Show Service Records</a>
                                </div>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                           <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Tenant Services</h5>
                                                </div>
                                                <form class="form-inline row" action="../tenant/serviceChargeList.jsp">
<!--                                                       <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                                            <input type="text" placeholder="Org Name"  id="propertyname" class="form-control"  name="propertyname" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                            <label class="control-label"> <a class="text-danger">*</a> Property Name</label>
                                                     </div>-->
                                            
                                        
                                                     <div class="col-md-4 form-floating mb-3">
                                                         <input type="text" placeholder="Org Name"  id="servicecategory" class="form-control"  name="servicecategory" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span>Adhoc Service Category</label>
                                                    </div>
                                               <div class="col-md-4 form-floating mb-3">
                                                   <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span>Adhoc Service Name</label>
                                                    </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                             <select type="text" required autocomplete="off" id="adhocBillType" name="adhocBillType" maxlength="20"  class="form-select capitalize validate[required]" value="" >
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Monthly">Monthly</option>
                                                <option value="Daily">Daily</option>
                                                <option value="Weekly">Weekly</option>
                                                
                                                                                      
                                            </select>
                                         <label class="control-label"><span style="color:red">*</span>Adhoc Bill Type</label>
                                             </div>
<!--                                                <div class="col-md-4 form-floating mb-3">
                                                    <input type="text" placeholder="Org Name"  id="ratecardno" class="form-control"  name="ratecardno" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span>Rate Card Id</label>
                                                    </div>
                                                   <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name"  id="ratecardname" class="form-control"  name="ratecardname" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span>Rate Card Name</label>
                                                    </div>-->
<!--                                                      <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceprice" class="form-control"  name="serviceprice" maxlength="98" required onkeypress="return isNumberKey(event)">
                                                        <label for="groupname"><span style="color:red">*</span>Service Price (per hour or quantity based)</label>
                                                    </div>-->
                                                    <div class="col-md-4  mb-3">
                                                        <!--<input type="text" placeholder="Org Name" id="serviceprice" class="form-control"  name="serviceprice" maxlength="98" required onkeypress="firstToUpperCase1(event);">-->
                                                         
                                                        <label for="groupname"> <span style="color:red">*</span>Service Billing Type</label><br>
                                                         <div class="col-md-12">
                                                         <input class="" type="checkbox" id="myCheck1"> Hour Based &nbsp;
                                                            <input class="" type="checkbox" id="myCheck1"> Monthly Based 
                                                             
                                                          </div>
                                                    </div>
<!--                                             <div class="col-lg-12 mt-3">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>

                                                   </div>-->
                                                    
<!--                                                    <div class="my-3 col-lg-12">-->

<!--                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                          
                                                            <th class="theader" style="">Service Name</th>
                                                            <th class="theader" style="">Fixed Service Charges</th>
                                                             <th class="theader" style="">Service Charges ( % )</th>
                                                               <th class="theader" style="">Service Charges Monthly Amount</th>
                                                                <th class="theader" style="">Total</th>
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                    </tbody>               
                                             
                                                    </table>                                                  -->
                                                <!--</div>-->
                                                  
<!--                                                        <div class="col-md-4  mb-3">
                                                            <input class="" type="checkbox" id="vatCheck">
                                                            <label class="" for="myCheck">Add VAT</label>                                                            
                                                        </div> -->
                                                
<!--                                                <div class="col-md-4 form-floating mb-3 vatperAmt">
                                                    <input type="text" id="vatamount" placeholder="Org Name" class="form-control"  name="vatamount" maxlength="98" required onkeypress="return isNumberKey(event)">
                                                    <label for="groupname">VAT %</label>
                                                </div>-->
                                                      
                                                
<!--                                                        <div class="col-md-4 form-floating mb-3">
                                                           
                                                              <input type="text" id="total" placeholder="Org Name" class="form-control"  name="total" maxlength="98" required onkeypress="return isNumberKey(event)">
                                                              <label for="groupname">Service Price</label>
                                                        </div> -->
                                                            <br>
                                                  
                                                        
                                                      
                                                    
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../tenant/serviceChargeList.jsp" class="btn btn-danger">Cancel</a>
            
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
                            window.onload = minRentGen();
                        </script>
                    </body>

                    </html>