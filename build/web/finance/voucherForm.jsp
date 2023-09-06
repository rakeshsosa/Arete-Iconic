<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
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
            .formErrorArrow{
                display: none !important;
            }
            .formErrorContent{
                display: none !important;
            }
        </style>
        <script>
            
            function selectAssetDetails()
            {
                myWindow = window.open("../finance/SelectLedgerInVoucherForm.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }
            
            function validationMsg() {
                if (jQuery("#coaForm").validationEngine('validate') === false) {
                    jQuery(".formErrorContent").css('display', 'none');
                    jQuery(".formErrorArrow").css('display', 'none');
                    alert("Please fill all the mandatory fields");
                }
            }
//            function checkValidations() {
//
//                var inputs = new Array(valid("accountCode", "accountCode"), valid("accountDesc", "accountDesc"), valid("startDate", "startDate"), valid("endDate", "endDate"), valid("parentCode", "parentCode"), valid("accountGroup", "accountGroup"));
//
//                var divs = new Array("acode", "adesc", "sdate", "edate", "pcode", "agrp");
//
//                if (checkFields(inputs, divs) === false) {
//                    return false;
//                }
//            }

            function manDt(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57) && (charCode < 43 || charCode > 43))
                {
                    alert("Enter Numeric value");
                    $("#startDate").val('');
                    return false;
                } else {
                    var dt = $("#startDate").val();
                    var finDt = "";
                    if (dt.match(/^\d{2}$/) !== null) {
                        if (dt > 31) {
                            alert("Invalid Date Entered");
                            $("#startDate").val("");
                        } else {
                            finDt = dt + '/';
                            $("#startDate").val(finDt);
                        }
                    } else if (dt.match(/^\d{2}\/\d{2}$/) !== null) {
                        var dtSp = dt.split("/");
                        if (dtSp[1] > 12) {
                            alert("Invalid Month Entered");
                            $("#startDate").val("");
                        } else {
                            finDt = dt + '/';
                            $("#startDate").val(finDt);
                        }
                    }
                }
            }
            function manDt1(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (charCode > 31 && (charCode < 48 || charCode > 57) && (charCode < 43 || charCode > 43))
                {
                    alert("Enter Numeric value");
                    $("#endDate").val('');
                    return false;
                } else {
                    var dt = $("#endDate").val();
                    var finDt = "";
                    if (dt.match(/^\d{2}$/) !== null) {
                        if (dt > 31) {
                            alert("Invalid Date Entered");
                            $("#endDate").val("");
                        } else {
                            finDt = dt + '/';
                            $("#endDate").val(finDt);
                        }
                    } else if (dt.match(/^\d{2}\/\d{2}$/) !== null) {
                        var dtSp = dt.split("/");
                        if (dtSp[1] > 12) {
                            alert("Invalid Month Entered");
                            $("#endDate").val("");
                        } else {
                            finDt = dt + '/';
                            $("#endDate").val(finDt);
                        }
                    }
                }
            }


        </script>
                   
    </head>

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />
                        <jsp:include page="../login/footer.jsp" />


                        <main id="main" class="main">
                            <div class="mt-3">
                                <ul class="nav nav-pills">
                                    <li class="nav-item "><a class="nav-link active" href="#">Voucher Form</a></li>
                                </ul>
                                <br>
                                <div class="text-end"> 
                                    <a class="btn btn-primary btn-sm " href="../finance/voucherList.htm"><i class="bi bi-eye"></i> Show Voucher Records</a>
                                </div>
                            </div>
                            <div class="pagetitle">
        
    </div>
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">
                                                
                                        <c:forEach items="${invoiceList}" var="indvList">
                <c:set value="${indvList.SNo}" var="SNo"/>
                <c:set value="${indvList.invoiceNo}" var="invoiceNo"/>
                 <c:set value="${indvList.invoiceType}" var="invoiceType"/>
                <c:set value="${indvList.customerName}" var="customerName"/>
                 <c:set value="${indvList.dueDate}" var="dueDate"/>
                <c:set value="${indvList.createdDate}" var="createdDate"/>
                 <c:set value="${indvList.totalPayableAmt}" var="totalPayableAmt"/>
                    
                </c:forEach>   
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                      <h5>Voucher Form</h5>
                                                </div>
       <form class="form-inline row" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../finance/voucherFormSubmit.htm" enctype="multipart/form-data" commandName="coa">
                                 
                                       
                                                 <div class="col-md-4 form-floating mb-3 pick2">
                                                <input type="text" id="startDate" name="creationDate"  class="form-control datepicker2 capitalize validate[required]"  placeholder="DD/MM/YYYY" value="" readonly="" />
                                                <label class="control-label"><span style="color:red">*</span>Voucher Date</label>       
                                                 </div>
