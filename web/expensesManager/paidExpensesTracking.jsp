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

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
       <jsp:include page="../login/headerlink.htm?submodule=Expense Tracking&tab=Paid Expenses&pagetype=list"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Paid Expense Tracking</h5></div> 

                     
                                 
                             
 <!-- Modal popup form form -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">PAY</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
            <form id=""  method="post" action="../Expenses/PaidExpenseList.htm" accept-charset="UTF-8" enctype="multipart/form-data">
               <div class="row mb-4">

                            <div class="col-lg-6 form-group  " id="paycals">
                                <label class="control-label" ><span style="color:red">*</span> Amount Paid</label>                                                                                                             
                                <input class="form-control " name="amountPaid" id="catname" required type="number" min="0" max="100000"  oninput="balanceAmountCalc(event)" onchange="allowThreeDecimal(event)">
                                
                                <input class="form-control " type="hidden" name="bookingIdPop" id="bookingIdPop" required>
                                <input class="form-control " type="hidden" name="balenceAmount" id="balenceAmount" required>
                                <input class="form-control " type="hidden" name="expenseAmount" id="expenseAmount" required>
                                <input class="form-control " type="hidden" name="totalAmountPaid" id="totalAmountPaid" required>
                            </div>
                             <div class="col-lg-6 form-group ">
                                <label class="control-label" ><span style="color:red">*</span> Mode Of Payment</label>                                                                                                             
                                <select class="form-control" name="modeOfPayment" id="paymode" onchange="return customebudget()" required>
                                    <option value="">Select an option</option>

                                         <option value="Debit Card">Debit Card</option>
                                    <option value="Credit Card">Credit Card</option>
                                     <option value="Cheque">Cheque</option>
                                      <option value="Bank Transfer ">Bank Transfer </option>
                                    <option value="Cash">Cash</option>                                                                   
                                </select>
                            </div>
                            <div class="col-lg-6 form-group " id="chequeno">
                                <label class="control-label" ><span style="color:red">*</span> Cheque No.</label>                                                                                                             
                                <input class="form-control " name="chequeNo" id="typename" >
                            </div>
                             <div class="col-lg-6 form-group" id="trackingNumber">
                                <label class="control-label" ><span style="color:red">*</span> Tracking Number</label>                                                                                                             
                                <input class="form-control " name="trackingNumber" id="typename" required>
                            </div>
   
         <div class="col-lg-6 form-group pick2">
                                <label class="control-label" ><span style="color:red">*</span> Transaction Date</label>                                                                                                             
                               <input type="text" placeholder="" class="form-control datepicker2 form-for-valid" name="transactionDate" id="paymentPeriodFrom" required="">

                            </div>
    <div class="col-lg-6 form-group" id="referenceNumber">
                                <label class="control-label"><span style="color:red">*</span> Reference Number</label>                                                                                                             
                                <input class="form-control " name="refNumber" id="typename" required>
                            </div>
                        </div>
                <div class="row">
                    <div class="d-flex justify-content-center w-100">
                        <input type="submit" class="btn btn-primary mr-2" id="savebtn" value="Save">
                      <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                    </div>
                                               
                                            </div>
          </form>
       
      </div>

      <!-- Modal footer -->
<!--      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>-->

    </div>
  </div>
</div>    
                             

                        <div class="row mb-4">

                           <div class="col-lg-4 form-group d-flex form-row">
                                <label class="control-label col-md-6" ><span style="color:red">*</span> Expense Timeline</label>                                                                                                             
                                <select class="form-select  col-md-6" name="expenseTimeline" id="expenseTimeline">
                                    <option value="">Select an option</option>

                                    <option value="Expense < 15 Days">Expense < 15 Days</option>
                                    <option value="Expense < 30 Days">Expense < 30 Days</option>
                                    <option value="Expense < 60 Days">Expense < 60 Days</option>                                                                    
                                </select>

                            </div>
                            
                           
                        </div>
 
