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
<title>Arête Property Management</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
<style>
   .toggleSwitch span span {
    display: none;
    }
@media only screen {
    .toggleSwitch {
        display: inline-block;
        height: 18px;
        position: relative;
        overflow: visible;
        padding: 0;
        cursor: pointer;
        width: 40px;
    }
    .toggleSwitch * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    .toggleSwitch label,
    .toggleSwitch > span {
        line-height: 20px;
        height: 20px;
        vertical-align: middle;
    }
    .toggleSwitch input:focus ~ a,
    .toggleSwitch input:focus + label {
        outline: none;
    }
    .toggleSwitch label {
        position: relative;
        z-index: 3;
        display: block;
        width: 100%;
    }
    .toggleSwitch input {
        position: absolute;
        opacity: 0;
        z-index: 5;
    }
    .toggleSwitch > span {
        position: absolute;
        left: -48px;
        width: 100%;
        margin: 0;
        padding-right: 50px;
        text-align: left;
        white-space: nowrap;
    }
    .toggleSwitch > span span {
        position: absolute;
        top: 0;
        left: 0;
        z-index: 5;
        display: block;
        width: 50%;
        margin-left: 50px;
        text-align: left;
        font-size: 0.9em;
        width: 100%;
        left: 9%;
        top: -1px;
        opacity: 0;
    }
    .toggleSwitch a {
        position: absolute;
        right: 50%;
        z-index: 4;
        display: block;
        height: 100%;
        padding: 0;
        left: 2px;
        width: 18px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 100%;
        -webkit-transition: all 0.2s ease-out;
        -moz-transition: all 0.2s ease-out;
        transition: all 0.2s ease-out;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
    }
    .toggleSwitch > span span:first-of-type {
        color: #ccc;
        opacity: 1;
        left: 45%;
    }
    .toggleSwitch > span:before {
        content: "";
        display: block;
        width: 100%;
        height: 100%;
        position: absolute;
        left: 50px;
        top: -2px;
        background-color: #fafafa;
        border: 1px solid #ccc;
        border-radius: 30px;
        -webkit-transition: all 0.2s ease-out;
        -moz-transition: all 0.2s ease-out;
        transition: all 0.2s ease-out;
    }
    .toggleSwitch input:checked ~ a {
        border-color: #fff;
        left: 100%;
        margin-left: -8px;
    }
    .toggleSwitch input:checked ~ span:before {
        border-color: #314c68;
        box-shadow: inset 0 0 0 30px #314c68;
    }
    .toggleSwitch input:checked ~ span span:first-of-type {
        opacity: 0;
    }
    .toggleSwitch input:checked ~ span span:last-of-type {
        opacity: 1;
        color: #fff;
    }
    /* Switch Sizes */
    .toggleSwitch.large {
        width: 60px;
        height: 27px;
    }
    .toggleSwitch.large a {
        width: 27px;
    }
    .toggleSwitch.large > span {
        height: 29px;
        line-height: 28px;
    }
    .toggleSwitch.large input:checked ~ a {
        left: 41px;
    }
    .toggleSwitch.large > span span {
        font-size: 1.1em;
    }
    .toggleSwitch.large > span span:first-of-type {
        left: 45%;
    }
}
table {
    table-layout: fixed;
}
.iti {
    width: 100%;
}
.mobile-p {
    padding: 0 3rem;
}
.h-360 {
    height: 360px;
}
@media only screen and (max-width: 600px) {
    .mobile-p {
        padding: 0 1rem !important;
    }
    .h-360 {
        height: fit-content;
    }
}
.table-responsive::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
    background-color: #f5f5f5;
    border-radius: 10px;
}

.table-responsive::-webkit-scrollbar {
    width: 10px;
    height: 10px;
    background-color: #f5f5f5;
}
@media only screen and (max-width: 600px) {
    table thead {
        white-space: nowrap !important;
    }
    .uomType,
    .itemrate,
    .itemQty {
        width: 50px !important;
    }
    #itemSno {
        width: 30px;
    }
}
.table-responsive::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.44, rgb(122, 153, 217)), color-stop(0.72, rgb(73, 125, 189)), color-stop(0.86, rgb(28, 58, 148)));
}