<!--                                             <div class="col-md-4 form-floating mb-3">
                                            <input type="text" autocomplete="off" id="costcentername" placeholder="fill" required  name="voucherId" maxlength="50"  class="form-control capitalize validate[required]" value="" > 
                                        <label class="control-label"><span style="color:red">*</span>Voucher Number</label>
                                             </div>-->
                                             <div class="col-md-4 form-floating mb-3">
                                           <select type="text" required autocomplete="off" id="applicablefor" name="typeOfVoucher" maxlength="20"  class="form-select capitalize validate[required]" value="" >
                                                 <option value="" selected="">Select an Option</option>
                                                <option value="Bank Payment">Bank Payment</option>
                                                <option value="Bank Receipt">Bank Receipt</option>
                                                  <option value="Ledger Voucher">Ledger Voucher</option>
                                                 <option value="Contra">Contra</option>
                                                  <option value="Credit Note">Credit Note</option> 
                                                  <option value="Debit Note">Debit Note</option> 
                                                   <option value="Directors">Directors</option>
                                                    <option value="Interstate Purchase">Interstate Purchase</option>
                                                     <option value="Journal">Journal</option>
                                                  <option value="Journal Voucher">Journal Voucher</option>
                                                      <option value="Local Purchase">Local Purchase</option>
                                                          <option value="Office Journal">Office Journal</option>   
                                                          <option value="Payment">Payment</option>
                                                              <option value="Purchase">Purchase</option>
                                                                  <option value="Purchase Outstanding">Purchase Outstanding</option>
                                                                      <option value="Receipt">Receipt</option>
                                                                          <option value="Sale Outstanding">Sale Outstanding</option>
                                                                            <option value="Sales">Sales</option>
                                                                          <option value="Stock Journal">Stock Journal</option>
                                                          
                                                                                      
                                            </select>
                                                  <label class="control-label"><span style="color:red">*</span>Type Of Voucher</label>
                                           </div>
<!--                                             <div class="col-md-4 form-floating mb-3 pick1">
                                           <input type="text" id="startDate" name="startDate"  class="form-control datepicker1 capitalize validate[required]"  placeholder="DD/MM/YYYY" value="" readonly="" />
                                      <label class="control-label"><span style="color:red">*</span>Accounting Month & Year</label>   
                                             </div>-->
                                               
                                              
                                           
                                             <div class="col-md-4 form-floating mb-3">
                                                 <input type="text" autocomplete="off" id="costcentername" placeholder="fill" required  name="voucherNarration" maxlength="50"  class="form-control capitalize validate[required]" >
                                       <label class="control-label"><span style="color:red">*</span>Narration</label>
                                             </div>
                                             <div class="col-md-4 form-floating mb-3">
                                           <input type="text" placeholder="fill" autocomplete="off" id="costcentername" required  name="invoiceId" maxlength="50"  class="form-control capitalize validate[required]" value="${invoiceNo}" > 
