
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Arete Iconic</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
</head>
<body class="nav-sm">
<jsp:include page="../login/menu.htm" />
    <jsp:include page="../login/footer.jsp" /> 

   <main id="main" class="main">
       <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Manage Invoice&tab=Rent Invoices General&pagetype=list"/> 
    </div>
    <div class="pagetitle"></div>
   <section class="section">
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="card-title">
                        <h5>Rent Invoices General</h5>
                    </div>
                    <form id="rentInvoice" action="../finance/bulkConfirmPosting.htm">
                    <div class="table-responsive">
                        <table id="example" class="table datatable table-hover table-bordered">
                            <thead>
                                <tr class="headings">     
                                      <th><input type="checkbox" id="headcheck" class="headcheck"/> </th>
                                    <th>Invoice Date</th>
                                    <th>Invoice Number</th>
                                  
                                    <th>Property Name</th>
                                    <th>Unit Number</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${rentInvoiceGeneralList}" var="type">
                                        <tr>
                                            <td><input name="selectedvalues" type="checkbox" value='${type.SNo}' id="rowcheck" class="rowcheck"/> </td>
                                         <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.createdDate}"/></td>
                                         <td class="center">${type.invoiceNo}</td>
                                         <td class="center">${type.propertyName}</td>
                                         <td class="center">${type.unitName}</td>
                                         <td class="center"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.dueDate}"/></td>
                                         <td class="center">${type.status}</td>
<!--                                         <td id="qtnno">Test</td>-->
                                       
                                         <td class="text-nowrap">
                                            <a class="fa fa-search-plus fa-lg" href="../finance/rentInvoiceFormView.htm?SNo=${type.SNo}" data-toggle="tooltip" data-bs-original-title="View" aria-label="View"></a>
                                            &nbsp;
                                            <a href="../finance/rentInvoiceFormEdit.htm?SNo=${type.SNo}" class="fa fa-pencil fa-lg" title="" data-toggle="tooltip" data-bs-original-title="Edit" aria-label="Edit"></a>                                    
                                            <a
                                                href="../invoice/rentInvoiceFormPrint.htm?pk=5005&amp;invoiceNo=INV-7&amp;themeType=&amp;userId=ibrahim@excelbizsolutions.com&amp;action=print"
                                                data-toggle="tooltip"
                                                data-bs-original-title="Print"
                                                aria-label="Print"
                                                target="_blank"
                                                class="fa fa-lg fa-print"
                                            ></a>
                                            &nbsp;

                                            <a
                                                href="../finance/rentPosting.htm?SNo=${type.SNo}"
                                                class="fa fa-envelope-open-o fa-lg"
                                                data-toggle="tooltip"
                                                data-bs-original-title="Rent Posting"
                                                aria-label="Rent Posting"
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
                                                href="javascript:"
                                                class="fa fa-repeat fa-lg"
                                                data-toggle="tooltip"
                                                data-bs-original-title="Make Recurring"
                                                aria-label="Make Recurring"
                                                onclick="recurringInvoice(5005,'ibrahim@excelbizsolutions.com', 'INV-7','Reena Yadav','','reenay12@gmail.com','RINV-1','Mohammed Ibrahim','0.0','100.0','100.0','Partially Paid Amount')"
                                            >
                                            </a>

                                            <a href="../finance/cancelInvoice.htm?SNo=${type.SNo}" class="fa fa-remove fa-lg" data-toggle="tooltip" data-bs-original-title="Cancel" aria-label="Cancel"> </a>
                                        </td>
                                    </tr>
                                </c:forEach>                              
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-12 d-flex justify-content-center">
                        <button class="btn btn-primary" onclick="getSelected(event)">Confirm Bulk Posting</button>
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
            content: '<p>Do the Bulk Posting the invoices with the details of Invoice Date, Number, Property Name, Unit Number, Due date and Status. </p>\n\
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

function getSelected(e) {
    e.preventDefault();
//    var selectedIds = tbl.columns().checkboxes.selected()[0];
     var x = $("input[name = 'selectedvalues']:checked").length;

//    if (Array.isArray(selectedIds) && selectedIds.length) {
   if (parseInt(x) != 0) {
        swal({
            text: "Do you wish to bulk post these invoices ?",
            buttons: ["Cancel", "OK"],
        }).then(function (isConfirm) {
            if (isConfirm) {
                $("#rentInvoice").submit()
//                window.location.href = "../finance/bulkConfirmPosting.htm";
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