.modal-body .form-group {
    margin-bottom: 0px !important;
}
.form-control-plaintext {
    padding: 0 !important;
}
.modal-body .control-label {
    padding-top: 0 !important;
}
.modal-body .invoice-body-notes {
    border-bottom: 20px solid #1b82c5;
    margin-bottom: 50px;
}
.modal-body select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    text-indent: 1px;
    text-overflow: "";
    pointer-events: none;
}
.modal-body input {
    pointer-events: none;
}

@media only screen and (max-width: 600px) {
    .invoice-detail-summary {
        width: 50% !important;
    }
    .invoice-detail-rate {
        width: 15% !important;
    }
    .invoice-detail-quantity {
        width: 10% !important;
    }
    .invoice-detail-amount {
        width: 25% !important;
    }
    .invoice-body-list {
        padding: 0 !important;
    }
    .invoice-totals .row {
        text-align: center !important;
        display: flex !important;
    }
    .invoice-totals .row .col-lg-6 {
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
    var x = $("#toname").val() && $("#toemail").val() && $("#toaddress").val() && $("#tophone").val() && $("#toname").val();

    e.preventDefault();
    var category0 = document.getElementById("category0").value;
    var productdropdown0 = document.getElementById("productdropdown0").value;
    var uomType = document.getElementById("uomType").value;
    var itemrate0 = document.getElementById("itemrate0").value;
    var itemqty = document.getElementById("itemqty").value;

    var servicecategory = document.getElementById("servicecategory").value;
    var serviceproductdropdown = document.getElementById("serviceproductdropdown").value;
    var servicetimespan = document.getElementById("servicetimespan").value;
    var serviceitemrate0 = document.getElementById("serviceitemrate0").value;
    var serviceitemqty = document.getElementById("serviceitemqty").value;

    var prodRow = category0 != "Select An Option" && productdropdown0 != "Select An Option" && uomType != "Select An Option" && itemrate0 != 0 && itemqty != 0;
    var servRow = servicecategory != "Select An Option" && serviceproductdropdown != "Select An Option" && servicetimespan != "Select An Option" && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
    if (x == "" || x == null || x == "") {
        swal("Enter Customer Details (Bill To) in the Invoice.");
        return false;
    } else if (!prodRow && !servRow) {
        swal("You cannot save an invoice without selecting at least one product or a service. Kindly include either one product or service before saving");
        return false;
    } else {
        $("#coustmermnForm").submit();
    }
}

function valueChecks2(e) {
    var x = $("#toname").val() && $("#toemail").val() && $("#toaddress").val() && $("#tophone").val() && $("#toname").val();

    e.preventDefault();
    var category0 = document.getElementById("category0").value;
    var productdropdown0 = document.getElementById("productdropdown0").value;
    var uomType = document.getElementById("uomType").value;
    var itemrate0 = document.getElementById("itemrate0").value;
    var itemqty = document.getElementById("itemqty").value;

    var servicecategory = document.getElementById("servicecategory").value;
    var serviceproductdropdown = document.getElementById("serviceproductdropdown").value;
    var servicetimespan = document.getElementById("servicetimespan").value;
    var serviceitemrate0 = document.getElementById("serviceitemrate0").value;
    var serviceitemqty = document.getElementById("serviceitemqty").value;

    var prodRow = category0 != "Select An Option" && productdropdown0 != "Select An Option" && uomType != "Select An Option" && itemrate0 != 0 && itemqty != 0;
    var servRow = servicecategory != "Select An Option" && serviceproductdropdown != "Select An Option" && servicetimespan != "Select An Option" && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
    if (x == "" || x == null || x == "") {
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
    var x = $("#toname").val() && $("#toemail").val() && $("#toaddress").val() && $("#tophone").val() && $("#toname").val();

    $("#coustmermnForm").submit();
    e.preventDefault();
    var category0 = document.getElementById("category1").value;
    var productdropdown0 = document.getElementById("productdropdown1").value;
    var uomType = document.getElementById("uomType").value;
    var itemrate0 = document.getElementById("itemrate1").value;
    var itemqty = document.getElementById("itemqty1").value;

    var servicecategory = document.getElementById("servicecategory1").value;
    var serviceproductdropdown = document.getElementById("serviceproductdropdown1").value;
    var serviceitemrate0 = document.getElementById("serviceitemrate1").value;
    var serviceitemqty = document.getElementById("serviceitemqty1").value;

    var prodRow = category0 != "Select An Option" && productdropdown0 != "Select An Option" && uomType != "Select An Option" && itemrate0 != 0 && itemqty != 0;
    var servRow = servicecategory != "Select An Option" && serviceproductdropdown != "Select An Option" && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;
    if (x == "" || x == null || x == "") {
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

    myWindow = window.open("../inventory/SelectB2BCustomerDetails.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

function openWindow1() {
    myWindow = window.open("../invoice/productAndServicePopList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

function browseFile(slno) {
    document.getElementById("field" + slno).click();
}

function setAttachName(slno) {
    var filenm = document.getElementById("field" + slno).value;
    var filename = filenm.replace(/^.*[\\\/]/, "");
    var imgTextArr = filename.split(".");
    var imgTxtFTb = imgTextArr[0];
    if (parseInt(imgTxtFTb.length) > 45) {
        imgTxtFTb = imgTxtFTb.substring(0, 45);
    }
    document.getElementById("attachname" + slno).value = imgTxtFTb;
}

function readURL3(input) {
    var imageId = input.id;
    checkAttachmentSizefile(input, imageId);
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.readAsDataURL(input.files[0]);
    }
}

function checkAttachmentSizefile(obj, id1) {
    var size = $("#" + id1)[0].files[0].size / (200 * 230);
    if (parseFloat(size) > 45) {
        swal("Attached file is exceeding file size. Please upload file size less than 2 MB.");
        $("#" + id1).val("");
    } else {
        ValidateAttachment(obj, id1);
    }
}
function ValidateAttachment(obj, id1) {
    var image = document.getElementById(id1).value;
    if (image != "") {
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
    if (attachname === "" || attachname === null) {
        if (val === "" || val === null) {
            swal("Attach a file");
            document.getElementById(id1).value = "";
            return false;
        } else {
            return true;
        }
    }
}

function openMeterWindow4() {
    myWindow = window.open("../invoice/SelectOrderList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

function openProductWindow(e) {
    e.preventDefault();
    myProductWindow = window.open("../contract/selectProductList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function openProductPackage(e) {
    e.preventDefault();
    myProductPackage = window.open("../contract/selectProductPackageList.jsp", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function openServiceWindow(e) {
    e.preventDefault();
    myServiceWindow = window.open("../contract/selectServiceList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}
function openServicePackage(e) {
    e.preventDefault();
    myServicePackage = window.open("../contract/selectServicePackageList.jsp", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

</script>
</head>
 <body class="nav-md">
   <jsp:include page="../login/menu.htm"/>
  <main id="main" class="main">
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <c:forEach items="${invoiceList}" var="indvList">
                            <c:set value="${indvList.SNo}" var="SNo"/>
                            <c:set value="${indvList.invoiceNo}" var="invoiceNo"/>
                             <c:set value="${indvList.invoiceType}" var="invoiceType"/>
                            <c:set value="${indvList.customerName}" var="customerName"/>
                             <c:set value="${indvList.dueDate}" var="dueDate"/>
                            <c:set value="${indvList.createdDate}" var="createdDate"/>
                            <c:set value="${indvList.description}" var="description"/>
                            <c:set value="${indvList.taxCode}" var="taxCode"/>
                            <c:set value="${indvList.propertyName}" var="propertyName"/>
                            <c:set value="${indvList.servcieAreaDescription}" var="servcieAreaDescription"/>
                            <c:set value="${indvList.fromDate}" var="fromDate"/>
                            <c:set value="${indvList.toPeriod}" var="toPeriod"/>
                            <c:set value="${indvList.pdChequeNo}" var="pdChequeNo"/>
                            <c:set value="${indvList.lpNo}" var="lpNo"/>
                            <c:set value="${indvList.unitName}" var="unitName"/>
                            <c:set value="${indvList.bankAccountDetails}" var="bankAccountDetails"/>
                            <c:set value="${indvList.paymentTerms}" var="paymentTerms"/>
                            <c:set value="${indvList.contractTerms}" var="contractTerms"/>
                            <c:set value="${indvList.totalPayableAmt}" var="totalPayableAmt"/>
                            <c:set value="${indvList.subtotal}" var="subtotal"/>
                            <c:set value="${indvList.balance}" var="balance"/>
                            <c:set value="${indvList.discount}" var="discount"/>
                            <c:set value="${indvList.amountPaid}" var="amountPaid"/>
                            <c:set value="${indvList.frequency}" var="frequency"/><%--
                            <c:set value="${indvList.vat}" var="vat"/>
                            <c:set value="${indvList.vat}" var="vat"/>
                            <c:set value="${indvList.vat}" var="vat"/>
                            <c:set value="${indvList.vat}" var="vat"/>
                            <c:set value="${indvList.vat}" var="vat"/>   --%>
                            
                             <c:set value="${indvList.totalPayableAmt}" var="totalPayableAmt"/>

                        </c:forEach>    
                        <div class="card-title"><h5>Rent Invoice Form</h5></div>
                        <form id="coustmermnForm" autocomplete="off" name="frm" accept-charset="UTF-8" method="post" action="../finance/rentInvoicesPDCList.htm" enctype="multipart/form-data">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        Invoice Details
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="invoiceNo" readonly="" maxlength="98" required value="${invoiceNo}"/>
                                            <label for="groupname"><span style="color: red;">*</span>Invoice</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="invoiceType" readonly="" value="${invoiceType}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Invoice Type</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <textarea type="text" placeholder="Org Name" id="bookID" class="form-control" name="description" readonly="" value="${description}" maxlength="98">${description}</textarea>
                                            <label for="groupname"><span style="color: red;">*</span>Description</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3 pick">
                                            <input type="text" class="form-control datepicker" style="pointer-events: none;" readonly="" id="date" name="createdDate" placeholder="" value="<%= (new SimpleDateFormat("dd-MM-yyyy")).format(new
                                            java.util.Date())%>">
                                            <label class="control-label" for="date">Creation Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Vat Applicable" id="bookID" class="form-control" name="taxCode" readonly="" value="${taxCode}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Tax Code</label>
                                        </div>

                                        <input type="hidden" class="form-control" readonly id="cdate" name="cdate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>" />">
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                        Tenant Details
                                    </button>
                                </h2>
                                <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="bookID" readonly="" value="${pdChequeNo}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>PD Cheque No</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3 pick55">
                                            <input style="background: #fff;" type="text" class="form-control datepicker55" readonly="" id="QuoExpiryDate" name="dueDate" readonly="" value="${dueDate}" placeholder="" value="<%= (new
                                            SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%>">
                                            <label class="control-label" for="QuoExpiryDate">Due Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="lpNo" readonly="" value="${lpNo}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Lpo Number</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="propertyName" readonly="" value="${propertyName}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Property Name</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="unitName" readonly="" value="${unitName}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Unit Name / Unit Number</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="customerName" readonly="" value="${customerName}" maxlength="98" />
                                            <label for="groupname"><span style="color: red;">*</span>Tenant Name</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

              <%--              <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                        Rent Details
                                    </button>
                                </h2>
                                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div style="margin-top: 20px; overflow-x: auto;" class="table-responsive">
                                            <table class="table table-condensed" id="servicemyTable" style="border: 1px solid #dee2e6;">
                                                <thead class="thead">
                                                    <tr class="">
                                                        <th class="invoice-detail-margin" style="width: 5%;">&nbsp;</th>
                                                        <th class="invoice-detail-sno" style="width: 5%;">S.No</th>
                                                        <th class="invoice-detail-category">Description</th>

                                                        <th class="invoice-detail-rate">Rent Amount</th>
                                                        <th class="invoice-detail-rate">VAT (%)</th>

                                                        <th class="invoice-detail-rate">VAT Amount</th>
                                                        <th class="invoice-detail-total">Total Amount</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="invoice-items">
                                                    <c:set var="countserve" value="0" scope="page" />

                                                    <c:set var="countserve" value="${countserve + 1}" scope="page" />
                                                    <tr class="item-row item-row-1 with-tax" id="myRow">
                                                        <td class="item-row-actions">
                                                            <input type="hidden" class="form-control" id="sno" name="sno" value="" />
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control-plaintext text-center" autocomplete="off" id="slNo" name="slNo" value="${countserve}" size="2" readonly />
                                                        </td>

                                                        <input type="hidden" class="form-control" id="itemtype" name="itemtype" value="Service" />

                                                        <td>
                                                            <input class="form-control" id="servicecategory${countserve}" name="productCategory" value="" />
                                                        </td>

                                                        <td>
                                                            <input
                                                                type="text"
                                                                class="form-control itemrate"
                                                                placeholder="0.00"
                                                                autocomplete="off"
                                                                id="serviceitemrate${countserve}"
                                                                name="itemrate"
                                                                onkeypress="return isNumber(event)"
                                                                oninput="calcTotal();calculateTotal(event)"
                                                                value="${type.itemrate}"
                                                                maxlength="10"
                                                            />
                                                        </td>
                                                        <td>
                                                            <input
                                                                type="text"
                                                                class="form-control vatAmount"
                                                                placeholder="0"
                                                                autocomplete="off"
                                                                id="vatAmount"
                                                                name="vatAmount"
                                                                onInput="calcTotal()"
                                                                onkeyup="return isNumberWithDot(event)"
                                                                placeholder="0"
                                                            />
                                                        </td>

                                                        <td class="">
                                                            <div class="d-flex">
                                                                <span class="currency"></span><span><input type="text" size="10" readonly class="form-control" value="0.00" name="itemvattotal" id="itemvattotal" /></span>
                                                            </div>
                                                        </td>
                                                        <td class="d-flex">
                                                            <span class="currency"></span>
                                                            <span><input type="text" size="10" readonly class="form-control serviceitemtotal" style="user-select: none; outline: none;" value="0" name="itemtotal" id="itemtotal" /></span>
                                                            <input type="hidden" id="uomType" name="uomType" value="" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="col-md-12 col-sm-9 col-xs-12 p-0">
                                            <button id="invoice-item-add" title="Add Item" class="btn btn-light border my-2" onClick="serviceaddRow(event)"><i class="fas fa-plus"></i> Add Item</button>
                                        </div>
                                    </div>
                                </div>
                            </div>   --%>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingFour">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                                        Make Recurring Details
                                    </button>
                                </h2>
                                <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="col-md-4 mb-3 d-flex">
                                            <div class="col-md-2">
                                                <label value="yes" onchange="showSubscripeDetails(event)" class="toggleSwitch large" onclick="">
                                                    <input type="checkbox" id="amccustomToggle" name="recurringBtn" value="yes" />
                                                    <span>
                                                        <span>OFF</span>
                                                        <span>ON</span>
                                                    </span>
                                                    <a></a>
                                                </label>
                                            </div>
                                            <label class="control-label col-md-10 ms-3 text-left" id="amcrequire" for="amcRequired">Make Recurring</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3 pick1" id="dueDateHide">
                                            <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker1" name="groupName" maxlength="98" value="${nextIssueDate}" required onkeypress="firstToUpperCase1(event);" />
                                            <label for="groupname"><span style="color: red;">*</span> Next Issue Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3" id="intervalHide">
                                            <select class="form-select" name="frequency" placeholder="Category" id="doctype" readonly="" maxlength="98">
                                                <option value="${frequency}" selected="selected">${frequency}</option>
                                                <option value="Weekly">Weekly</option>
                                                <option value="Monthly">Monthly</option>
                                                <option value="Quarterly">Quarterly</option>
                                                <option value="Half-yearly">Half-yearly</option>
                                                <option value="Yearly">Yearly</option>
                                            </select>

                                            <label for="clientType"><span style="color: red;">*</span> Frequency Interval</label>
                                        </div>
                                        <div class="col-md-4" id="settingHide">
                                            <label for="groupname"><span style="color: red;">*</span> Invoice Settings</label>
                                            <div>
                                                <label for="invoicenotify"> <input type="radio" name="invoiceRecurringType" id="" /> Send Invoices Automatically</label> <br />
                                                <label for="invoicenotify"> <input type="radio" name="invoiceRecurringType" id="" /> Create Draft Invoice And Send Manually</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingFive">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                                        Additional Details
                                    </button>
                                </h2>
                                <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="row mt-3">
                                            <div class="col-md-6">
                                                <div class="invoice-detail-notes">
                                                    <label class="control-label">Bank Account Details For Online Transfer</label>
                                                    <textarea id="invoice-notes" class="form-control" name="bankAccountDetails" maxlength="300" readonly="" value="${bankAccountDetails}" style="height: 88px;" maxlength="280">${bankAccountDetails}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-row disc-rate-container mb-3">
                                                    <label class="control-label col-sm-3 disc-label" for="discount-rate">Discount (%)</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="disc" name="discount" readonly="" value="${discount}" placeholder="" onInput="calculateDiscount()" onchange="allowThreeDecimal(event)" min="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group form-row mb-3">
                                                    <label class="control-label col-sm-3" for="discount-rate">Amount Paid</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="amounpaid" name="amountPaid" placeholder="" onInput="calculateBalanceDue()" readonly="" value="${amountPaid}" onchange="allowThreeDecimal(event)" min="0" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dashboard-row3 tax-discount-currency">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-6 my-3 py-0">
                                                    <div class="invoice-body-notes p-3 bankdetails-summary">
                                                        <div class="invoice-detail-notes">
                                                            <h4 class="invoice-notes-header">Payment Terms</h4>

                                                            <textarea
                                                                id="invoice-notes"
                                                                class="form-control"
                                                                name="paymentTerms" readonly=""
                                                                value="${paymentTerms}"
                                                                maxlength="300"
                                                                placeholder="Notes - any relevant information not covered, additional terms and conditions"
                                                                style="height: 88px;"
                                                                maxlength="280"
                                                            >${paymentTerms}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-6 my-3 py-0">
                                                    <div class="invoice-body-notes p-3 bankdetails-summary">
                                                        <div class="invoice-detail-notes">
                                                            <h4 class="invoice-notes-header">Contract Terms</h4>

                                                            <textarea
                                                                id="payment-notes"
                                                                class="form-control"
                                                                name="contractTerms" readonly=""
                                                                value="${contractTerms}"
                                                                placeholder="Notes - any relevant information not covered, additional Delivery Terms"
                                                                style="height: 88px;"
                                                                maxlength="280"
                                                            >${contractTerms}</textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-7"></div>
                                        <div class="col-lg-5 float-right invoice-totals">
                                            <div class="row">
                                                <div class="col text-right">Subtotal</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="${subtotal}" name="subtotal" id="subTotalInput" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>

                                            <div class="row vat-summary-container">
                                                <div class="vatlabel text-right col">VAT</div>
                                                <div class="col text-right">
                                                    <input name="vatsummary" id="vatsummary" type="hidden" readonly class="border-0 vatsummary" style="user-select: none; outline: none;" size="2" value="" />
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="${vat}" name="vat" id="vatpertotl" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>

                                            <div class="row disc-summary-container">
                                                <div class="disclabel text-right col">Discount (0)</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="discountedAmount" id="discpercent" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col text-right">Total Payable Amount</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="${totalPayableAmt}" name="totalPayableAmt" id="total" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col text-right">Amount Paid</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="${amountPaid}" name="amountPaid" id="amounpaidfinal" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col text-right">Balance Due</div>
                                                <div class="col text-right">
                                                    <span class="currency"></span>
                                                    <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="${balance}" name="balance" id="balDue" />
                                                    <span class="currency-right"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" class="form-control datepicker" readonly id="cdate" name="cdate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>" />">

                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 my-3">
<!--                            <button type="submit" class="btn btn-primary mr-2">Save</button>
                            <button type="submit" class="btn btn-primary mr-2">Save As Draft</button>
                            <button type="submit" class="btn btn-primary mr-2">Save As Send</button>-->
                            <a href="../finance/rentInvoicesPDCList.htm" class="btn btn-danger ms-1">Cancel</a>

                            <button class="btn btn-primary ms-1" onclick="window.print()">Print</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../login/footer.jsp"/>   
<script src="rentInvoice.js"></script>
                        
<script type="text/javascript">
function onCheck() {
    var invoiceNoCheck = document.getElementById("invoiceNoCheck");
    var invoiceno = document.getElementById("invoiceno").value;
    var orderNo = document.getElementById("orderNo").value;
    if (orderNo == "") {
        swal("Please select order number");
    } else {
        $.ajax({
            type: "POST",
            url: "../invoice/getInvNoForOrder.htm",
            data: {
                orderNo: orderNo,
            },
            success: function (data) {
                data = data.split(",,,");
                if (data == "No Data") {
                    document.getElementById("addInvoiceNo").value = invoiceno;
                } else {
                    document.getElementById("addInvoiceNo").value = data[0] + invoiceno;
                }
            },
        });
        document.getElementById("addInvoiceNo").readOnly = true;
    }
}

function showSelectCheck() {
    document.getElementById("addToCustParentDiv").style.display = "block";
}
$(function () {
    //                debugger;
    var amtval;
    var amtValArr = [];
    var sum;
    $("table tbody tr").each(function () {
        amtval = Number($(this).find("#itemtotal").val());
        amtValArr.push(amtval);
    });
    var sum = amtValArr.reduce((a, b) => a + b, 0);
    $("#subTotalInput").val(sum.toFixed(3));

    var date = new Date();
    date.setDate(date.getDate());
    $("#dtpsendlater").datepicker({
        regional: "da",
        constrainInput: true,
        showWeek: true,
        autoclose: true,
        format: "dd-mm-yyyy",
        startDate: date,
    });
    $("#dtpsendlater").hide();
    $("#sendLater").change(function () {
        if (this.checked) {
            $("#dtpsendlater").show();
            $("#dtpsendlater").prop("disabled", false);
        } else {
            $("#dtpsendlater").hide();
            $("#dtpsendlater").prop("disabled", true);
            $("#dtpsendlater").datepicker("update", "");
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
    if (photoAvail != "") {
        $("#upload-message").hide();
    }
    $(".datepicker1")
        .datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true,
            container: ".pick1",
        })
        .datepicker("update", new Date());

    var curntdate = new Date();
    curntdate.setDate(curntdate.getDate());
    $(".datepicker2")
        .datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true,
            startDate: curntdate,
            container: ".pick2",
        })
        .datepicker("update", new Date());

    var discrate = document.querySelector(".disc-rate-container");
    discrate.style.display = "";
    var discrate = document.querySelector(".disc-rate-container");
    var discsummarycon = document.querySelector(".disc-summary-container");
    var disclabel = document.querySelector(".disc-label");
    var minussummary = document.querySelector(".minus-summary");
    var disc = document.querySelector("#disc");
});

$("#savebtn").click(function (e) {
    e.preventDefault();
    var toname = document.getElementById("toname").value;
    var category0 = document.getElementById("category0").value;
    var productdropdown0 = document.getElementById("productdropdown0").value;
    var uomType = document.getElementById("uomType").value;
    var itemrate0 = document.getElementById("itemrate0").value;
    var itemqty = document.getElementById("itemqty").value;

    var servicecategory = document.getElementById("servicecategory").value;
    var serviceproductdropdown = document.getElementById("serviceproductdropdown").value;
    var servicetimespan = document.getElementById("servicetimespan").value;
    var serviceitemrate0 = document.getElementById("serviceitemrate0").value;
    var serviceitemqty = document.getElementById("serviceitemqty").value;

    var prodRow = category0 != "Select An Option" && productdropdown0 != "Select An Option" && uomType != "Select An Option" && itemrate0 != 0 && itemqty != 0;
    var servRow = servicecategory != "Select An Option" && serviceproductdropdown != "Select An Option" && servicetimespan != "Select An Option" && Number(serviceitemrate0) != 0 && Number(serviceitemqty) != 0;

    if (toname == "") {
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
        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0)) $(this).data("old", $(this).val());
        calcTotal();
    });
    $("#rate").keyup(function () {
        // Check correct, else revert back to old value.
        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0));
        else $(this).val($(this).data("old"));
        calcTotal();
    });

    $(document).on("keydown", ".vatAmount", function () {
        // Save old value.
        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0)) $(this).data("old", $(this).val());
        calcTotal();
    });
    $(document).on("keyup", ".vatAmount", function () {
        // Check correct, else revert back to old value.
        if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0));
        else $(this).val($(this).data("old"));
        calcTotal();
    });

    $("#disc").keydown(function () {
        var disctypekey = $("#discount-type").val();
        if (disctypekey == "Percent") {
            // Save old value.
            if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0)) $(this).data("old", $(this).val());
            calcTotal();
        }
    });
    $("#disc").keyup(function () {
        var disctypekey = $("#discount-type").val();
        if (disctypekey == "Percent") {
            // Check correct, else revert back to old value.
            if (!$(this).val() || (parseInt($(this).val()) <= 100 && parseInt($(this).val()) >= 0));
            else $(this).val($(this).data("old"));
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

function duplicateRecord() {
    var toemail = document.getElementById("toemail").value;

    $.ajax({
        type: "POST",
        url: "../invoice/isEmailIdExist.htm",
        data: {
            toemail: toemail,
        },
        dataType: "text",
        success: function (data) {
            //                alert(data);
            if ($.trim(data) === "Data not available") {
                alert("Email ID already exists!!!");
                $("#addToCustomer").prop("checked", false);
                document.getElementById("toemail").value = "";
            } else {
            }
        },
    });
}
$(document).ready(function () {
    $("#dueDateHide").hide();
    $("#intervalHide").hide();
    $("#settingHide").hide();
    $("#previewModal").on("hidden.bs.modal", function (e) {
        let clearProTableOnClose = document.getElementById("modalProTabStart");
        let clearSerTableOnClose = document.getElementById("modalSerTabStart");
        clearProTableOnClose.innerHTML = "";
        clearSerTableOnClose.innerHTML = "";
    });
});

$(".datepicker55")
    .datepicker({
        format: "dd-mm-yyyy",
        autoclose: true,
        todayHighlight: true,
        container: ".pick55",
    })
    .datepicker("update", new Date());

function togglesGrids(e) {
    var tmpQtVal = $("#quotationtype").val();
    if (tmpQtVal == "materials") {
        $("#materialGridHIde").show();
        $("#serviceGridHide").hide();
    } else if (tmpQtVal == "services") {
        $("#materialGridHIde").hide();
        $("#serviceGridHide").show();
    } else {
        $("#materialGridHIde").show();
        $("#serviceGridHide").show();
    }
}

$(".datepicker1")
    .datepicker({
        format: "dd-mm-yyyy",
        startDate: "0m +0m",
        autoclose: true,
        todayHighlight: true,

        container: ".pick1",
    })
    .datepicker("update", new Date());

$("#quotationvalidity").on("change", function () {
    var quoTempDate = $("#date").val();
    var diffDays = $(this).val();
    var addFiveDays = moment(quoTempDate, "DD-MM-YYYY").add("days", diffDays).format("DD-MM-YYYY");

    $("#QuoExpiryDate").val(addFiveDays);
});

function showSubscripeDetails() {
    var amccheckBox = document.getElementById("amccustomToggle");
    if (amccheckBox.checked == true) {
        $("#dueDateHide").show();
        $("#intervalHide").show();
        $("#settingHide").show();
    } else {
        $("#dueDateHide").hide();
        $("#intervalHide").hide();
        $("#settingHide").hide();
    }
}
 </script>
   </body>
</html>