<!--                                           <input type="hidden" placeholder="fill"  id="SNo" class="form-control" readonly name="SNo" value="${SNo}" maxlength="98">-->
                                          <label class="control-label">Invoice Number</label>
                                             </div>
                                             <div class="col-md-4 form-floating mb-3">
                                             <select type="text" required autocomplete="off" id="applicablefor" name="voucherAccountStatus" maxlength="20"  class="form-select capitalize validate[required]" value="" >
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Payable Account">Payable Account</option>
                                                <option value="Receivable Account">Receivable Account</option>
                                                                                      
                                            </select>
                                         <label class="control-label"><span style="color:red">*</span>Status</label>
                                             </div>
<!--                                                     <div class="col-md-4 form-floating mb-3">
                                           
                                         <input type="text" autocomplete="off" placeholder="fill" id="costcentername" required  name="costcentername" maxlength="50"  class="form-control capitalize validate[required]" value="" > 
                                         <label class="control-label"><span style="color:red">*</span>Created By</label>
                                                    </div>-->
<!--                                                 <div class="col-md-12 px-4">
                                                       <div class="row">
                                                        <div id="adiv1" class="col-md-6 form-group form-row p-0">
                                                            <label class="control-label col-md-5 text-right">Document Ref</label>  
                                                            <div class="col-md-7">
                                                  <input type="hidden" name="count" value="1">
                                                 <div class="input-group mb-3">
                                                               <input class="form-control pt-3" ${mand_status_10} id="assetOwnerType" name="assetOwnerType" onkeypress="return isNumberKey4(event)">
                                                                                                                              <input type="hidden" class="form-control" ${mand_status_10}  name="assetOwnerType1" id="assetOwnerType1" value="${list.assetOwnerType}" >
                                                            <div class="input-group-append">
                                                                 <div class="d-flex flex-column">
                                                             <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger ml-2 remove-me1">-</button>
                                                            <span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>
                                                           <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn btn-primary mt-1 ml-2 add-more" type="button">+</button>
                                                                 </div>  
                                                                    </div>
                                                      </div>
                                                   
                                            <div class="mt-1">  
                                                <span class="nowrap">(Click press + to add another property owner name)</span>  
                                            </div>      </div>    </div> 
                                            </div>
                                             </div>-->
            
                                           <div class="mt-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                                    <table style="width: 120%;" class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                             <th class="theader" style="">Dr / Cr</th>
                                                            <th class="theader" style="">Ledger Account Name</th>
                                                             <th class="theader" style="">Ledger Account Number</th>
                                                             <th class="theader" style="">Amount</th>
                                                             <th>Payment Type</th>
                                                             <th class="makeRecurring">Make Recurring</th>
                                                             <th>Transaction Reference Number</th>
                                                             <th>Remarks</th>
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                        <tr>
                                                                    <td>
                                                                <select class="form-select" name="drcrType" id="userid" >
                                                                 <option selected="" disabled="">Select an option</option>
                                                                 <option value="Dr">Dr</option>
                                                                  <option value="Cr">Cr</option>
                                                                </select>
                                                                    </td>
<td><input type="text" class="form-control" name="orgName" readonly="" placeholder="Select From List" id="ledgerAccountName" value="" onclick="return selectAssetDetails()" /></td>
<td><input type="text" class="form-control" name="ledgerNo" id="ledgerAccountNumber" value="" /></td>
<td><input type="text" class="form-control" name="voucherAmt" id="userid" value="" /></td>
<td>
    <select class="form-select" name="voucherAmtType" id="orgid">
<option selected="" disabled="">Select an option</option>
<option value="PDC">PDC</option>
<option value="Credit Card">Credit Card</option>
<option value="Debit Card">Debit Card</option>
<option value="Bank Transfer">Bank Transfer</option>
<option value="Cash">Cash</option>
    </select>
  </td>
  <td class="makeRecurring">
      <label><input type="radio" name="makeRecurring" id="makeRecurring" value="Yes"> Yes</label>
      <label><input type="radio" name="makeRecurring" id="makeRecurring" value="No"> No</label>
  </td>
