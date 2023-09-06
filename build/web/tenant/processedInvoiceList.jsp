
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
</head>

<body class="nav-sm">
 <jsp:include page="../login/menu.htm" />
<main id="main" class="main">
    <div>
        <jsp:include page="../login/headerlink.htm?submodule=Account Receivables&tab=Process Invoices&pagetype=list" />
    </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h5>Processed Invoices List</h5>
                        </div>
                        <div class="table-responsive">
                        <table id="myTable" class="table datatable">
                            <thead>
                                <tr class="headings">
                                    <th><input type="checkbox" id="headcheck" class="headcheck"/> </th>
                                    <th>Invoice Date</th>

                                    <th>Invoice Number</th>
                                    <th>Invoice Type</th>

                                    <th>Customer Name</th>
                                    <th>property Name</th>
                                    <th>Unit Number</th>
                                    <th>Due Date</th>
                                    <th>Invoice Processing Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody id="invoicetable">
                                <c:forEach items="${processedInvoicesList}" var="type">
                                <tr>
                                    <td><input type="checkbox" id="rowcheck" class="rowcheck"/> </td>
                                    <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.createdDate}"/></td>
                                         <td class="center">${type.invoiceNo}</td>
                                         <td class="center">${type.invoiceType}</td>
                                          <td class="center">${type.customerName}</td>
                                         <td class="center">${type.propertyName}</td>
                                         <td class="center">${type.unitName}</td>
                                         <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.dueDate}"/></td>
<%--                                         <td class="center">${type.status}</td>  --%>

                                    <c:if test = "${type.invoiceProcessingType == 'PROCESSING' || type.invoiceProcessingType == 'PROCESSED'}">
                                        <td class="center">${type.invoiceProcessingType}</td>
                                    </c:if>
                                    <c:if test = "${type.invoiceProcessingType == '' || type.invoiceProcessingType == null || type.invoiceProcessingType == 'PENDING'}">
                                        <td class="center">
                                            <select class="Status form-control">
                                                <option selected="" disabled="">Select an option</option>
                                                 <option value="Processed">Processed</option>
                                                   <option value="Aging">Aging</option>
                                                    <option value="Cancelled">Cancelled</option>
                                              
                                         
                                            </select>
                                        </td>
                                    </c:if>
                                    

                                    <td class="text-nowrap">
<!--                                        <a class="fa fa-money fa-lg" href="../invoice/rentInvoiceFormView.htm?sno=5005&amp;invoiceNo=INV-7&amp;action=view" data-toggle="tooltip" data-bs-original-title="Payment History" aria-label="View"></a>-->
  <a class="fa fa-money fa-lg" href="../finance/paymentHistoryList.jsp" data-toggle="tooltip" data-bs-original-title="Payment History" aria-label="View"></a>
                                      <c:if test = "${type.invoiceProcessingType == 'PROCESSING' || type.invoiceProcessingType == 'PROCESSED'}">
                                          
                                        <a class="fa fa-credit-card fa-lg" style="pointer-events: none; opacity: 0.6; color: #6c757d;" href="../finance/processedInvoiceForm.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="Process Payment" aria-label="View"></a>
                                    </c:if>
                                    <c:if test = "${type.invoiceProcessingType == '' || type.invoiceProcessingType == null || type.invoiceProcessingType == 'PENDING'}">
                                        <a class="fa fa-credit-card fa-lg" href="../finance/processedInvoiceForm.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="Process Payment" aria-label="View"></a>
                                    </c:if>
                                    <c:if test = "${type.ledgerVoucherType == 'PROCESSED'}">
                                          
                                        <a style="pointer-events: none; opacity: 0.6; color: #6c757d;" class="fa fa-edit fa-lg" href="../finance/voucherInvoiceForm.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="Ledger Voucher" aria-label="View"></a>
                                    </c:if>
                                    <c:if test = "${type.ledgerVoucherType == '' || type.ledgerVoucherType == null}">
                                          
                                        <a class="fa fa-edit fa-lg" href="../finance/voucherInvoiceForm.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="Ledger Voucher" aria-label="View"></a>
                                    </c:if>

                                        <a href="../finance/cancelInvoice.htm?SNo=${type.SNo}" class="fa fa-remove fa-lg" data-toggle="tooltip" data-bs-original-title="Cancel" aria-label="Cancel"> </a>
                                    </td>
                                </tr>
                               </c:forEach>
                            </tbody>
                        </table>
                    </div> </div>
                </div>
            </div>
        </div>
    </section>
</main>

  <jsp:include page="../login/footer.jsp" />
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Get Payment History, Process Payment, Ledger Voucher, and Cancel with the Invoice Date, Number, Type, Status, etc. </p>\n\
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
    <script>

var indexNo;
$(".Status").on("change", function (event) {
    if ($(this).val() !== "Active") {
    
        swal("Would you like to confirm, Please write message", {
            closeOnClickOutside: false,
            content: "input",
            buttons: ["Cancel", "OK"],
        }).then((value) => {
            if (value == null || value == "") {
                event.target.selectedIndex = indexNo;
                event.preventDefault();
                return false;
            } else {
                indexNo = event.target.selectedIndex;
                $(this).closest("tr").find("#reason").text(value);

                var status = $(this).val();
                var sno = $(this).closest("tr").find("#SINO").text();
                var reason = value;
                //alert(reason);

                $.ajax({
                    type: "POST",
                    url: "../quotation/changeQuotStatus.htm",
                    data: {
                        status: status,
                        sno: sno,
                        reason: reason,
                    },
                    dataType: "text",
                    success: function (data) {},
                });
            }
        });


        if ($(this).closest("tr").find('input[type="checkbox"]:checked').length > 0) {
            $(this).closest("tr").find('input[type="checkbox"]').trigger("click");
        }
        $(this).closest("tr").find('input[type="checkbox"]').prop("checked", false);
        $(this).closest("tr").find('input[type="checkbox"]').attr("disabled", true);
    } else {
        $(this).closest("tr").find('input[type="checkbox"]').removeAttr("disabled");
        $(this).closest("tr").find("#reason").text("");
        var status = $(this).val();
        var sno = $(this).closest("tr").find("#SINO").text();
        var reason = "";
        //alert(reason);

        $.ajax({
            type: "POST",
            url: "../quotation/changeQuotStatus.htm",
            data: {
                status: status,
                sno: sno,
                reason: reason,
            },
            dataType: "text",
            success: function (data) {},
        });
    }
});

function getSelected() {
    var selectedIds = tbl.columns().checkboxes.selected()[0];
    if (Array.isArray(selectedIds) && selectedIds.length) {
        swal({
            text: "Do you wish to bulk post these invoices ?",
            buttons: ["Cancel", "OK"],
        }).then(function (isConfirm) {
            if (isConfirm) {
                window.location.href = "../quotation/managingOrederReceivedStatus.htm?sno=" + selectedIds + "";
            }
        });
    } else {
        swal("Please select atleast one checkbox");
    }
}
$("#headcheck").on('click', function (e) {
     $('input:checkbox').not(this).prop('checked', this.checked);
})
    </script>
</body>
</html>

