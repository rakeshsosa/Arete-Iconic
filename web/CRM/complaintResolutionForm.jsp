<%-- 
    Document   : complaintForm
    Created on : 10 Mar, 2016, 3:12:32 PM
    Author     : ebs-sdd05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css_2.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>Arête Property Management</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        
        <script type="text/javascript">
            function Validate($this)
            {
                var fl = document.getElementById("attachmentName").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }


            function selectcust()
            {
                var x = document.getElementById("division").value;


                if (x === '')
                {
                    alert("Please Select Division");
                    return false;
                }
                else {

                    myWindow = window.open("../CRM/selectCustomer.htm?division=" + x, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }

            function selectTenantDetails()
            {
                myWindow = window.open("../CRM/tenantDetailsForComplaint.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function mandTest() {
//                var llM = document.getElementById("llId").value;

                var tenantM = document.getElementById("tenantName").value &&
                        document.getElementById("date").value &&
                        document.getElementById("remarks").value;

                if (tenantM == '')
                {

                    alert("Please Fill Mandatory Fields.");

                    $('#tenantName').focus();
                    $('#date').focus();
                    $('#remarks').focus();
                    return false;
                }

                else {
                    document.forms["complaintForm"].submit();
                }
            }

            function test()
            {
                var remark = document.getElementById("remarks").value;
                var remark1 = document.getElementById("remarks1").value;
                var com = document.getElementById("compensation").value;
                var com1 = document.getElementById("compensation1").value;

                if (document.getElementById("remarks").value == "")
                {
                    alert("Enter Remarks");
                    return false;
                }
                else {

                    if (remark !== remark1 || com !== com1) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["complaintForm"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["complaintForm"].submit();
                    }
                }

            }
        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-sm">

        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Complaints&tab=Complaints&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Complaint Details</h5>
                                                </div>
                                   <form class="form-floating row" id="complaintForm" accept-charset="UTF-8" method="post" action="../CRM/complaintFormSubmit.htm" enctype="multipart/form-data">
    <form class="form-floating row" id="complaintForm" accept-charset="UTF-8" method="post" action="../CRM/complaintFormSubmit.htm" enctype="multipart/form-data">
        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
            <input name="tenantName" readonly="" placeholder="Fill" id="tenantName" maxlength="30" required="" type="text" class="form-control" value="${type.complaintCode}" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Complaint No </label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">
                Complaint Date
                <a class="control-label-required" style="color: red;">*</a>
            </label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
            <select class="form-control" id="complaintType" name="complaintType" value="">
                <option value="" readonly disabled="" selected="">Select your option</option>

                <option>Electricity</option>

                <option>water</option>
            </select>

            <label class="control-label">Complaint Type</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <!--<a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->

            <input type="text" readonly="" id="assetName1" name="assetName1" n="" class="form-control" placeholder="Fill" value="" />
            <!--                                                       <input type="hidden" id="propertyName" name="propertyName"   n class="form-control " value="">-->

            <label class="control-label">Property Name</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating my-auto">
            <!--<a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>-->

            &nbsp;&nbsp; <input type="checkbox" id="maintenanceCheck" name="assetName1" />

            <label class="control-label">Is Complaint related to Maintenance?</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating servRequestFild mb-3" style="">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Service Request No</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Asset/Service Name</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Service Area</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating  mb-3">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Complaint Description</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating">
            <!--                                                        <input name="tenantName" id="tenantName"  maxlength="30" required type="text" placeholder="Fill" class="form-control "  value="" > -->
            <select class="form-select" id="" readonly name="">
                <option>Choose</option>
                <option>Critical</option>
                <option>High</option>
                <option>Medium</option>
                <option>Low</option>
            </select>

            <label class="control-label">Priority</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input type="text" readonly placeholder="Fill" id="subAssetName1" name="subAssetName1" n="" class="form-control" value="" />
            <!--                                                        <input type="hidden" id="propertyNo" name="propertyNo"   n  class="form-control " value="">-->

            <label class="control-label">Unit Number</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating  mb-3">
            <input name="tenantName" readonly id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Complaint Handled By</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input class="form-control" readonly style="resize: none; overflow: hidden; overflow-wrap: break-word; height: 53px;" maxlength="200" rows="1" value="" name="remarks" id="remarks" type="text" placeholder="Fill">

            <label class="control-label" style="margin-top: 0px;">Remarks</label>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input name="tenantName" id="tenantName" maxlength="30" required="" type="text" placeholder="Fill" class="form-control" value="" />
            <input name="complaintCode" type="hidden" value="" />

            <label class="control-label">Approximate Resolution Time</label>
        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating pick2 mb-3">
            <input name="resDate" readonly type="text" class="form-control datepicker2" value="" />
            <label class="control-label">Resolved Date</label>
        </div>
          <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <input name="resDate" placeholder="fill" type="text" class="form-control" value="" />
            <label class="control-label">Description</label>
        </div>
         <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
            <select class="form-select" id="" name="">
                <option selected="" disabled>Select an option</option>
                <option value="Closed">Closed</option>
                <option value="Pending">Pending</option>
            </select>
            <label class="control-label">Status</label>
        </div>
    </form>
<!--</form>-->

    <c:if test="${action ne 'view' && action ne 'edit' }">
        <div class="col-md-9 col-sm-9 col-xs-12">
            <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
            <button type="submit" class="btn btn-primary" style="" onclick="return mandTest();"> Save </button>
            <a href="../CRM/complaintList.htm"  class="btn btn-danger"  style="">Cancel</a>
        </div>
    </c:if>

    <c:if test="${action eq 'edit'  }">

        <div class="col-md-9 col-sm-9 col-xs-12">
            <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
            <a href="../CRM/complaintList.htm" class="btn btn-danger">Cancel</a>
        </div>

    </c:if>
    </div> 
    </form>

                             </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
        <script>
            $(document).ready(function () {
                 var chkbox = $("#maintenanceCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".servRequestFild").show();
                    } else {
                        $(".servRequestFild").hide();
                    }
                $("#maintenanceCheck").change(function(event){
                     var chkbox = $("#maintenanceCheck").prop('checked');
                    
                    if(chkbox == true){
                        $(".servRequestFild").show();
                    } else {
                        $(".servRequestFild").hide();
                    }
                })
//                $("#complaintForm").validationEngine();
                
            });
            
             $(".datepicker2")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick2",
        })
        .datepicker("update", new Date());
            NProgress.done();
        </script>

    </body>

</html>
