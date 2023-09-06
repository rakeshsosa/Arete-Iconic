<%-- Document : assetDetailsList Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                           
                            <%--<jsp:include--%>
                                    <!--page="../login/headerlink.htm?submodule=Income and Expense Tracking&tab=Income and Expense Tracking&pagetype=list" />-->
                       
                          <ul class="nav nav-pills">
                                 <li class="nav-item "><a class="nav-link active" href="#">Income and Expense Tracking</a></li> &nbsp;
                                  <li class="nav-item "><a class="nav-link" href="../tenant/incomeAmountList.htm">Income</a></li> &nbsp;
                                  <li class="nav-item"><a class="nav-link " href="../tenant/incomeExpenseList.jsp"">Expense</a></li>&nbsp; 
                <br>
             
                           </ul>  
                        
                        </div>
                        <div class="pagetitle mt-5">
                           
                        </div>
                   <div class="row mt-2"> 
                         <!-- <div class="form-floating col-lg-5 mb-2">
                                <span class="input-group-btn">TIme Period </span><br>
                             <div class="input-group">
                                <span class="input-group-btn" style="width:42px; margin-left: 5px; font-size: 15px;">From</span>
                                <input type="date" class="form-control">
                                <span class="input-group-btn" style="width:26px; margin-left: 5px; font-size: 15px;"> To</span>
                                <input type="date" class="form-control">
                              </div> 
                            </div> -->
                   </div>
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                                  <div class="mt-2">
                                                        <div class="row col-lg-12">
                                                        <label for="custId"><b>Date</b></label>
                                                      <div class="form-floating col-lg-3 mb-2 pick1"> 
                                                        <input type="text" placeholder="fill" class="form-control datepicker1" name="startDate" id="startDate" required onchange="return dateValidation()">
                                                        <label for="groupname"><span style="color:red">*</span>From</label> 
                                                    </div>
                                                     <div class="form-floating col-lg-3 mb-2 pick2"> 
                                                        <input type="text" placeholder="fill" class="form-control datepicker2" name="endDate" id="endDate" required onchange="return dateValidation()">
                                                        <label for="custId"><span style="color:red">*</span>To</label> 
                                                     </div>
                                                      <div class="form-floating col-lg-3 mb-2"> 
                                                        <input type="text" id="Property" name="Property" class="form-control"  placeholder="xyz" onclick="selectLead();" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Property</label> 
                                                    </div>
                                                         <div class="form-floating col-lg-3 mb-2"> 
                                                        <input type="text" id="Unit" name="Unit" class="form-control"  placeholder="xyz" onclick="selectLead1();" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Unit</label> 
                                                      </div>
                                                    </div>
                                              </div>
                                            <div class="card-title">
                                                
                                            </div>
                  
                                    <div class="table-responsive">
                                        <table class="table datatable table-bordered table-hover">
                                                    <thead>
                                                      <tr  class="headings">
                                                        <th>Income</th>
                                                        <th>Credit</th>
                                                        <th>Debit</th>
                                                        <th>Total</th>
                                                      </tr>
                                                    </thead>
                                                    <tbody>
                                                      <tr class="even pointer">
                                                        <td>Merchandise Sales</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                      </tr>
                                                      <tr class="even pointer">
                                                        <td>Music Lesson Income</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                      </tr>
                                                       <tr class="even pointer">
                                                        <td>Total Revenues:</td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                      </tr>
                                                    </tbody>
                                                    <thead>
                                                     <tr>
                                                       <th>Expenses</th>
                                                       <th></th>
                                                       <th></th>
                                                       <th></th>
                                                     </tr>
                                                   </thead>
                                                <tbody>
                                                 <tr class="even pointer">
                                                   <td>Cost Good Sold</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                  <tr class="even pointer">
                                                   <td>Depreciation Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                  <tr class="even pointer">
                                                   <td>Wage Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                 <tr class="even pointer">
                                                   <td>Rent Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                 <tr class="even pointer">
                                                   <td>Interest Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                 <tr class="even pointer">
                                                   <td>Supplies Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                 <tr class="even pointer">
                                                   <td>Utilities Expense</td>
                                                   <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                 <tr class="even pointer">
                                                   <td>Total Expenses:</td>
                                                    <td></td>
                                                        <td></td>
                                                        <td></td>
                                                 </tr>
                                                </tbody>
                                                <thead>
                                                 <tr>
                                                   <th>Gross income/Expenses</th>
                                                   <th></th>
                                                   <th></th>
                                                   <th></th>
                                                 </tr>
                                                </thead>
                                        </table>
                                    </div>

                                            
      
                                            <!-- Table with stripped rows -->

<!-- <div class="table-responsive">
    <table class="table datatable table-hover table-bordered">
        <thead>
                                                    <tr class="headings">
                                                       
                                                        <th>Income</th>
                                                        <th>Total Payable of Income</th>
                                                        <th>Expense </th>
                                                        <th>Total Payable of Expense</th>
                                                        <th class=" no-link last"><span class="nobr">Action</span>
                                                        </th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                  <tr class="even pointer">    
                                                                       <td></td> 
                                                                       <td></td> 
                                                                       <td></td>
                                                                       <td></td>
                                                                 
                                                            <td class=" last " style="text-align: center;">
                                                                <a href="../tenant/incomeExpenseView.jsp" class="fa fa-eye fa-lg"title="View"></a>&nbsp;           
                                                                <a href="../tenant/incomeExpenseEdit.jsp" class="fa fa-edit fa-lg"title="Edit" ></a>&nbsp;
                                                            </td>

                                                        </tr>
                                                </tbody>
    </table>
   </div> -->
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>

                    <script>
                         function selectLead() {
                myWindow = window.open("../tenant/selectPropertyName.jsp", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }function selectLead1(){
                myWindow = window.open("../tenant/selectPropertyName.jsp", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            
                    $('.datepicker2').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    todayHighlight: true,
    container: '.pick2'
});

$('.datepicker1').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    startDate:'0m 0d',
    todayHighlight: true,
    container: '.pick1'
});
                    </script>
                </body>

                </html>