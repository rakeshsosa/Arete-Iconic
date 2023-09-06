<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
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
                if (jQuery("#calpForm").validationEngine('validate') === false) {
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

        </script>

    </head>
   
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
  
   <main id="main" class="main">
       <div>
            <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link"  href="../finance/ledgerList.jsp">Ledger</a></li>
          <li class="nav-item"><a class="nav-link"  href="../finance/costCenterMasterList.jsp">Cost Center</a></li>
<!--           <li class="nav-item"><a class="nav-link"  href="../finance/chartOfAccountsNew.jsp">Chart Of Accounts</a></li>-->
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
             <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
              <li class="nav-item"><a class="nav-link active" href="../finance/accountingPeriodList.jsp">Accounting Period</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
                 <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
               <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
                  <li class="nav-item"><a class="nav-link" href="../finance/leadReferalList.jsp">Lead Referral</a></li>
        </ul>
            <br>
            <div class="text-end">
                 <a class="btn btn-primary btn-sm " href="../finance/accountingPeriodList.jsp"><i class="bi bi-eye "></i> Show Account List</a>
                    </div>   </div>
 <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Accounting Period Form</h5></div> 
          
                                    <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/accountingPeriodFormSubmit.htm" enctype="multipart/form-data" commandName="accountingPeriod">
                                        <div id="spinner" class="spinner" style="display:none;">
                                            <img id="img-spinner" src="spinner.gif" alt="Loading"/>
                                        </div>
                                     
                                        <div class="col-md-4 form-floating mb-3">
                                         <select class="form-control validate[required]" required id="orgCode" name="orgCode" type="text" value="" maxlength="30" placeholder="Organization Code">                                                
                                                <option value="" selected="">Select an Option</option>
                                                <c:forEach items="${orgMasterList}" var="oml">
                                                    <option value="${oml.orgCode}">${oml.orgCode} ${oml.orgName}</option>
                                                </c:forEach>
                                                <!--<option value="Demo">Demo</option>-->
                                            </select>
                                            <span id="adesc" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Enter Organization Code</span>
                                        <label class="control-label"><span style="color:red">*</span>Organization Code</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                         <select class="form-control validate[required]" required id="calendarCode" name="calendarCode" type="text" value="" maxlength="30" placeholder="Calendar Code">                                                
                                                <option value="" selected="">Select an Option</option>
                                                <c:forEach items="${calendarPeriodList}" var="cpl">
                                                    <option value="${cpl.calendarCode}">${cpl.calendarCode} ${cpl.description}</option>
                                                </c:forEach>
                                                <!--<option value="Demo">Demo</option>-->
                                            </select>
                                            <span id="acode" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Enter Calendar Code</span>
                                         <label class="control-label"><span style="color:red">*</span>Calendar Code</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                           <select class="form-control validate[required]" required id="actionStatus" name="actionStatus" type="text" value="" maxlength="30" placeholder="Action Status">                                                
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Close">Closed</option>
                                                <option value="Open">Open</option>
                                            </select>
                                            <span id="acode" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Enter Action Status</span>
                                         <label class="control-label"><span style="color:red">*</span>Action Status</label>
                                        </div>
                                     
                                        <div class="col-md-4 form-floating mb-3 pick1">
                                         <input class="form-control capitalize datepicker1 validate[required]" required id="periodCode" name="periodCode" type="text" value="" placeholder="Select Start Date" maxlength="20" readonly="" placeholder="Period Code">
                                            <span id="acode" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Enter Period Code</span>
                                            <label class="control-label"><span style="color:red">*</span>Period Code</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3 pick2">
                                         <input class="form-control datepicker2 capitalize validate[required]" required id="startDate" name="startDate" type="text" value="" placeholder="Select Start Date" maxlength="20"  readonly="" placeholder="Start Date">
                                            <span id="sdate" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Select Start Date</span>
                                          <label class="control-label"><span style="color:red">*</span>Start Date</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3 pick3">
                                         <input class="form-control datepicker3 capitalize validate[required,custom[startenddateComp]]" required id="endDate" name="endDate" type="text" value="" maxlength="20" placeholder="Select End Date"  readonly="" placeholder="End Date">
                                            <span id="edate" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Select End Date</span>
                                        <label class="control-label"><span style="color:red">*</span>End Date</label>
                                        </div>
                                     
                                        <div class="col-md-4 form-floating mb-3">
                                          <select type="text" required autocomplete="off" id="accountingStatus" name="accountingStatus" maxlength="20"  class="form-control validate[required]" value="" placeholder="Status">
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Closed">Closed</option>
                                                <option value="Open">Open</option>
                                            </select>
                                            <span id="agrp" style="color: red; font: bold; display: none; text-align: right; margin-left: 160px;">Please Select Status</span>
                                       <label class="control-label"><span style="color:red">*</span>Status</label>
                                        </div>

                                       
                                 <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../finance/accountingPeriodList.jsp"  class="btn btn-danger" >Cancel</a>      
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
         
                NProgress.done();
   $('.datepicker1').datepicker({
                format: 'dd-M-yyyy',

                autoclose: true,
                todayHighlight: true,
                container: '.pick1'
            }).datepicker('update',new Date())
            
            
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
//                $("#periodCode").datepicker({
//                    changeMonth: true,
//                    changeYear: true,
//                    showButtonPanel: true,
//                    dateFormat: 'MM yy',
//                    onClose: function (dateText, inst) {
//                        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
//                        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
//                        $(this).datepicker('setDate', new Date(year, month, 1));
//                        var firstDay = new Date();
//                        firstDay.setFullYear(year, month, 1)
//                        var lastDay = new Date();
//                        lastDay.setFullYear(year, parseInt(month) + 1, 0);
//                        var fDay;
//                        var lDay;
//                        if (parseInt(firstDay.getMonth()) < 9) {
//                            fDay = "0" + firstDay.getDate() + "/0" + (parseInt(firstDay.getMonth()) + 1) + "/" + firstDay.getFullYear();
//                        }
//                        else {
//                            fDay = "0" + firstDay.getDate() + "/" + (parseInt(firstDay.getMonth()) + 1) + "/" + firstDay.getFullYear();
//                        }
//                        if (parseInt(lastDay.getMonth()) < 9) {
//                            lDay = lastDay.getDate() + "/0" + (parseInt(lastDay.getMonth()) + 1) + "/" + lastDay.getFullYear();
//                        }
//                        else {
//                            lDay = lastDay.getDate() + "/" + (parseInt(lastDay.getMonth()) + 1) + "/" + lastDay.getFullYear();
//                        }
//
//                        $("#startDate").val(fDay);
//                        $("#endDate").val(lDay);
//                    },
//                });
            </script>

    </body>
</html>