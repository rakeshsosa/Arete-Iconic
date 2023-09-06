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
                            <ul class="nav nav-pills">
                               <li class="nav-item "><a class="nav-link active" href="#">Income</a></li> &nbsp;
                               <li class="nav-item"><a class="nav-link" href="../tenant/expenseAmountList.htm">Expense</a></li>&nbsp; 
                            </ul>  
                            <br>
                            <div class="text-end">
                                <a class="btn btn-primary btn-sm" href="../tenant/AddincomeForm.htm"><i class="bi bi-plus"></i> Create Income</a>
                            </div>
                         </div> 
                                
                                   
               
                <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                               
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
<!--                                             <div class="mt-2">
                                                        <div class="row">
                                                        <label for="custId"><b>Date</b></label>
                                                      <div class="form-floating col-lg-4 mb-2 pick1"> 
                                                        <input type="text" placeholder="fill" class="form-control datepicker1" name="startDate" id="startDate" required onchange="return dateValidation()">
                                                        <label for="groupname"><span style="color:red">*</span>From</label> 
                                                    </div>
                                                     <div class="form-floating col-lg-4 mb-2 pick2"> 
                                                        <input type="text" placeholder="fill" class="form-control datepicker2" name="endDate" id="endDate" required onchange="return dateValidation()">
                                                        <label for="custId"><span style="color:red">*</span>To</label> 
                                                     </div>
                                                      <div class="form-floating col-lg-4 mb-2"> 
                                                        <input type="text" id="Property" name="Property" class="form-control"  placeholder="xyz" onclick="selectLead();" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Property</label> 
                                                    </div>
                                                    </div>
                                                 
                                                 <div class="row">
                                                      <div class="form-floating col-lg-4 mb-2"> 
                                                        <input type="text" id="Unit" name="Unit" class="form-control"  placeholder="xyz" onclick="selectLead1();" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Unit</label> 
                                                      </div>
                     
                                                    <div class="form-floating col-lg-4  mb-2">
                                                        <select class="form-select" id="Incometype" name="Incometype">
                                                            <option selected="" disabled="">Select an option</option>
                                                            <option value="Rent">Rent</option>
                                                            <option value="Service">Service</option>
                                                            <option value="Utility">Utility</option>
                                                            <option value="All">All</option>
                                                        </select>
                                                         <label class="control-label">Income type</label>
                                                     </div>
                                                </div>
                                              </div>-->
                                            
                                            <div class="card-title">
                                                
                                                <h4><b style="color: black;">INCOME</b></h4>
<!--                                                <h5>Units Contract Template List</h5>-->
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-hover table-bordered">
                                                
					<thead>
                                                                <tr class="headings">
                                                              
                                                                    <th>S.NO</th>
                                                                    <th>Date </th>
                                                                    <th>Property</th>
                                                                    <th>Unit</th>
                                                                    <th id="invoicet" style="display: none;"></th>
                                                                    <!--<th>Total Amount</th>-->
                                                                    <!--<th>Renewal Date</th>-->
                                                                    <!--<th>Approval Status</th>-->
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${incomeAmountList}" var="type">
                                                                <tr class="even pointer"> 
                                                                   
                                                                           
                                                                         <td style="text-align: left;">${type.sNo}</td>
                                                                         <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.fromDate}"/></td>
                                                                         <td style="text-align: left;">${type.property}</td>
                                                                         <td style="text-align: left; ">${type.unit}</td>
                                                                         <td id="invoicetd" style="text-align: left; display: none;"></td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <a href="../tenant/AddincomeForm.htm?pk=${type.sNo}&property=${type.property}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <!--<a href="../tenant/serviceChargeEdit.jsp" class="fa fa-edit fa-lg"title="Edit" ></a>&nbsp;-->
                                                                            <!--<a href="#" class="fa fa-thumbs-up fa-lg"title="Approval"></a>&nbsp;-->
                                                                            <!--<a href="../insurance/tenantContractRenewForm.htm" class="fa fa-recycle fa-lg" data-toggle="tooltip" title="Renew"></a>&nbsp;-->       

                                                                        </td>

                                                                    </tr>
                                                                    
                                                              
                                                                </c:forEach> 

                                                            </tbody>
				</table>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
  <script>
      $(document).ready(function(){
  $('#Incometype').on('change', function() {
      if ($('#Incometype option:selected').text() == "All"){
                    $('#invoicet').show();
                   $('#invoicetd').show();
           }
    else{
          $('#invoicet').hide();
                   $('#invoicetd').hide();
    }
});
});
 </script>

        <script type="text/javascript">
            
        tippy('#information', {
            content: '<p>Create, Search, View, Edit, Approve and Renew the Contract Code, Municipal Agreement Number, Property Name & Number, Contract Period, Renewal Date, and Approval Status. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        
        function selectLead() {
                myWindow = window.open("../tenant/selectPropertyName.jsp", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectLead1(){
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