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
      
    </head>
   
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=GRN&tab=Invoice Screen&pagetype=list"/>
       </div>
 <div class="pagetitle">
        
    </div><!-- End Page Title -->

                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Tax Manager Form</h5></div> 
               <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/calendarPeriodFormSubmit.htm" enctype="multipart/form-data" commandName="calendarPeriod">
                                        <div id="spinner" class="spinner" style="display:none;">
                                            <img id="img-spinner" src="spinner.gif" alt="Loading"/>
                                        </div>
                                      
                                        <div class="col-md-4 form-floating mb-3">
                                         <select class="form-control capitalize validate[required]" id="parentCode" name="parentCode" type="text" value="" maxlength="10" placeholder="" data-original-title="Parent Code">                                                
                                              <option value="" selected="">Select an Option</option>

                                                  <option value="Incoming">Incoming</option>

                                                  <option value="Outgoing">Outgoing</option>

                                          </select>
                                              <label class="control-label"><span style="color:red">*</span>Tax Type</label>
                                        </div> 
  
                                         <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="calendarCode" required="" name="calendarCode" maxlength="10"  class="form-control capitalize validate[required]" value="" placeholder='fill'>   
                                         <label class="control-label"><span style="color:red">*</span>Tax Code</label>
                                         </div>
                                         <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="calendarCode" required="" name="calendarCode" maxlength="10"  class="form-control capitalize validate[required]" value="" placeholder='fill'>   
                                         <label class="control-label"><span style="color:red">*</span>Tax Name</label>
                                         </div>

                                        <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="description" required name="description" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Description"> 
                                       <label class="control-label"><span style="color:red">*</span>Tax Description</label>
                                        </div>
                                    <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="description" required name="description" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Description" onkeypress="return isNumberKey(event);"> 
                                       <label class="control-label"><span style="color:red">*</span>Tax Percentage</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                           <select type="text" autocomplete="off" id="accountGroup" name="accountGroup" maxlength="20" class="form-control capitalize validate[required]" value="" placeholder="" data-original-title="Account Group">
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Monthly">Monthly</option>
                                                <option value="Quarterly">Quarterly</option>
                                                <option value="Half-yearly">Half-yearly</option>
                                                <option value="Yearly">Yearly</option>                                              
                                            </select>
                                            <label class="control-label"><span style="color:red">*</span>Tax Filling Frequency</label>
                                          </div>
                                         <div class="col-md-4 form-floating mb-3 pick3">
                                           <input class="form-control datepicker3 capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>Tax Deadline</label>
                                         </div>
      
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../tenant/taxList.htm"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                                   
                                    </form>
                           </div></div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-group" class="tabbed_notifications"></div>
            </div>
  
    
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

            <script>
               
            
            
                $(document).ready(function () {
                    $('.datepicker3').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick3'
            })  
 $('.datepicker2').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick2'
            })
            
            
        
                    $("#calendarCode").change(function () {
                        var calendarCode = $(this).val();
                        $.ajax({
                            type: "POST",
                            url: '../Transactional/checkForDuplicates.htm',
                            data: {
                                clsname: 'CalendarPeriod',
                                fieldnnm: 'calendarCode',
                                fieldval: calendarCode
                            },
                            success: function (data) {
                                if (data == 'true') {
                                    $("#calendarCode").val('');
                                    alert("Record already exists,Please enter another..");
                                }
                            }

                        });
                    });

                });
                NProgress.done();


                function getDate1(val) {
                    var startDate = document.getElementById('startDate').value;
                    var endDate = document.getElementById('endDate').value;

                    var stDate = dateconvert(startDate);
                    var enDate = dateconvert(endDate);
                    //              
                    var st = moment(stDate).format("YYYY-MM-DD");
                    var en = moment(enDate).format("YYYY-MM-DD");


                    //               var today = document.getElementById("today").value;
                    var dateformat = /^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/;

                    if (startDate != "" && endDate != "") {
                        if (val == 'endDate')
                        {
                            if (st > en) {
                                alert("End date should be greater than Start Date..!!! ");
                                $('#endDate').val("");
                                return;
                            }
                        }
                        if (val == 'startDate')
                        {
                            if (st > en) {
                                alert("Start date should be smaller than End Date..!!!");
                                $('#startDate').val("");
                                return;
                            }
                        }

                        var startY = startDate.split("-")[2];
                        var endY = endDate.split("-")[2];

                        var opt1 = document.createElement('option');
                        var m = "F.Y " + startY + "-" + endY;
                        opt1.innerHTML = "F.Y " + startY + "-" + endY;
                        opt1.value = startY + '-' + endY;
                        //  opt1.selected = 'selected';
                        $('#periodType1').html(opt1);
//                            $('#periodType').append('<option value=' + startY - endY + '>F.Y ' + startY - endY + '</option>').prop("selected", true);
                        $('input[name="periodType"]').val(m);
                    }
                }

                function dateconvert(input) {

                    var date = input.split("/");
                    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                    for (var j = 0; j < months.length; j++) {
                        if (date[1] == months[j]) {
                            date[1] = months.indexOf(months[j]) + 1;
                        }
                    }
                    if (date[1] < 10) {
                        date[1] = date[1];
                    }
                    var formattedDate = date[2] + "/" + date[1] + "/" + date[0];

                    return formattedDate;
                }

            </script>

    </body>
</html>