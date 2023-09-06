<%@page import="java.text.SimpleDateFormat"%>
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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.10/css/select2.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
       
                 
   <style>
            table {
                table-layout: fixed;
                /*            word-wrap: break-word;*/
            }
            .iti {
                width: 100%;
            }
                    .mobile-p {
                padding: 0 3rem;
            }
            .h-360 {
               height:360px;
            }
            @media only screen and (max-width: 600px) {
                  .mobile-p {
                padding: 0 1rem !important;
            }
             .h-360 {
               height: fit-content;
            }
            }
          
/*
 *  STYLE 7
 */

.table-responsive::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
  border-radius: 10px;
}

.table-responsive::-webkit-scrollbar
{
  width: 10px;
  height: 10px;
  background-color: #F5F5F5;
}
@media only screen and (max-width: 600px) {
    table thead {
        white-space: nowrap !important;
    } 
    .uomType,.itemrate, .itemQty  {
        width: 50px  !important;
    }
    #itemSno {
        width: 30px;
    }
}
.table-responsive::-webkit-scrollbar-thumb
{
  border-radius: 10px;
  background-image: -webkit-gradient(linear,
                     left bottom,
                     left top,
                     color-stop(0.44, rgb(122,153,217)),
                     color-stop(0.72, rgb(73,125,189)),
                     color-stop(0.86, rgb(28,58,148)));
}


/*----------------*/
        </style>
          <style>

