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
<title>Arete Iconic</title>
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
    .serviceMobileview{
        width: auto !important;
    }
       .btmMobilespace{
        margin-bottom: 3px;
    }
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
function selectProperty(e) {
    e.preventDefault();
    myServicePackage = window.open("../finance/selectPropertyDetailsInInvoice.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

</script>
</head>
<body class="nav-md">
    
<jsp:include page="../login/menu.htm"/>
<jsp:include page="../login/footer.jsp"/>

<main id="main" class="main">
    <div class="pagetitle"></div>
    <section class="section mt-3">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Standard Invoice Form</h5></div>
                        <form id="coustmermnForm" autocomplete="off" name="frm" accept-charset="UTF-8" method="post" action="../finance/standardInvoiceFormSubmit.htm" enctype="multipart/form-data">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingOne">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                        Invoice Details
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="invoiceNo" maxlength="98" required value="${orderNo}"/>
                                            <input type="hidden" id="invoice" class="form-control" name="invoice" maxlength="98" required value="Standard Invoice" />
                                            <label for="groupname"><span style="color: red;">*</span>Invoice</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <select class="form-select" placeholder="Category" id="invoiceType" name="invoiceType" maxlength="98" required>
                                                <option value="" selected="selected" disabled>Select An Option</option>
                                                <option value="Service">Service</option>
                                                <option value="Utility Tax">Utility Tax</option>
                                                <option value="Tax">Tax</option>
                                                <option value="Others">Others</option>
                                            </select>
                                            <label for="groupname"><span style="color: red;">*</span>Invoice Type</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <textarea type="text" placeholder="Org Name" id="bookID" class="form-control" name="description" maxlength="98" required></textarea>
                                            <label for="groupname"><span style="color: red;">*</span>Description</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3 pick">
                                            <input type="text" class="form-control datepicker" style="pointer-events: none;" readonly="" id="date" name="createdDate" placeholder="" value="<%= (new SimpleDateFormat("dd-MM-yyyy")).format(new
                                            java.util.Date())%>">
                                            <label class="control-label" for="date">Creation Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Vat Applicable" id="bookID" class="form-control" name="taxCode" maxlength="98" required />
                                            <label for="groupname"><span style="color: red;">*</span>Tax Code</label>
                                        </div>

                                        <input type="hidden" class="form-control" readonly id="cdate" name="cdate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>" />">
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                        Tenant Details
                                    </button>
                                </h2>
                                <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="propertyName" class="form-control" name="propertyName" maxlength="98" readonly="" required onclick="return selectProperty(event)"/>
                                            <label for="groupname"><span style="color: red;">*</span>Property Name</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <textarea type="text" placeholder="Org Name" id="bookID" class="form-control" name="servcieAreaDescription" maxlength="98" required></textarea>
                                            <label for="groupname"><span style="color: red;">*</span>Service Area Description</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <input type="text" placeholder="Org Name" id="bookID" class="form-control" name="customerName" maxlength="98" required />
                                            <label for="groupname"><span style="color: red;">*</span>Customer Name</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3 pick55">
                                            <input style="background: #fff;" type="text" class="form-control datepicker55" readonly="" id="QuoExpiryDate" name="dueDate" placeholder="" value="<%= (new
                                            SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%>">
                                            <label class="control-label" for="QuoExpiryDate">Due Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3 pick56">
                                            <input style="background: #fff;" type="text" class="form-control datepicker56" readonly="" id="QuoFromDate" name="fromDate" placeholder="" value="<%= (new
                                            SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%>">
                                            <label class="control-label" for="QuoExpiryDate">From Period</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3 pick57">
                                            <input style="background: #fff;" type="text" class="form-control datepicker57" readonly="" id="QuoExpDate" name="toPeriod" placeholder="" value="<%= (new
                                            SimpleDateFormat("dd-MM-yyyy")).format(new java.util.Date())%>">
                                            <label class="control-label" for="QuoExpiryDate">To Period</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header" id="flush-headingFour">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                                        Service Details
                                    </button>
                                </h2>
                                <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body row">
                                        <!--                                        <input type="button" class="btn btn-primary ml-3 my-2" value="Service">-->
                                        <div style="margin-top: 20px; overflow-x: auto;" class="table-responsive">
                                            <table class="table table-condensed table-bordered serviceMobileview" id="servicemyTable" style="border: 1px solid #dee2e6;">
                                                <thead class="thead">
                                                    <tr class="">
                                                        <th class="invoice-detail-margin" style="width: 2%;">&nbsp;</th>
                                                        <th class="invoice-detail-sno" style="width: 70px;">S.No</th>
                                                        <th class="invoice-detail-category">Service Category</th>
                                                        <th class="invoice-detail-category">Description</th>

                                                        <th class="invoice-detail-rate">Service Charge Amount</th>
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
                                                            <input class="form-control" id="servicecategory${countserve}" name="serviceCategory" value="" />
                                                        </td>
                                                        <td>
                                                            <input class="form-control" id="servicedescription{countserve}" name="serviceDesc" value="" />
                                                        </td>

                                                        <td>
                                                            <input
                                                                type="text"
                                                                class="form-control itemrate"
                                                                placeholder="0.00"
                                                                autocomplete="off"
                                                                id="serviceitemrate${countserve}"
                                                                name="serviceChargeAmount"
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
                                                                name="vatPercentage"
                                                                value="0"
                                                                onInput="calcTotal()"
                                                                onkeyup="return isNumberWithDot(event)"
                                                                placeholder="0"
                                                            />
                                                        </td>

                                                        <td class="">
                                                            <div class="d-flex">
                                                                <span class="currency"></span><span><input type="text" size="10" readonly class="form-control" value="0.00" name="vatServiceDetails" id="itemvattotal" /></span>
                                                            </div>
                                                        </td>
                                                        <td class="d-flex">
                                                            <span class="currency"></span>
                                                            <span><input type="text" size="10" readonly class="form-control serviceitemtotal" style="user-select: none; outline: none;" value="0" name="totalAmount" id="itemtotal" /></span>
                                                            <input type="hidden" id="uomType" name="uomType" value="" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="col-md-12 col-sm-9 col-xs-12">
                                            <button id="invoice-item-add" title="Add Item" class="btn btn-primary mr-2" onClick="serviceaddRow(event)"><i class="fa fa-plus-circle"></i> Add Item</button>
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
                                                    <textarea id="invoice-notes" class="form-control" name="bankAccountDetails" maxlength="300" style="height: 88px;" maxlength="280"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group form-row disc-rate-container mb-3">
                                                    <label class="control-label col-sm-3 disc-label" for="discount-rate">Discount (%)</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="disc" name="discount" placeholder="" onInput="calculateDiscount()" value="0" onchange="allowThreeDecimal(event)" min="0" />
                                                    </div>
                                                </div>
                                                <div class="form-group form-row mb-3">
                                                    <label class="control-label col-sm-3" for="discount-rate">Amount Paid</label>
                                                    <div class="col-sm-9">
                                                        <input type="number" class="form-control" id="amounpaid" name="amountPaid" placeholder="" onInput="calculateBalanceDue()" value="0" onchange="allowThreeDecimal(event)" min="0" />
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
                                                                name="paymentTerms"
                                                                maxlength="300"
                                                                placeholder="Notes - any relevant information not covered, additional terms and conditions"
                                                                style="height: 88px;"
                                                                maxlength="280"
                                                            ></textarea>
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
                                                                name="contractTerms"
                                                                placeholder="Notes - any relevant information not covered, additional Delivery Terms"
                                                                style="height: 88px;"
                                                                maxlength="280"
                                                            ></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-7"></div>
                                            <div class="col-lg-5 float-right invoice-totals">
                                                <div class="row">
                                                    <div class="col text-right">Subtotal</div>
                                                    <div class="col text-right">
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="subtotal" id="subTotalInput" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>

                                                <div class="row vat-summary-container">
                                                    <div class="vatlabel text-right col">VAT</div>
                                                    <div class="col text-right">
                                                        <input name="vatsummary" id="vatsummary" type="hidden" readonly class="border-0 vatsummary" style="user-select: none; outline: none;" size="2" value="" />
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="vat" id="vatpertotl" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>

                                                <div class="row disc-summary-container">
                                                    <div class="disclabel text-right col">Discount (0)</div>
                                                    <div class="col text-right">
                                                        <!--                                                    <span class="minus-summary">-</span>-->
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="discountedAmount" id="discpercent" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-right">Total Payable Amount</div>
                                                    <div class="col text-right">
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="totalPayableAmt" id="total" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-right">Amount Paid</div>
                                                    <div class="col text-right">
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="amountPaid" id="amounpaidfinal" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-right">Balance Due</div>
                                                    <div class="col text-right">
                                                        <span class="currency"></span>
                                                        <input type="text" readonly class="border-0" style="user-select: none; outline: none;" size="10" value="0.00" name="balance" id="balDue" />
                                                        <span class="currency-right"></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <input type="hidden" class="form-control datepicker" readonly id="cdate" name="cdate" placeholder="" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%= new java.util.Date()%>" />">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 my-3">
                                <button type="submit" class="btn btn-primary mr-2 btmMobilespace">Save</button>
                                <button type="submit" class="btn btn-primary mr-2 btmMobilespace">Save As Draft</button>
                                <button type="submit" class="btn btn-primary mr-2">Save As Send</button>
                                <a href="../tenant/receivablesList.htm" class="btn btn-danger ms-1">Cancel</a>

                                <button class="btn btn-primary ms-1" onclick="window.print()">Print</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

  <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Fill in the Invoice, Tenant, Rent, Recurring and Additional Details, and Save or Send or Print. </p>\n\
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
        </script>
<script src="standardInvoice.js"></script>
<script>
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
                // alert(data);
                if (data == "No Data") {
                    //  alert("Data is Not Aviable please Check");
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
$(".datepicker56")
    .datepicker({
        format: "dd-mm-yyyy",
        autoclose: true,
        todayHighlight: true,
        container: ".pick56",
    })
    .datepicker("update", new Date());
$(".datepicker57")
    .datepicker({
        format: "dd-mm-yyyy",
        autoclose: true,
        todayHighlight: true,
        container: ".pick57",
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

$("#quotationvalidity").on("change", function () {
    var quoTempDate = $("#date").val();
    var diffDays = $(this).val();
    var addFiveDays = moment(quoTempDate, "DD-MM-YYYY").add("days", diffDays).format("DD-MM-YYYY");

    $("#QuoExpiryDate").val(addFiveDays);
});

  $('#QuoExpDate').on('change', function () {
             var dateFrom = $('#QuoFromDate').datepicker('getDate');
                var dateTo = $(this).datepicker('getDate');
                if (dateFrom >= dateTo) {
                    swal("To date should be greater than from date.");
                    $(this).val('')
                }
                        })
</script>
   </body>
</html>