<td><input type="text" class="form-control" name="transationRefNumber" id="ctCode" value="" /></td>
<td><input type="text" class="form-control" name="voucherRemarks" id="ctCode" value="" /></td>
<td align="center" class="tinput" style="vertical-align: middle;">
<!--    <a href="javascript:" class="btn btn-light border"><i class="fa fa-trash-o text-danger"></i> </a>-->
</td>

                                                        </tr>
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {
                                                                
                                                                var valid1 = true;
                                                      
                                                               

//                                                                $('#resourcetable tr').each(function () {
//                                                                        var a = $(this).find('#expno').val();
//                                                                        if (a === expno) {
//                                                                            
//                                                                            e.preventDefault();
//                                                                            swal('Selected record already exists in grid.');
//                                                                            valid1 = false;
//                                                                            return false;                                                                        
//                                                                        } else {
//                                                                            return true;
//                                                                        }
//                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                  
                                                                    var slNo1 = table.rows.length;
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                    tr.innerHTML = '<td><input type="text" class="form-control" name="userName" id="userid"> </td>\n\
                                         <td><input type="text" readonly placeholder="Select From List" class="form-control" name="orgName"  id="orgid"> </td>  \n\
<td><input type="text"  class="form-control" name="costTypeName"  id="ctCode"> </td> \n\<td><input type="text" class="form-control" name="userName" id="userid"> </td>\n\
                                         <td><input type="text"  class="form-control" name="orgName"  id="orgid"> </td>  \n\
<td><input type="text"  class="form-control" name="costTypeName"  id="ctCode"> </td> \n\<td><input type="text"  class="form-control" name="costTypeName"  id="ctCode"> </td> \n\
\n\<td align="center" class="tinput" style="vertical-align: middle;">\n\
<a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';
                                    
                                                                    count++;

                                                                } else {
                                                                    return;
                                                                }
                                                            }

                                                            function removeRow12(id) {    
                                                                 
                                                                count--;
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                    var lr = table.rows[i];
                                                                    if (lr.id == 'list_tr_' + id) {
                                                                        table.deleteRow(i);
                                                                        if (table.rows.length == 0) {
                                                                            $('#uomName').prop('readonly', false);
                                                                        }
                                                                        return;
                                                                    }
                                                                }
                                                           }
                                                             function checkGrid(e) {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                      e.preventDefault();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                    </table>                                                  
                                                </div>
<!--                                                             <div class="col-lg-12 mt-3">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>

                                                   </div>-->
                                  
                                      <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                      
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../finance/voucherList.htm"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                                  
                                    </form>
            
  </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
            <script>
                $(document).ready(function () {
                    $(".makeRecurring").hide()
                    $('.datepicker2').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick2'
            }).datepicker('update',new Date())
            
            
               $('.datepicker3').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick3'
            }).datepicker('update',new Date())

                    $("#accountCode").change(function () {
                        var accountCode = $(this).val();
                        $.ajax({
                            type: "POST",
                            url: '../Transactional/checkForDuplicates.htm',
                            data: {
                                clsname: 'ChartOfAccounts',
                                fieldnnm: 'accountCode',
                                fieldval: accountCode
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    $("#accountCode").val('');
                                    alert("Record already exists,Please enter another..");
                                }
                            }

                        });
                    });
                    $("#accountDesc").change(function () {
                        var accountDesc = $(this).val();
                        $.ajax({
                            type: "POST",
                            url: '../Transactional/checkForDuplicates.htm',
                            data: {
                                clsname: 'ChartOfAccounts',
                                fieldnnm: 'accountDesc',
                                fieldval: accountDesc
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    $("#accountDesc").val('');
                                    alert("Record already exists,Please enter another..");
                                }
                            }

                        });
                    });

                    $("#startDate").click(function () {
                        var selectStartDate = $("#startDate").val().split("/");
                        var curStartDate = $("#calStartDate").val().split("-");
                        var curEndDate = $("#calEndDate").val().split("-");
                        var selectEndDate = $("#endDate").val().split("/");
                        
                        if (selectStartDate[2] < curStartDate[2] || selectStartDate[2] > curEndDate[2]) {
                            alert("Select Proper Date");
                            $('#startDate').val('');
                        } else if (selectStartDate[1] < curStartDate[1] && selectStartDate[2] == curStartDate[2]) {                           
                            alert("Select Proper Date");
                            $('#startDate').val('');
                        } else if (selectStartDate[0] < curStartDate[0] && selectStartDate[1] == curStartDate[1]  ) {
                            alert("Select Proper Date");
                            $('#startDate').val('');             
                        } else if ((selectEndDate[1] < selectStartDate[1] && selectEndDate[2] == selectStartDate[2]) && selectEndDate[0] < selectStartDate[0]) {                           
                            alert("Select Proper Date");
                            $('#startDate').val('');
                        }
                        

                        
                    });

                    $("#endDate").click(function () {
                        var selectEndDate = $("#endDate").val().split("/");
                        var curStartDate = $("#calStartDate").val().split("-");
                        var curEndDate = $("#calEndDate").val().split("-");
                        var selectStartDate = $("#startDate").val().split("/");
                        
                        if (selectEndDate[2] < curStartDate[2] || selectEndDate[2] > curEndDate[2]) {                           
                            alert("Select Proper Date");
                            $('#endDate').val('');
                        } else if (selectEndDate[1] > curEndDate[1] && selectEndDate[2] == curEndDate[2] ) {
                            alert("Select Proper Date");
                            $('#endDate').val('');
                        } else if (selectEndDate[0] > curEndDate[0] && selectEndDate[1] == curEndDate[1] ) {                           
                            alert("Select Proper Date");
                            $('#endDate').val('');
                        } else if ((selectEndDate[1] < selectStartDate[1] && selectEndDate[2] == selectStartDate[2]) && selectEndDate[0] < selectStartDate[0]) {                           
                            alert("Select Proper Date");
                            $('#endDate').val('');
                        }
                    });
                });

                NProgress.done();
                
                   var next = 1;
            $(document).on("click", ".add-more", function (e) { 
                                                             
                e.preventDefault();
                var addto = "#adiv" + next;
                next = next + 1;
                var newIn = '<div id="adiv' + (next) + '" class="col-md-6 form-group form-row p-0"><label class="control-label col-md-5 text-right"><span style="color:red">*</span>Document Ref</label><div class="col-md-7"> <div class="input-group mb-3"><div class="input-group-prepend"></div><input style="display: inline!important;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="assetOwnerType" type="text" placeholder="" required=""><div class="input-group-append"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn ml-2 btn-danger remove-me">-</button></div></div></div></div>';
                var newInput = $(newIn);
                $(addto).after(newInput);
                //                $("#field" + next).attr('data-source', $(addto).attr('data-source'));
                $("#count").val(next);

            });

            $(document).on("click", '.remove-me', function (e) {
                var rmvId = '' + this.id;
                var fieldNum = rmvId.substring(6);
                var fieldID = "#field" + (fieldNum);
                var nameFieldID = "#attachname" + (fieldNum);
                var btnb = "#btnb" + (fieldNum);
                var errpgh = "#field" + (fieldNum) + "Error";
                var adiv = "#adiv" + (fieldNum);
                $(this).remove();
                $(fieldID).remove();
                $(nameFieldID).remove();
                $(btnb).remove();
                $(errpgh).remove();
                $(adiv).remove();
                next = next - 1;
            });
            
            $("#orgid").on('change', function (e) {
                if(e.target.value == "PDC") {
                     $(".makeRecurring").show()
                } else {
                     $(".makeRecurring").hide()
                }
            })
            </script>
                         </body>

   
</html>