<!--  <div class="col-lg-3 form-group mb-3">
                                  <label class="control-label" ></label> 
                                        
                                        <button class="btn btn-primary btn-sm mt-3" >Ledger Voucher</button>
                                    </div>-->
 
 
                        <table id="myTable"  class="table datatable">
                            <thead>

                                <tr>

                                    <th class="theader" style="">Expense Type</th>
                                    <th class="theader" style="">Expense Amount</th>
                                    <th class="theader" style="">Amount Paid</th>
                                    <th class="theader" style="">Balance Amount</th>
                                    <th class="theader" style="">Mode Of Payment</th>
                                    <th class="theader" style="">Transaction Date</th>
                                     <th>Action</th>
                                  
                                   
                                </tr>
                            </thead>

                            <tbody>
                                 
                                 <tr>
                                <td class="center">Test</td> 
                                  <td class="center">Test</td>   
                                  <td class="center">Test</td> 
                                <td class="center">Test</td> 
                                 <td class="center">Test</td> 
                                  <td class="center">Test</td> 
                                <td class="text-nowrap">
                                    <a href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>&nbsp;

                                    <a href="../tenant/voucherForm.htm" class="fa fa-ticket fa-lg" data-toggle="tooltip" title="Ledger Voucher"></a>&nbsp;
                                    <a href="#" class="fa fa-newspaper-o fa-lg" data-toggle="tooltip" title="Generate Receipt"></a>&nbsp;
                                    
                                    
                                    
                                    

                                </td> 
                            </tr>
                          
                            </tbody>

                        </table>

                 </div>
			   </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<script>


         var table = $('#myTable').DataTable();
               
               // Extend dataTables search
                $.fn.DataTable.ext.type.search.phoneNumber = function ( data ) {
                    var selectedVal =$("#expenseTimeline").val();
                    if(selectedVal == 'Expense < 15 Days'){
                        var min = new moment().add(-15, 'days').format("YYYY-MM-DD");
                        var max = new moment().add(1, 'days').format("YYYY-MM-DD");
                        console.log(min, max);
                    }else if(selectedVal == 'Expense < 30 Days'){
                        var min = new moment().format("YYYY-MM-DD");
                        var max = new moment().add(30, 'days').format("YYYY-MM-DD");
                        console.log(min, max);
                    }else if(selectedVal == 'Expense < 60 Days'){
                        var min = new moment().format("YYYY-MM-DD");
                        var max = new moment().add(60, 'days').format("YYYY-MM-DD");
                        console.log(min, max);
                    }
                    var createdAt = data;  
                    if (
                      (min == "" || max == "") ||
                      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
                    ) {
                      return true;
                    }
                    return false;
                };
                $.fn.dataTable.ext.search.push(
                  function(settings, data, dataIndex) {
                  var selectedVal =$("#expenseTimeline").val();
                   if(selectedVal == 'Expense < 15 Days'){
                        var min = new moment().add(0, 'days').format("YYYY-MM-DD");
                        var max = new moment().add(15, 'days').format("YYYY-MM-DD");
                    }else if(selectedVal == 'Expense < 30 Days'){
                        var min = new moment().format("YYYY-MM-DD");
                        var max = new moment().add(30, 'days').format("YYYY-MM-DD");
                    }else if(selectedVal == 'Expense < 60 Days'){
                        var min = new moment().format("YYYY-MM-DD");
                        var max = new moment().add(60, 'days').format("YYYY-MM-DD");
                    }
                    var createdAt = data[5] || 0; // Our date column in the table
//                        console.log(data);
                    if (
                      (min == "" || max == "") ||
                      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
                    ) {
                      return true;
                    }
                    return false;
                  }
                );
        
        $("#expenseTimeline").change(function(event){
                var selectedVal =$("#expenseTimeline").val();
                table.draw();
            
        })
        
        $('#my-table_filter').hide();
    });
</script>


<script type="text/javascript">
$(document).ready(function () {
    tippy('#information', {
        content: '<p>This page lists all the partial payments done towards the booked expenses.<p>\n\
',
        allowHTML: true,
        hideOnClick: 'toggle',
        trigger: 'click',
        onShow: function (reference) {
            setTimeout(function () {
                reference.hide();
                reference.reference.blur(); // for a second touch opening, lose focus
            }, 30000);
        }

    });
});
</script>

 <script>
       function customebudget() {
         let  budgetotion = document.getElementById("paymode").value;
           if(budgetotion == "Cheque") {
               $("#chequeno").show();
           } else {
                   $("#chequeno").hide();
           }
           if (budgetotion == "Cash"){
               $("#trackingNumber").hide();
               $("#referenceNumber").hide();
           }        
           else{
               $("#trackingNumber").show();
               $("#referenceNumber").show();
           }
            
       }
   </script>
    <script>
            $(document).ready(function () {
                    $("#chequeno").hide();

            });
                    
      </script>
      <script>
       var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
         $('.datepicker2').datepicker({
                    format: 'yyyy-M-dd',
                    autoclose: true,
                    todayHighlight: true,
                    startDate: '0m 0d',
                    container: '.pick2'
                }).datepicker('update', new Date());
</script>
<script>
    
     var baldb = "";
                     var totalprevamount = "";
                     function openPopUp(sno,expenseAmount,balAmount,amountPaid){
                        jQuery.noConflict(); 
                        
                        
                     //  alert("Sno:"+sno);
                     //   alert("expenseAmount:"+expenseAmount);
                      //  alert("Bal Amount:"+balAmount);
console.log(expenseAmount)
baldb = balAmount;
totalprevamount = amountPaid;
                         // var a = $(this).find('#visatype1').val();
                         // console.log("sgdgx"+a)
                        $('#bookingIdPop').val(sno);
                        $('#balenceAmount').val(balAmount);
                        $('#expenseAmount').val(expenseAmount);
                        $('#totalAmountPaid').val(amountPaid);
                        $('#myModal').modal('show');
                       // balanceAmountCalc(bal);
                    }
                    
                    
                    
                    function balanceAmountCalc(e) {
                     // var balanceAmount = $(e.target).parent().find('#balenceAmount').val();
                       var expenseAmount = $(e.target).parent().find('#expenseAmount').val();
                        const balenceAmountFix = $('#balenceAmount').val();
                       console.log("balenceAmountFix"+balenceAmountFix)
                       var paidAmount = Number(e.target.value);
                       var balanceUpdate = Number(baldb) - Number(paidAmount);
                               var totalPaidAmount = Number(totalprevamount) + Number(paidAmount);
                        if(Number(paidAmount) > Number(baldb)) {
          
             $(e.target).parent().find('#balenceAmount').val(balenceAmountFix);
           // $(e.target).parent().find('#balenceAmount').val(balenceAmountFix);
                            $(e.target).val('');
                            swal("Please enter paid amount less than balance expense");
                            return false;
                        } else {
                             $(e.target).parent().find('#balenceAmount').val(balanceUpdate);
                              $(e.target).parent().find('#totalAmountPaid').val(totalPaidAmount);
                        }
                    }
    
    </script>

</body>

</html>

