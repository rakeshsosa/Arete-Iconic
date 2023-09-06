<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

   
        <style>
            .formErrorArrow{
                display: none !important;
            }
            .formErrorContent{
                display: none !important;
            }
        </style>
        <script>
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

            <%
                Date dt = new Date();
            %>
        </script>

    </head>
  
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
  
   <main id="main" class="main">
       <div>
            <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link"  href="../finance/ledgerList.jsp">Ledger</a></li>
          <li class="nav-item"><a class="nav-link active"  href="../finance/costCenterMasterList.jsp">Cost Center</a></li>
<!--           <li class="nav-item"><a class="nav-link"  href="../finance/chartOfAccountsNew.jsp">Chart Of Accounts</a></li>-->
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
             <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
              <li class="nav-item"><a class="nav-link" href="../finance/accountingPeriodList.jsp">Accounting Period</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
                 <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
                     <li class="nav-item"><a class="nav-link" href="../finance/leadReferalList.jsp">Lead Referral</a></li>
        </ul>
            <br>
            <div class="text-end">
                 <a class="btn btn-primary btn-sm " href="../finance/costCenterMasterList.jsp"><i class="bi bi-eye "></i> Show Cost List</a>
                    </div>   </div>
 <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title">
                   <h5>Cost Center Master Form</h5>
                </div> 
     
 <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/chartOfAccountsSubmit.htm" enctype="multipart/form-data" commandName="coa">
                                     
                                      
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" autocomplete="off" required="" id="costcenterid" name="costcenterid" maxlength="10"  class="form-control capitalize validate[required]" value="" placeholder="fill">   
                                            <label class="control-label"><span style="color:red">*</span>Cost Center ID</label>
                                        </div>

                                         <div class="col-md-4 form-floating mb-3">
                                          <input type="text" autocomplete="off" id="costcentername" required  name="costcentername" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="fill"> 
                                           <label class="control-label"><span style="color:red">*</span>Cost Center Name</label>
                                         </div>

                                    
                                      <div class="col-md-4 form-floating mb-3">
                                             <select type="text" required autocomplete="off" id="applicablefor" name="applicablefor" maxlength="20"  class="form-control capitalize validate[required]" value="" placeholder="fill">
                                                <option value="" selected="">Select an Option</option>
                                                <option>Assets</option>
                                                <option>Expenditure</option>
                                                <option>Income</option>
                                                <option>Liabilities</option>                                              
                                            </select>
                                           <label class="control-label"><span style="color:red">*</span>Applicable For</label>
                                           </div>
      <div class="col-md-4 form-floating mb-3">
                                              <textarea class="form-control" id="remrks" name="remrks"></textarea>
                                           <label class="control-label">Remarks</label>
      </div>
                                       
                                       <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                      
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../finance/chartOfAccountsList.jsp"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                                        
                                    </form>
                             </div></div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

  <jsp:include page="../login/footer.jsp"/>
            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-group" class="tabbed_notifications"></div>
            </div>
   
            <script>
                $(document).ready(function () {
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
            </script>

    </body>
</html>