/*         .modal-body .table tr,  .modal-body .table td{
            border-top: 1px dashed black !important;
        }*/
         .modal-body .form-group {
            margin-bottom: 0px!important;
        }
        .form-control-plaintext{
            padding: 0 !important;
        }
        .modal-body .control-label{
            padding-top: 0 !important;
        }
       .modal-body .invoice-body-notes{
             border-bottom: 20px solid #1b82c5;
             margin-bottom: 50px;
        }
        .modal-body select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            text-indent: 1px;
            text-overflow: '';
             pointer-events: none;
         }
         .modal-body input{
             pointer-events: none;
         }
                
        @media only screen and (max-width: 600px) {
            .invoice-detail-summary{
                width: 50% !important;
            }
            .invoice-detail-rate{
                width: 15% !important
            }
            .invoice-detail-quantity{
                width: 10% !important
            }
            .invoice-detail-amount{
                width: 25% !important;
            }
            .invoice-body-list{
                padding: 0 !important;
            }
/*            .table td, .table th{
                padding: 0 !important;
            }*/
            .invoice-totals .row{
                text-align: center !important;
                display: flex !important;
            }
            .invoice-totals .row .col-lg-6{
                width: 50%;
            }
            .tax-summary-container .incsummary {
                position: absolute;
                left: -7px;
            }

        }
    </style>
        <script>
            
            function valueChecks1(e) {
                
//                 e.preventDefault();
//                  $("#coustmermnForm").submit();

                  var x = $('#toname').val() &&
                        $('#toemail').val() &&
                        $('#toaddress').val() &&
                        $('#tophone').val() &&
                        $('#toname').val()
//                        $('#toemail').val() &&
//                        $('#toaddress').val() &&
//                        $('#tophone').val() ;
//                        $('#itemdesc').val() ,
//                        $('#itemrate').val() ,
//                        $('#itemqty').val() ,
//                        $('#subTotalInput').val() ,
//                        $('#taxpercent').val(),
//                        $('#total').val(),
//                        $('#baldue').val(),
//                        $('#itemdetails').val();

                e.preventDefault();
                var category0 = document.getElementById('category0').value;
                var productdropdown0 = document.getElementById('productdropdown0').value;
                var uomType = document.getElementById('uomType').value;
                var itemrate0 = document.getElementById('itemrate0').value;
                var itemqty = document.getElementById('itemqty').value;

                var servicecategory = document.getElementById('servicecategory').value;
                var serviceproductdropdown = document.getElementById('serviceproductdropdown').value;
                var servicetimespan = document.getElementById('servicetimespan').value;
                var serviceitemrate0 = document.getElementById('serviceitemrate0').value;
                var serviceitemqty = document.getElementById('serviceitemqty').value;


                var prodRow = category0 != 'Select An Option' && productdropdown0 != 'Select An Option' && uomType != 'Select An Option' && itemrate0 != 0 && itemqty != 0;
                var servRow = servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option' && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
//               console.log(servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option'&& Number(serviceitemrate0) != 0);
                if (x == "" || x == null || x == '') {
                    swal("Enter Customer Details (Bill To) in the Invoice.");
                    return false;
                } else if (!prodRow && !servRow) {
                    swal("You cannot save an invoice without selecting at least one product or a service. Kindly include either one product or service before saving");
                    return false;
                } else {
//                    $("#coustmermnForm").attr('target', '_blank').submit();
//                    $("#coustmermnForm").attr('target', '_self');
                     $("#coustmermnForm").submit();
                }





            }
            
             function valueChecks2(e) {
                
//                 e.preventDefault();
//                  $("#coustmermnForm").submit();

                 
                 
                 
                 var x = $('#toname').val() &&
                        $('#toemail').val() &&
                        $('#toaddress').val() &&
                        $('#tophone').val() &&
                        $('#toname').val()
//                        $('#toemail').val() &&
//                        $('#toaddress').val() &&
//                        $('#tophone').val() ;
//                        $('#itemdesc').val() ,
//                        $('#itemrate').val() ,
//                        $('#itemqty').val() ,
//                        $('#subTotalInput').val() ,
//                        $('#taxpercent').val(),
//                        $('#total').val(),
//                        $('#baldue').val(),
//                        $('#itemdetails').val();

                e.preventDefault();
                var category0 = document.getElementById('category0').value;
                var productdropdown0 = document.getElementById('productdropdown0').value;
                var uomType = document.getElementById('uomType').value;
                var itemrate0 = document.getElementById('itemrate0').value;
                var itemqty = document.getElementById('itemqty').value;

                var servicecategory = document.getElementById('servicecategory').value;
                var serviceproductdropdown = document.getElementById('serviceproductdropdown').value;
                var servicetimespan = document.getElementById('servicetimespan').value;
                var serviceitemrate0 = document.getElementById('serviceitemrate0').value;
                var serviceitemqty = document.getElementById('serviceitemqty').value;


                var prodRow = category0 != 'Select An Option' && productdropdown0 != 'Select An Option' && uomType != 'Select An Option' && itemrate0 != 0 && itemqty != 0;
                var servRow = servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option' && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
//               console.log(servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option'&& Number(serviceitemrate0) != 0);
                if (x == "" || x == null || x == '') {
                    swal("Enter Customer Details (Bill To) in the Invoice.");
                    return false;
                } else if (!prodRow && !servRow) {
                    swal("You cannot save an invoice without selecting at least one product or a service. Kindly include either one product or service before saving");
                    return false;
                } else {
                    $("#coustmermnForm").submit();
                }



            }
            
            
            function valueChecks(e) {
                var x = $('#toname').val() &&
                        $('#toemail').val() &&
                        $('#toaddress').val() &&
                        $('#tophone').val() &&
                        $('#toname').val()
//                        $('#toemail').val() &&
//                        $('#toaddress').val() &&
//                        $('#tophone').val() ;
//                        $('#itemdesc').val() ,
//                        $('#itemrate').val() ,
//                        $('#itemqty').val() ,
//                        $('#subTotalInput').val() ,
//                        $('#taxpercent').val(),
//                        $('#total').val(),
//                        $('#baldue').val(),
//                        $('#itemdetails').val();
            $("#coustmermnForm").submit();
                e.preventDefault();
                var category0 = document.getElementById('category1').value;
                var productdropdown0 = document.getElementById('productdropdown1').value;
                var uomType = document.getElementById('uomType').value;
                var itemrate0 = document.getElementById('itemrate1').value;
                var itemqty = document.getElementById('itemqty1').value;

                var servicecategory = document.getElementById('servicecategory1').value;
                var serviceproductdropdown = document.getElementById('serviceproductdropdown1').value;
//                var servicetimespan = document.getElementById('servicetimespan').value;
                var serviceitemrate0 = document.getElementById('serviceitemrate1').value;
                var serviceitemqty = document.getElementById('serviceitemqty1').value;


                var prodRow = category0 != 'Select An Option' && productdropdown0 != 'Select An Option' && uomType != 'Select An Option' && itemrate0 != 0 && itemqty != 0;
                var servRow = servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
//               console.log(servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option'&& Number(serviceitemrate0) != 0);
                if (x == "" || x == null || x == '') {
                    swal("Enter Customer Details (Bill To) in the Invoice.");
                    return false;
                } else if (!prodRow && !servRow) {
                    swal("You cannot save an invoice without selecting at least one product or a service. Kindly include either one product or service before saving");
                    return false;
                } else {
                    $("#coustmermnForm").submit();
                }
            }



            function openWindow(e) {

                var customerType = e.target.value;
//                 alert(e.value);
                //                alert(customerType);
//                e.preventDefault();
//                if (customerType == 'B2C')
//                {
//                    myWindow = window.open("../invoice/SelectCompanyDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//                    document.getElementById("customCompanyName").value = "";
//                }
//                if (customerType == 'B2B')
//                {
//                    myWindow = window.open("../invoice/SelectB2BCustomerDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//
//                }
//
//                if (customerType == 'Representative')
//                {
//                    myWindow = window.open("../invoice/SelectB2BRepresantativeCustomerDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//
//                }

             //   myWindow = window.open("../invoice/SelectB2BRepresantativeCustomerDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                  myWindow = window.open("../inventory/SelectB2BCustomerDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            }


            function openWindow1() {


                myWindow = window.open("../invoice/productAndServicePopList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");





            }

            function browseFile(slno) {
                document.getElementById('field' + slno).click();
            }

            function setAttachName(slno) {

                //   swal("attachemt:"+slno);

                var filenm = document.getElementById('field' + slno).value;
                // swal("FileName Attchment:"+filenm);
                var filename = filenm.replace(/^.*[\\\/]/, '');
                var imgTextArr = filename.split(".");
                var imgTxtFTb = imgTextArr[0];
                if (parseInt(imgTxtFTb.length) > 45) {
                    imgTxtFTb = imgTxtFTb.substring(0, 45);
                }
                document.getElementById('attachname' + slno).value = imgTxtFTb;

                //    swal("Set Attchment:"+imgTxtFTb);

            }

            function readURL3(input) {
                //$('#blah1').show();
                var imageId = input.id;
                checkAttachmentSizefile(input, imageId);
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

//        reader.onload = function (e) {
//            $('#blah1')
//                    .attr('src', e.target.result)
//                    .width(120)
//                    .height(120);
//        };

                    reader.readAsDataURL(input.files[0]);
                }
            }

            function checkAttachmentSizefile(obj, id1)
            {
                var size = ($("#" + id1)[0].files[0].size) / (200 * 230);
                if (parseFloat(size) > 45)
                {
                    swal("Attached file is exceeding file size. Please upload file size less than 2 MB.");
                    $("#" + id1).val("");
                } else {
                    ValidateAttachment(obj, id1);
                }
            }
            function ValidateAttachment(obj, id1)
            {
                var image = document.getElementById(id1).value;
                if (image != '') {
                    var checkimg = image.toLowerCase();
                    if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                        swal("Please upload files with the following extensions only .jpg, or .png, or .jpeg");
                        $("#" + id1).focus();
                        $("#" + id1).val("");
                        return false;
                    }
                }
                return true;
            }

            function attachMand(id, id1) {
                var attachname = document.getElementById(id1).value;
                var val = document.getElementById(id).value;
                if (attachname === '' || attachname === null) {
                    if (val === '' || val === null) {
                        swal("Attach a file")
                        document.getElementById(id1).value = "";
                        return false;
                    } else {
                        return true;
                    }

                }
            }





        function openMeterWindow4() {
                  
                 
                  
                 // alert(newMeterType);
                  
               
                  
                myWindow = window.open("../invoice/SelectOrderList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }

        </script>
        
              <script> 
                  function openProductWindow(e) {
e.preventDefault()
                  myProductWindow = window.open("../contract/selectProductList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            } 
                      function openProductPackage(e) {
e.preventDefault()
                  myProductPackage = window.open("../contract/selectProductPackageList.jsp", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            } 
                   function openServiceWindow(e) {
e.preventDefault()
                  myServiceWindow = window.open("../contract/selectServiceList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            }
                      function openServicePackage(e) {
e.preventDefault()
                  myServicePackage = window.open("../contract/selectServicePackageList.jsp", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            }
    </script>
    </head>
            
             <body class="nav-md">
      
       
                <jsp:include page="../login/menu.htm"/>
               
                                
                                   <main id="main" class="main">
       <div>
           <jsp:include page="../login/headerlink.htm?submodule=Property Profile&tab=Property Profile&pagetype=form"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
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
                <div class="card-title"><h5>Processed Invoice Form</h5></div>
         <form id="coustmermnForm" autocomplete="off" name="frm" accept-charset="UTF-8" method="post" action="../finance/processedInvoiceFormSubmit.htm" enctype="multipart/form-data">
                            
                                        <div class="invoice-main-container">
                                            <div class="container-fluid">
                            
                                                        <div class="row">
                                             <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="bookID" class="form-control" readonly name="bookID" value="${invoiceNo}" maxlength="98" required>
                                                        <input type="hidden" id="SNo" class="form-control" readonly name="SNo" value="${SNo}" maxlength="98" required>
                                                        <label for="groupname"><span style="color:red">*</span>Invoice Number</label>
                                                    </div>   
                                                                <div class="col-md-4 form-floating mb-3">
                                                                 <input type="text" placeholder="Org Name" id="bookID" class="form-control" readonly name="bookID" value="${invoiceType}" maxlength="98" required>
                                                 <%--        <select class="form-select" name="bookID" placeholder="Category" iid="bookID" maxlength="98" value="${invoiceType}" required>
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                          <option value="Rent">Rent</option>
                                                                          <option value="Service">Service</option>
                                                                        <option value="Utility Tax">Utility Tax</option>
                                                                        <option value="Tax">Tax</option>
                                                                        <option value="Others">Others</option>
                                                                    </select>     --%>
                                                        <label for="groupname"><span style="color:red">*</span>Invoice Type</label>
                                                    </div>   
                                                              
                                                  
                                                        <div class="col-md-4 form-floating mb-3 pick">
                                                             <input type="text" class="form-control datepicker" style="pointer-events: none;" readonly="" id="date" name="date" placeholder="" value="${createdDate}">
                                                          <label class="control-label" for="date">Invoice Date</label>
                                                        </div>
                                                    
                                                            
                                                           
                                                        <input type="hidden" class="form-control" readonly  id="cdate" name="cdate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${createdDate}"/>">

<!--             <div class="col-md-4 form-floating mb-3">
           <input type="text" placeholder="Org Name" id="bookID" class="form-control"  name="bookID" maxlength="98" required>
          <label for="groupname"><span style="color:red">*</span>Property Name</label>
       </div>
                                                         <div class="col-md-4 form-floating mb-3">
           <input type="text" placeholder="Org Name" id="bookID" class="form-control"  name="bookID" maxlength="98" required>
          <label for="groupname"><span style="color:red">*</span>Unit Name / Unit Number</label>
       </div>-->
      
                         <div class="col-md-4 form-floating mb-3 pick55">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control datepicker55" readonly="" id="QuoExpiryDate" name="QuoExpiryDate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${dueDate}"/>">  <%-- <%= (new SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%> --%>
                    <label class="control-label" for="QuoExpiryDate">Due Date</label>
                    </div>
                    
               <div class="col-md-4 form-floating mb-3">
               <input type="text" placeholder="Org Name" id="bookID" class="form-control" readonly name="bookID" value="${customerName}" maxlength="98" required>
               <label for="groupname"><span style="color:red">*</span>Customer Name</label>
           </div>  
                           <div class="col-md-4 form-floating mb-3 pick56">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control datepicker56" readonly="" id="QuoExpiryDate" name="paymentDate" placeholder="" value="<%= (new SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%>">
                    <label class="control-label" for="QuoExpiryDate">Payment Date</label>
                    </div>
                    <div class="col-md-4 form-floating mb-3">
                                                         <select class="form-select" name="paymentType" placeholder="Category" id="bookID" maxlength="98" required>
                                                                        <option value="" selected="selected" disabled>Select An Option</option>
                                                                        <option value="Cheque">Cheque</option>
                                                                        <option value="Cash">Cash</option>
                                                                           <option value="Credit Card">Credit Card</option>
                                                                        <option value="Master Card">Master Card</option>
                                                                    </select>
                                                        <label for="groupname"><span style="color:red">*</span>Payment Type</label>
                                                    </div>   
                      <div class="col-md-4 form-floating mb-3">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control" id="QuoExpiryDate" name="transactionRefNo" placeholder="fill">
                    <label class="control-label" for="QuoExpiryDate">Transaction Ref Number</label>
                    </div>
<!--                     <div class="col-md-4 form-floating mb-3">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control" readonly="" id="QuoExpiryDate" name="QuoExpiryDate" placeholder="fill">
                    <label class="control-label" for="QuoExpiryDate">Cash Receipt Number</label>
                    </div>
                     <div class="col-md-4 form-floating mb-3">
                                                          
                         <input  style="background: #fff;" type="text" class="form-control" readonly="" id="QuoExpiryDate" name="QuoExpiryDate" placeholder="fill">
                    <label class="control-label" for="QuoExpiryDate">Cheque Number</label>
                    </div>
                           <div class="col-md-4 form-floating mb-3">
                                                                   <textarea type="text" placeholder="Org Name" id="bookID" class="form-control"  name="bookID" maxlength="98" required></textarea>
                                                        <label for="groupname"><span style="color:red">*</span>Description</label>
                                                    </div> -->
                 <div class="col-md-4 form-floating mb-3">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control" readonly="" id="QuoExpiryDate" name="QuoExpiryDate" value="${totalPayableAmt}" placeholder="fill">
                    <label class="control-label" for="QuoExpiryDate">Total Payable Amount</label>
                    </div>
                    <div class="col-md-4 form-floating mb-3">
                                                          
                        <input  style="background: #fff;" type="text" class="form-control" id="QuoExpiryDate" name="amountPaid" placeholder="gill">
                    <label class="control-label" for="QuoExpiryDate">Amount Paid</label>
                    </div>
                    
                    
<!--                                                            <div class="x_title mt-3" style=" text-align: left !important;text-transform:uppercase;">
            <h3 style="font-size: 22px !important; font-weight: bold !important;">Payment History</h3>
                        </div>
                        <table class="table table-condensed" id="servicemyTable" style="border: 1px solid #dee2e6;">
                                                <thead class="thead">
                                                    <tr class="">
                                                        <th>Payment Date</th>
                                                        <th>Description</th>
                                                        <th>Total Payable Amount</th>
                                                        <th>Payment Type</th>
                                                        <th>Reference Number</th>
                                                        <th>Amount Paid</th>
                                                    </tr>
                                                    
                                                </thead>
                                                <tbody class="invoice-items">
                                              
                                                </tbody>

                                            </table>
                    
                    -->
                     <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                       
                
<!--                                 <input type="hidden" name="hdnbt" for="saveDraft"/>-->
<input type="submit" id="saveDraft" class="btn btn-primary ms-1" name="first" value="Save">
                            
                         
                            
                                <a href="../finance/processedInvoicesList.htm"
                                    class="btn btn-danger ms-1">Cancel</a>
                                    
                                  
                                    
                            
                        </div>
      </div>
</div> </div>
   
                                            
                                            
               
                          
                              
                        </form>
                       </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

<jsp:include page="../login/footer.jsp"/>
        <script>
       


        function onCheck()
            {
               
                var invoiceNoCheck = document.getElementById("invoiceNoCheck");
                var invoiceno = document.getElementById("invoiceno").value;
                 var orderNo = document.getElementById("orderNo").value;
                 if(orderNo=='')
                 {
                     swal("Please select order number");
                     
                 }else{
                 
                                                                      $.ajax
                                                                        ({
                                                                            type: "POST",
                                                                            url: '../invoice/getInvNoForOrder.htm',
                                                                            data: {
                                                                                orderNo: orderNo
                                                                                

                                                                            },
                                                                            success: function (data) {
                                                                                data = data.split(",,,");
                                                                                     // alert(data);
                                                                                if (data == 'No Data') {
                                                                                  //  alert("Data is Not Aviable please Check");
                                                                                    document.getElementById("addInvoiceNo").value = invoiceno;
                                                                                } else {

                                                                                    
                                                                                     document.getElementById("addInvoiceNo").value = data[0] +invoiceno;
                                                                            }
                                                                        }
                                                                        });
                                                                        document.getElementById("addInvoiceNo").readOnly = true;
                                                                        
        }  
    }
                

        </script>
        <script>
            function showSelectCheck() {
                document.getElementById('addToCustParentDiv').style.display = 'block'
            }
            ;
            $(function () {
//                debugger;
                var amtval;
                var amtValArr = [];
                var sum;
                $("table tbody tr").each(function () {
                    amtval = Number($(this).find("#itemtotal").val());
                    amtValArr.push(amtval)
                })
               var sum = amtValArr.reduce((a, b) => a + b, 0);
                $("#subTotalInput").val(sum.toFixed(3));
           

                var date = new Date();
                date.setDate(date.getDate());
                $("#dtpsendlater").datepicker({
                    regional: "da",
                    constrainInput: true,
                    showWeek: true,
                    autoclose: true,
                    format: 'dd-mm-yyyy',
                    startDate: date
                });
                $("#dtpsendlater").hide();
                $("#sendLater").change(function () {
                    if (this.checked) {
                        $("#dtpsendlater").show();
                        $("#dtpsendlater").prop("disabled", false);
                    } else {
                        $("#dtpsendlater").hide();
                        $("#dtpsendlater").prop("disabled", true);
                        $("#dtpsendlater").datepicker('update', '');
                    }
                });

                $("#selectCustContainer").hide();
                $("#addToCustParentDiv").hide();
                $("#addToCustomer").change(function () {
                    if (this.checked) {
                        $("#selectCustContainer").show();
                        $("#selCustomerType").prop("disabled", false);
                    } else {
                        $("#selCustomerType").prop("disabled", true);
                        $("#selectCustContainer").hide();
                    }
                });

                var photoAvail = $("#photo").val();
                if (photoAvail != '') {
                    $("#upload-message").hide();
                }
                $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    container: '.pick1'
                }).datepicker('update', new Date());

                var curntdate = new Date();
                curntdate.setDate(curntdate.getDate());
                $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    startDate: curntdate,
                    container: '.pick2'
                }).datepicker('update', new Date());
                //calcucate discount starts
//                calculateDiscount();
//                    calcTotal()
                var discrate = document.querySelector('.disc-rate-container');
                discrate.style.display = '';
//               var disctype = document.querySelector('#discount-type');
                var discrate = document.querySelector('.disc-rate-container');
                var discsummarycon = document.querySelector('.disc-summary-container');
                var disclabel = document.querySelector('.disc-label');
                var minussummary = document.querySelector('.minus-summary');
                var disc = document.querySelector('#disc');
                //discrate.style.display = 'none';
//                minussummary.style.display = 'none';
//                discsummarycon.style.display = '';

          
                 //   discrate.style.display = 'none';
                  //  discsummarycon.style.display = 'none';
                   // disc.value = '0.00';
        

                $('table select').select2();



            });


            $("#savebtn").click(function (e) {

                e.preventDefault();
                var toname = document.getElementById('toname').value;
                var category0 = document.getElementById('category0').value;
                var productdropdown0 = document.getElementById('productdropdown0').value;
                var uomType = document.getElementById('uomType').value;
                var itemrate0 = document.getElementById('itemrate0').value;
                var itemqty = document.getElementById('itemqty').value;

                var servicecategory = document.getElementById('servicecategory').value;
                var serviceproductdropdown = document.getElementById('serviceproductdropdown').value;
                var servicetimespan = document.getElementById('servicetimespan').value;
                var serviceitemrate0 = document.getElementById('serviceitemrate0').value;
                var serviceitemqty = document.getElementById('serviceitemqty').value;


                var prodRow = category0 != 'Select An Option' && productdropdown0 != 'Select An Option' && uomType != 'Select An Option' && itemrate0 != 0 && itemqty != 0;
                var servRow = servicecategory != 'Select An Option' && serviceproductdropdown != 'Select An Option' && servicetimespan != 'Select An Option' && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;

                if (toname == '') {
                    swal("Enter Customer Details (Bill To) in the Invoice.");
                    return false;
                } else if (!prodRow && !servRow) {
                    swal("You cannot save an invoice without selecting at least one product or a service. Kindly include either one product or service before saving");
                    return false;
                } else {
                    $("#coustmermnForm").submit();
                }



            });

            $(function () {
                $("#rate").keydown(function () {
                    // Save old value.
                    if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                        $(this).data("old", $(this).val());
                    calcTotal();

                });
                $("#rate").keyup(function () {
                    // Check correct, else revert back to old value.
                    if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                        ;
                    else
                        $(this).val($(this).data("old"));
                    calcTotal();
                });

                $(document).on("keydown", ".vatAmount", function () {
                    // Save old value.
                    if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                        $(this).data("old", $(this).val());
                    calcTotal();

                });
                $(document).on("keyup", ".vatAmount", function () {
                    // Check correct, else revert back to old value.
                    if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                        ;
                    else
                        $(this).val($(this).data("old"));
                    calcTotal();
                });

                $("#disc").keydown(function () {
                    var disctypekey = $("#discount-type").val();
                    if (disctypekey == "Percent") {
                        // Save old value.
                        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                            $(this).data("old", $(this).val());
                        calcTotal();
                    }
                });
                $("#disc").keyup(function () {
                    var disctypekey = $("#discount-type").val();
                    if (disctypekey == "Percent") {
                        // Check correct, else revert back to old value.
                        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0))
                            ;
                        else
                            $(this).val($(this).data("old"));
                        calcTotal();
                    }
                });

            });

            function callcategoryproduct() {
                var x = '<option value="">Select Category</option><c:forEach items="${productInventoryList}" var="type" varStatus="loop"><option value="${type}">${type}</option></c:forEach>';
                return x;
            }

            function callcategoryservice() {
                var x = '<option value="">Select Category</option><c:forEach items="${serviceInventoryList}" var="type" varStatus="loop"><option value="${type}">${type}</option></c:forEach>';
                return x;
            }


        </script>    



        <script>
            function duplicateRecord() {
                var toemail = document.getElementById("toemail").value
                // alert(toemail);

                $.ajax({
                    type: "POST",
                    url: "../invoice/isEmailIdExist.htm",
                    data: {
                        toemail: toemail

                    },
                    dataType: "text",
                    success: function (data)
                    {
                        //                alert(data);
                        if ($.trim(data) === 'Data not available')
                        {
                            alert("Email ID already exists!!!");
                         $("#addToCustomer").prop("checked", false);
                         document.getElementById('toemail').value = '';
                            //document.getElementById("block").value = '';
                            //        $("#billingCycle").children().remove();
                            // e.preventDefault();

                        } else {

                        }
                    }
                });

            }
            
            
            
          </script>  
            

       

  <script src="standardInvoice.js"></script>
                        
    <script type="text/javascript">
           $(document).ready(function() {
               
                 $('#previewModal').on('hidden.bs.modal', function(e) {
              let clearProTableOnClose = document.getElementById('modalProTabStart');
          let clearSerTableOnClose = document.getElementById('modalSerTabStart');
clearProTableOnClose.innerHTML = '';
clearSerTableOnClose.innerHTML = '';
          });
               
            tippy('#information', {
          content: '<p>Create a new invoice for your existing or new customers, add all relavent information such as customer details, product details & pricing, service details, & additional details such as Tax, discount, payment/delivery terms, etc.<p>\n\
        ',
                    allowHTML: true,
                    hideOnClick: 'toggle',
                    trigger: 'click',
                    onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        });
        </script>
        <script>
               $('.datepicker55').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    container: '.pick55'
                }).datepicker('update', new Date());
                 $('.datepicker56').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    container: '.pick56'
                }).datepicker('update', new Date());
                 $('.datepicker57').datepicker({
                    format: 'dd-mm-yyyy',
                    autoclose: true,
                    todayHighlight: true,
                    container: '.pick57'
                }).datepicker('update', new Date());
      
        function togglesGrids(e) {
            var tmpQtVal = $("#quotationtype").val();
            if(tmpQtVal == "materials") {
                $("#materialGridHIde").show()
                 $("#serviceGridHide").hide()
            } else  if(tmpQtVal == "services") {
                $("#materialGridHIde").hide()
                 $("#serviceGridHide").show()
            } else {
                $("#materialGridHIde").show();
                 $("#serviceGridHide").show()
            }
        }
        
        
        
        $("#quotationvalidity").on('change', function () {
            var quoTempDate = $("#date").val();
           var diffDays = $(this).val()
           var addFiveDays =  moment(quoTempDate, 'DD-MM-YYYY').add('days',diffDays).format("DD-MM-YYYY");
           
           $("#QuoExpiryDate").val(addFiveDays);
        })
        </script>
   </body>
</html>

