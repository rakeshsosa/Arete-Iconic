
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
       @media screen and (max-width: 600px){
                        
                            .table-responsive{
                                overflow-x: auto !important;
                            }
                             }
    </style>  
    </head>

   <body class="nav-sm">
    <jsp:include page="../login/menu.htm" />
<main id="main" class="main">
    <div>
        <jsp:include page="../login/headerlink.htm?submodule=Account Receivables&tab=Booked Invoices&pagetype=list" />
    </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h5>Booked Invoices List</h5>
                        </div>
                        <table id="myTable" class="table datatable">
                            <thead>
                                <tr class="headings">
                                    <th><input type="checkbox" id="headcheck" class="headcheck"/> </th>
                                    <th>Invoice Date</th>
                                    <th>Invoice Type</th>
                                    <th>Invoice Number</th>

                                    <th>Customer Name</th>
                                    <th>Property Name</th>
                                    <th>Total Payable</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${bookedInvoicesList}" var="type">
                                        <tr>
                                            <td><input name="selectedvalues" type="checkbox" value='${type.SNo}_${type.unitName}' id="rowcheck" class="rowcheck"/> </td>
                                         <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.createdDate}"/></td>
                                         <td class="center">${type.invoiceType}</td>
                                         <td class="center">${type.invoiceNo}</td>
                                          <td class="center">${type.customerName}</td>
                                         <td class="center">${type.propertyName}</td>
                                         <td class="center">${type.totalPayableAmt}</td>
                                         <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.dueDate}"/></td>
                                         <td class="center">${type.status}</td>
<!--                                         <td id="qtnno">Test</td>-->
                                       
                                         <td class="text-nowrap">
                                        <a class="fa fa-eye fa-lg" href="../finance/rentInvoiceFormView.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="View" aria-label="View"></a>
                                        <a
                                            href="../invoice/rentInvoiceFormPrint.htm?pk=5005&amp;invoiceNo=INV-7&amp;themeType=&amp;userId=ibrahim@excelbizsolutions.com&amp;action=print"
                                            data-toggle="tooltip"
                                            data-bs-original-title="Print"
                                            aria-label="Print"
                                            target="_blank"
                                            class="fa fa-lg fa-print"
                                        ></a>

                                        <a
                                            href="javascript:"
                                            class="fa fa-envelope fa-lg"
                                            data-toggle="tooltip"
                                            data-bs-original-title="Send Email"
                                            aria-label="Send Email"
                                            onclick="
                                                                swal({
                                                                    text: 'Would you like to send the invoice in an email to customer? Please confirm.',
                                                                    buttons: ['Cancel', 'OK']
                                                                }).then(function (isConfirm) {
                                                                    if (isConfirm) {
                                                                        swal('Mail has been sent successfully !!!');
                                                                        window.location.href = '../invoice/rentInvoiceSendMail.htm?sno=5005&amp;invoiceNo=INV-7&amp;themeType=&amp;ownerFirstName=&amp;toemail=reenay12@gmail.com&amp;toname=Reena Yadav&amp;ccBcc=&amp;action=Mail';
                                                                    }
                                                                })
                                                           "
                                        ></a>

                                        <a
                                            href="../finance/processInvoice.htm?SNo=${type.SNo}"
                                            class="fa fa-money fa-lg"
                                            data-toggle="tooltip"
                                            data-bs-original-title="Process Invoice"
                                            aria-label="Process Invoice"
                                            
                                        >
                                        </a>

                                        <a href="../finance/cancelInvoice.htm?SNo=${type.SNo}"class="fa fa-remove fa-lg" data-toggle="tooltip" data-bs-original-title="Cancel" aria-label="Cancel"> </a>
                                    </td>                                    </tr>
                                </c:forEach>                           
                               
                            </tbody>
                        </table>
                    </div>
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
            content: '<p>Search, View, Print, Email, Process or Cancel Invoice with the detais of Invoice Date, Number, PD Cheque, Property Name, Unit Number, Due Date, and Status. </p>\n\
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

