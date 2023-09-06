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

          <style>
            .hideinputbg {
                border: none;
    background: no-repeat;
            }
        </style>
        
        <script>
            
            
            
            
            function openMeterWindow4() {
                  
                 
                  
                 // alert(newMeterType);
                  
               
                  
                myWindow = window.open("../Expenses/SelectExpensesCategoryList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            
            
            
             function openMeterWindow2() {
                  
                 var expenseCategoryName = document.getElementById("expenseCategoryName").value;
                  
                 // alert(newMeterType);
                  
               
                  
                myWindow = window.open("../Expenses/SelectExpensesTypeNameList.htm?expenseCategoryName="+expenseCategoryName+"", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            
            </script>


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Expense Tracking&tab=Booked Expenses Tracking"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Booked Expenses Tracking</h5></div> 
  

                        <div class="row mb-4">

                            <div class="col-lg-4 form-group  ">
                                <label class="control-label" ><span style="color:red">*</span> Select Expense Category Name</label>                                                                                                             
                              <div class="d-flex">
                                <input class="form-control " name="expenseTimeline" id="expenseCategoryName" >
                                <i class="fa fa-hand-pointer-o fa-2x ml-2" onclick="return openMeterWindow4();"></i>

                                <input type="hidden" class="form-control " name="expenseTimeline" id="expenseBookingId">
                            </div>  </div>
                             <div class="col-lg-4 form-group">
                                <label class="control-label" ><span style="color:red">*</span> Select Expense Type Name</label>                                                                                                             
                               <div class="d-flex">
                                <input class="form-control " name="expenseTimeline" id="expensesTypename">
                                <i class="fa fa-hand-pointer-o fa-2x ml-2" onclick="return openMeterWindow2();"></i>

                             </div> </div>
                             <div class="col-lg-3 form-group my-auto">
<!--                                  <label class="control-label" ></label> -->
                                        <button class="btn btn-primary btn-sm mt-3 me-3" onClick="lastApplyLeave(event);">Search</button>
                                        
                                    </div>
                        </div>
<!--                        <input class="form-control form-control-sm col-md-3 ml-auto my-2" type="text" id="search" placeholder="Type to search">-->
                        <table id="myTable"  class="table datatable table-hover table-bordered">
                            <thead>

                                <tr>
                                    <th>Payment Type</th>
                                    <th>Vendor Name</th>
                                    <th>Ref PO / Invoice</th>
                                    <th class="theader" style="">Amount</th>
                                    <th class="theader" style="">Payment Mode</th>
                                    <th class="theader" style="">Payment Due Date </th>
                                   <th class="theader" style="">Status</th>
                                    <th class="theader" style="">Action</th>
                                </tr>
                            </thead>

                            <tbody id="operationtable">
                            <tr>
                            <td >Test</td> 
                              <td class="center">Test</td>   
                            <td class="center">Test</td> 
                            <td class="center">Test</td>
                            <td class="center">Test</td> 
                            <td class="center">Test</td> 
                            <td>
                               <select class="form-select"  name="expensesCategoryNumber" maxlength="98" id="expno"  required class="form-select">
                                <option value="" disabled=" selected">Select an option</option>
                                  <option value="Full Payment">Full Payment</option>
                                    <option value="Partial Payment">Partial Payment</option>
                                 <option value="Payment Pending">Payment Pending</option>

                            </select>
                            </td>
                            <td class="text-nowrap">
                                <a href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>

                                    <a class="fa fa-edit fa-lg" href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=edit" data-toggle="tooltip" title="Edit">

                                    </a>

                                    <a href="../expensesManager/processPaymentForm.jsp" class="fa fa-money fa-lg" data-toggle="tooltip" title="Process Payment"></a>
                                    
                                   
                            
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
        $("#expenseTimeline").change(function(event){
                var selectedVal =$("#expenseTimeline").val();
                table.draw();
            
        })
        
        $('#my-table_filter').hide();
        

    });
    
    
    
    
    
    $(".status").on("click", function(event) {
     
    
        
     //  var status = $(this).val();
     //  var qtnno = $(this).closest('tr').find("#qtnno").text();
     //       openmymodal(status, qtnno);
        // var reason = prompt("Please write remarks!");
        
        
//        console.log(indexNo);
         swal("Would you like to confirm, Please write message", {
                            content: "input",
                            buttons:["Cancel", "OK"]
                          })
                          .then((value) => {
                             if (value == null || value == '') {
                                 event.preventDefault();
                                    return false;
                        }
                       else {
                              
                              $(this).closest('tr').find("#reason").text(value);
                              
                              var status = 'Completed';
                                var sno = $(this).closest('tr').find("#SINO").val();
                                var reason = value;
                                //alert(reason);

                                                $.ajax({
                                                    type: "POST",
                                                    url: "../Expenses/expensebookingStatus.htm",
                                                    data: {
                                                        status : status,
                                                        sno : sno,
                                                        reason : reason


                                                    },
                                                    dataType: "text",
                                                    success: function (data){
                                                        
                                                    }

                                                });
                                                }
                                            });

                           



                     



                     });
</script>

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
                                <input class="form-control " name="amountPaid" id="catname" required type="number" min="0" max="100000" oninput="balanceAmountCalc(event)" onchange="allowThreeDecimal(event)">
                                
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
                             <div class="col-lg-6 form-group  ">
                                <label class="control-label" ><span style="color:red">*</span> Tracking Number</label>                                                                                                             
                                <input class="form-control " name="trackingNumber" id="typename" required>
                            </div>
   
         <div class="col-lg-6 form-group pick2">
                                <label class="control-label" ><span style="color:red">*</span> Transaction Date</label>                                                                                                             
                               <input type="text" placeholder="" class="form-control datepicker2 form-for-valid" name="transactionDate" id="paymentPeriodFrom" required="">

                            </div>
    <div class="col-lg-6 form-group">
                                <label class="control-label" ><span style="color:red">*</span> Reference Number</label>                                                                                                             
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

<script>
       var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
         $('.datepicker2').datepicker({
                    format: 'yyyy-M-dd',
                    autoclose: true,
                    todayHighlight: true,
                  
                    container: '.pick2'
                }).datepicker('update', new Date());
</script>
 <script>
       function customebudget() {
         let  budgetotion = document.getElementById("paymode").value;
           if(budgetotion == "Cheque") {
               $("#chequeno").show();
           } else {
                   $("#chequeno").hide();
           }
            
       }
   </script>
      <script>
            $(document).ready(function () {
                    $("#chequeno").hide();

            });
                    
      </script>
<script>

                    function lastApplyLeave(e) {

                        e.preventDefault();
                     
                        var categoryName = document.getElementById("expenseCategoryName").value;
                        var typeName = document.getElementById("expensesTypename").value;
                      //  var billingCycle = document.getElementById("billingCycle").value;
                        if(categoryName == '' || typeName == ''){
                            swal("Please choose Category Name or Type Name");
                            return false;
                        }
                        $(".buttonRow").show();
                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../Expenses/fetchBookedList.htm',
                                    data: {
                                        categoryName : categoryName,
                                        typeName : typeName
                                    },
                                    success: function (data) {
                                        // alert("dates:"+data);
                                        if (data !== "No Data")
                                        {
                                         console.log(data);  
                                            var dat = data.split("/");
                                            for (i = 0; i < dat.length - 1; i++) {
                                                var test = dat[i].split(",")
                                               
                                                
                                                var expName = test[0];
                                               
                                                 var expAmoun = test[1];
                                                 var expAmount =  Number(expAmoun).toFixed(3);
                                                //var payDue = ;
                                                
                                                  var paymentDueDate1 = test[2];
                             
                                                 // var payDue =moment(paymentDueDate1).format("YYYY-MMM-DD");
                                                 var payDue =moment(paymentDueDate1).format("DD-MM-YYYY");
                                                
                                                
                                                
                                                var Status = test[3];
                                                
                                                var bookingId = test[4];
                                                
                                                var expenseBookingId = test[5];
                                                
                                              // alert("Expense Booking Id:"+expenseBookingId);
                                                
                                                var balAmount = test[6];
                                                
                                                var amountPaid = test[7];
                                                
                                                
                                                
                                                
                                               // document.getElementById("bookingId").value = bookingId;
                                          
                                                
                                           
                                                
           //  addOrderRow_test(houseNo, customerName, accountNumber, meterNumber, tariffType, tariffPrice, meterType, CustomerRegId, preoutstanding, prevreading,previousreadingDate,totalpayableforMonth, curntreading,totalpayable,customerType,unitsConsumed,amountPaid,balanceAmount,transactionDate);
               addOrderRow_test(expName,expAmount,payDue,Status,bookingId,expenseBookingId,balAmount,amountPaid);
            
            }
                                            var $rows = $('#operationtable tr');
                                            $('#search').keyup(function () { 
                                                var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

                                                $rows.show().filter(function () {
        //                                console.log($(this).children());
                                                    var text = $(this).html().replace(/\s+/g, ' ').toLowerCase();
                                                    return !~text.indexOf(val);
                                                }).hide();
                                            });
                                        }
                                        else {
        //                        $("#edetails").hide();
                                            alert("No Customer are there in this Option, Please Choose Other!!!");
                                            document.getElementById("publishFlag").value = data;
                                        }


                                    },
                                    error: function (error) {
        //                                                        alert(error);
                                    }

                                });

                        var categoryName = document.getElementById("catname").value;
                        var typeName = document.getElementById("typename").value;
                 
                       


                        $.ajax
                                ({
                                    type: "POST",
                                    url: '../billing/fetchBulkBillingCustomer.htm',
                                    data: {
                                        categoryName : categoryName,
                                        typeName: typeName
                                    },
                                    success: function (data) {
                                        data = data.split(",,,");
                                        if (data === 'No Data') {
                                            alert("All Data success");
                                        } else {
                                            document.getElementById("count").value = data[0];
                                        }
                                    }
                                });


                    }


                    var count = 0;
                //    function addOrderRow_test(houseNo, customerName, accountNumber, meterNumber, tariffType, tariffPrice, meterType, CustomerRegId, preoutstanding, prevreading,previousreadingDate,totalpayableforMonth, curntreading, totalpayable,customerType,unitsConsumed,amountPaid,balanceAmount,transactionDate) {
                    function addOrderRow_test(expName,expAmount,payDue,Status,bookingId,expenseBookingId,balAmount,amountPaid) {
                        
                       // alert("Exp Booking:"+expenseBookingId);

                        console.log(bookingId);
                        var table = document.getElementById("operationtable");
                        var slNo = table.rows.length;
                        var tr = table.insertRow(slNo);
                        tr.id = 'list_tr_' + slNo;
                        tr.innerHTML = '<td class="center" ><input class="dtinput  hideinputbg" type="text" readonly name="ecode" id="ecode" value="' + expName +'"></td><td class="center" ><input class="dtinput  hideinputbg" type="text" readonly  id="visatype1" name="customerName" value="'+expAmount+'" ></td><td class="center" ><input class="dtinput  hideinputbg" type="text" readonly  id="balAmount" name="customerName" value="'+balAmount+'" ></td> <td class="center"  ><input class="dtinput hideinputbg" type="text" readonly id="' + payDue + 'visatype1"  name="accountNumber" value="' + payDue +
                                '" ></td> <td class="center"  ><input class="dtinput hideinputbg" type="text" readonly id="' + Status + 'gridDate"  name="totalpayable" value="' + Status +
                                '" ></td> <td class="center"> <a class="btn btn-outline-info mx-1 btn-sm rounded" onclick="openPopUp('+bookingId+','+expAmount+','+balAmount+','+amountPaid+')" > <i class="fa fa-money" style="" title="Pay"> Pay</i> </a><a href="../Expenses/ExpenseTrackingView.htm?expenseBookingId='+expenseBookingId+'&action=view" class="btn btn-outline-success mx-1 btn-default-view btn-sm"><i class="fa fa-eye"> View</i></a> </td>';
                              
                                

                        count++;
                    }
                    
                    
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

                    function calculatePayable(event){
                        var curntreading = event.target;                      
                        var prevreading = $(curntreading).parent().prev().children().first().val();
                        var unitsconsumed = $(curntreading).parent().prev().children().eq(1);
                        var prevoutstanding = $(curntreading).parent().prev().prev().children().first().val();
                        var totalpayable = $(curntreading).parent().next().children().first();
                        var tariffprice = $(curntreading).next().val();
                        var totalmonth = $(curntreading).next().next();
        
                        var totalformonth = Number(event.target.value) - Number(prevreading);
                        var totalpay = (totalformonth  * Number(tariffprice)) + Number(prevoutstanding);
                        var totalforthismonth = (totalformonth  * Number(tariffprice));
                        if(totalpay > 100){
                            $(totalpayable).attr('style', 'border: 2px solid yellow !important');
                        } else {
                            $(totalpayable).css('border', 'none')
                        }
                           $(totalpayable).val(totalpay.toFixed(3));
                           $(totalmonth).val(totalforthismonth.toFixed(3));
                            $(unitsconsumed).val(totalformonth.toFixed(3));
                            var prevreading = $(curntreading).parent().prev().children().first().val();
                        var curntreadingval = $(curntreading).val();
                        var totalpayable = $(curntreading).parent().next().children().first();                      
                        if(Number(curntreadingval) < Number(prevreading)){
                            $(event.target).css('border', '2px solid red');
                        }else {
                            $(event.target).css('border', '2px solid black');
                        }                        
                    }
                    function checkCurrentReading(event){
  
                         var curntreading = event.target;
                        var prevreading = $(curntreading).parent().prev().children().first().val();
                        var curntreadingval = $(curntreading).val();
                        var totalpayable = $(curntreading).parent().next().children().first();
                        if(Number(curntreadingval) < Number(prevreading)){
                            alert("Current reading should not be less than previous reading!!");
                            $(totalpayable).val(0);
                            $(curntreading).val(0);
                            return false;
                        }
                    }
                    
                    function numberWithDigit(e) {
                        console.log(e.keycode);
                        var character = String.fromCharCode(e.keyCode)
                        var newValue = e.target.value + character;
                        if (isNaN(newValue) || hasDecimalPlace(newValue, 4)) {
                            e.preventDefault();
                            return false;
                        }
                    };


                    function hasDecimalPlace(value, x) {
                        var pointIndex = value.indexOf('.');
                        return  pointIndex >= 0 && pointIndex < value.length - x;
                    }
                    
                    
                    function getBillingCycle(){
                        // document.getElementById("billingCycle").value = '';
                    $("#billingCycle").children().remove();
                    var date = document.getElementById("date").value;
                    var dateFormat = moment(date).format("YYYY-MM");
//                         alert(dateFormat);
                    $.ajax
                            ({
                                type: "POST",
                                url: '../billing/fetchbillingCycleDate.htm',
                                data: {
                                    date: dateFormat
                                },
                                success: function (data) {
//                                     var date1 = moment(date).format("YYYY-MM-DD");
//                                    console.log(data);
                                    blocks1 = data.split(",");
                                    blocks1.pop();
//                                    console.log(blocks1);
                                    //var newar = [];
                                    var ilen1 = blocks1.length;
                                    $('<option>').val("").text("Select An Options").attr("disabled", true).attr("selected", true).appendTo('#billingCycle');
                                 for (var i = 0, j=1; i <= (ilen1 - 1); i++, j++) {
                                        var cycle1 = moment(blocks1[i]).format("YYYY-MM-DD") +" to "+ moment(blocks1[i+1]).format("YYYY-MM-DD");
//                                        console.log("new data "+cycle1);
                                        //$('<option>').val(cycle1).text(cycle1).appendTo('#billingCycle');
                                        $('<option>').val(cycle1).text("b"+j+" ("+cycle1+")").appendTo('#billingCycle');
//                                        newar.push(name);
                                        i += 1;
                                    }
                                    //                                                                        
                                    if (data === 'No Data') {
                                        alert("Data is Not Available please Check");
                                        document.getElementById("billingCycle").value = '';
                                        $("#billingCycle").children().remove();
                                    } 
                                    else {
//                                        document.getElementById("billingCycle").childNodes[0].innerHTML = data[0];
//                        var date = document.getElementById("date").value;
//                        var ab = moment(dateFormat, 'DD-MM-YYYY').date(10).format("DD-MM-YYYY");
//                        $('.datepicker1').datepicker({
//                            format: "dd-mm-yyyy",
//                            autoclose: true,
//                            todayHighlight: true,
//                        }).datepicker('update', ab);
//                                    }
                                }
                            }
                            });
                    }
                    
                    $(document).ready(function () {

                        



                    $("#select_all").on('click', function () {
        //                debugger;


                        if (this.checked) {
                            $('.checkbox').each(function () {
                                this.checked = true;
                            });
                        } else {
                            $('.checkbox').each(function () {
                                this.checked = false;
                            });
                        }
                    });
                    
                    
                   
                    function checkb()
                    {
                        var x = $("input[name = 'selectedvalues']:checked").length;
                        var date = document.getElementById("date").value;
                         var dateFormat = moment(date).format("YYYY-MM");
                        console.log(date);
                        if (parseInt(x) != 0)
                        {

                                $('#meterReadingForm').attr('action', "../billing/bulkBillingFormSubmit.htm?date='" + dateFormat + "'");
                             $('#meterReadingForm').submit();
        //                              alert("submitted");
                        } else {
                            alert("Please select atleast one checkbox");
                            return false;
                        }


                    }
                    $('#confirm').click(function (event) {
                        event.preventDefault();
                        var count = document.getElementById("count").value;
                        if ($("#select_all").prop("checked") == false) {
                            alert("Please select checkbox");
                            return false;
                        }
                       else if(confirm("Would you like to confirm ??")){
//                                  else if(confirm("Generated bill remailning= '" + count + "'  .Would you like to confirm ??")){
                            checkb();
                        } else {

                        }
                        
                    });
                    
    });




                </script>
<script type="text/javascript">
$(document).ready(function () {
     jQuery.noConflict();
    tippy('#information', {
        content: '<p>This page lists all the completely booked expenses & also displayes the payments due date. Also the expenses can be viewed, cancelled, & payments towards the expenses can be collected from the action column in the list.<p>\n\
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js" integrity="sha512-rmZcZsyhe0/MAjquhTgiUcb4d9knaFc7b5xAfju483gbEXTkeJRUMIPk6s3ySZMYUHEcjKbjLjyddGWMrNEvZg==" crossorigin="anonymous"></script>
</body>

</html>

