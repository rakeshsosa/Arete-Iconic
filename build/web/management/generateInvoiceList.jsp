
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

        <script type="text/javascript">
            function validationForm() {
//                if (confirm("Would you like to E-mail this particular sales quoute to a customer ? Kindly confirm")) {
//                    swal("Mail has been sent successfully !!!");
//
//                } else {
//
//                    return false;
//
//                }

                

            }
        </script>

        <style>
            .vertical-alignment-helper {
    display:table;
    height: 100%;
    width:70%;
   padding-left:30%;
}
.vertical-align-center {
    /* To center vertically */
    display: table-cell;
    vertical-align: middle;
}
        </style>
    </head>

   <body class="nav-sm">
    <jsp:include page="../login/menu.htm" />

                    <main id="main" class="main">
                        <div>
                                <ul class="nav nav-pills">
                                    <li class="nav-item "><a class="nav-link active" href="#">Generate Invoice</a></li>
                                </ul>
                                <br>
                                
                            </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Rent Invoices List</h5>
                                            </div>
                            <table id="myTable"  class="table table-bordered table-hover">
                                <thead>
                                    <tr class="headings">
                                        <th class="head-check"></th>
                                        <th>Utility Bill Number</th>
                                        <th>Utility Name</th>
                                        <th>Billing Period</th>
                                        <th>Total Consumption</th>
                                        <th>Total Bill Consumption (Per Tenant)</th>
                                        <th>Action</th>                                    
                                    </tr>
                                </thead>

                                <tbody>
                                
                                    <c:forEach items="${quotationPageList}" var="type">
                                        <c:if test="${type.recordStatus ne 'Order On Hold' && type.recordStatus ne 'Order Created' && type.recordStatus ne 'Invoice created'}">
                                        <c:set var="date"><fmt:formatDate pattern="dd-MM-yyyy" value="${type.date}"/></c:set>
                                            <tr>
                                            <td></td>
                                            <td class="center" id="qtnno">${type.quotationno}</td>
                                            <td class="center">${type.customerName}</td>
                                            <td class="center">${date}</td>
                                            <td class="center">${type.status}</td>
                                           
                                            <td class="center">
                                             <select class="Status form-control" >
                                                 <c:if test="${type.status eq 'Active'}">
                                                     <option value="${type.status}" selected>${type.status}</option>
                                                     <option value="Inactive"> Inactive </option>
                                             <option value="Quote on hold" > Quote on hold </option>
                                             <option value="Lost" > Lost Order </option>
                                                 </c:if>
                                              
                                             
                                            
                                             </select>
                                            </td>


                                            <td class="center">
                                                    
                                                        <a class="fa fa-search-plus fa-lg" href="../invoice/rentInvoiceFormView.htm?sno=5005&amp;invoiceNo=INV-7&amp;action=view" data-toggle="tooltip" data-bs-original-title="View" aria-label="View"></a>&nbsp;
<a href="../assets/assetsDetailsForm.htm?pk=59&amp;assetCode=PROPERTY-1&amp;action=edit" class="fa fa-pencil fa-lg" title="" data-toggle="tooltip" data-bs-original-title="Edit" aria-label="Edit"></a>
                                                        <a href="../assets/assetsDetailsForm.htm?pk=59&amp;assetCode=PROPERTY-1&amp;action=edit" class="fa fa-newspaper-o fa-lg" title="" data-toggle="tooltip" data-bs-original-title="Generate Receipt" aria-label="Generate Receipt"></a>
                                                            <a href="../invoice/rentInvoiceFormPrint.htm?pk=5005&amp;invoiceNo=INV-7&amp;themeType=&amp;userId=ibrahim@excelbizsolutions.com&amp;action=print" data-toggle="tooltip" data-bs-original-title="Print" aria-label="Print" target="_blank" class="fa fa-lg fa-print"></a>&nbsp;
                                                        
<a href="../assets/assetsDetailsForm.htm?pk=59&amp;assetCode=PROPERTY-1&amp;action=edit" class="fa fa-envelope-open-o fa-lg" data-toggle="tooltip" data-bs-original-title="Rent Posting" aria-label="Rent Posting"></a>

                                                        <a href="javascript:" class="fa fa-envelope fa-lg" data-toggle="tooltip" data-bs-original-title="Send Email" aria-label="Send Email" onclick="
                                                                swal({
                                                                    text: 'Would you like to send the invoice in an email to customer? Please confirm.',
                                                                    buttons: ['Cancel', 'OK']
                                                                }).then(function (isConfirm) {
                                                                    if (isConfirm) {
                                                                        swal('Mail has been sent successfully !!!');
                                                                        window.location.href = '../invoice/rentInvoiceSendMail.htm?sno=5005&amp;invoiceNo=INV-7&amp;themeType=&amp;ownerFirstName=&amp;toemail=reenay12@gmail.com&amp;toname=Reena Yadav&amp;ccBcc=&amp;action=Mail';
                                                                    }
                                                                })
                                                           "></a>   
                                                       
                                                         
                                                           
                                                              
                                                            <a class="fa fa-remove fa-lg" data-toggle="tooltip" data-bs-original-title="Cancel" aria-label="Cancel" onclick="cancelInvoice(5005, 'INV-7')">                                             
                                                        </a>
                                                        
                                                </td>
                               


                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                          
                                </tbody>

                            </table>
                        </div>

<div id="mymodalContainer"></div>
                        <div class="col-lg-12 d-flex justify-content-center my-3">
                            <button class="btn btn-primary" onclick="getSelected()">Generate Bulk Invoice For All Tenants</button>

                        </div>

                    </div>

                </div>
            </div>
    
  </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->

                  <jsp:include page="../login/footer.jsp" /> 

    <script>
           var tbl;
       $(document).ready(function (){
          tbl = $('#myTable').DataTable({
              'initComplete': function(settings){
         var api = this.api();

         api.cells(
            api.rows(function(idx, data, node){
               return (data[4] !== 'Active') ? true : false;
            }).indexes(),
            0
         ).checkboxes.disable();
      },
            columnDefs: [{
                targets: 0,
                data: 7,
                'checkboxes': {
                    
                    'selectRow': false
                },
//                 type: 'natural'
                
            },
            
//            { "visible": false, "targets": 2 }
            ],
            select: {
                style: 'multi'
            },       
//            order: [[ 4, "desc" ]],
            order: false,
            
            iDisplayLength: 10,
            drawCallback: function () {
                var api = this.api();
                var rows = api.rows({ page: 'current' }).nodes();
                var last = null;

            }
        });   
});



              var indexNo ;         
 $(".Status").on("change", function(event) {
     
    if ($(this).val() !== "Active") {
        
     //  var status = $(this).val();
     //  var qtnno = $(this).closest('tr').find("#qtnno").text();
     //       openmymodal(status, qtnno);
        // var reason = prompt("Please write remarks!");
        
        
        console.log(indexNo);
         swal("Would you like to confirm, Please write message", {
                            closeOnClickOutside: false,
                            content: "input",
                            buttons:["Cancel", "OK"]
                          })
                          .then((value) => {
                             if (value == null || value == '') {
                                 event.target.selectedIndex = indexNo;
                                 event.preventDefault();
                            return false;
                        }
                       else {
                              indexNo = event.target.selectedIndex;
                              $(this).closest('tr').find("#reason").text(value);
                              
                              var status = $(this).val();
                                var sno = $(this).closest('tr').find("#SINO").text();
                                var reason = value;
                                //alert(reason);

                                                $.ajax({
                                                    type: "POST",
                                                    url: "../quotation/changeQuotStatus.htm",
                                                    data: {
                                                        status : status,
                                                        sno : sno,
                                                        reason : reason


                                                    },
                                                    dataType: "text",
                                                    success: function (data){
                                                        
                                                    }

                                                });
                           }
                       });
                       
       // $(this).closest('tr').find("#reason").text(value);
        
        if ($(this).closest('tr').find('input[type="checkbox"]:checked').length > 0) {
            $(this).closest('tr').find('input[type="checkbox"]').trigger('click');
        }
    $(this).closest('tr').find('input[type="checkbox"]').prop("checked", false);
    $(this).closest('tr').find('input[type="checkbox"]').attr("disabled", true);
    
   

} else {

    $(this).closest('tr').find('input[type="checkbox"]').removeAttr("disabled");
    $(this).closest('tr').find("#reason").text("")
   var status = $(this).val();
                                var sno = $(this).closest('tr').find("#SINO").text();
                                var reason = "";
                                //alert(reason);

                                                $.ajax({
                                                    type: "POST",
                                                    url: "../quotation/changeQuotStatus.htm",
                                                    data: {
                                                        status : status,
                                                        sno : sno,
                                                        reason : reason


                                                    },
                                                    dataType: "text",
                                                    success: function (data){
                                                        
                                                    }

                                                });
}



});


      function getSelected(){
	var selectedIds = tbl.columns().checkboxes.selected()[0];
	//console.log(selectedIds)
        
             
 
 
         if(Array.isArray(selectedIds) && selectedIds.length){
//             if(confirm("Do you wish to convert this sales quote to a client order ?")){
//                //window.location.href = "../quotation/managingOrederReceivedStatus.htm?sno=" + selectedIds + "";
//             }
             swal({
                 text:"Do you wish to bulk post these invoices ?",
                 buttons: [
                     'Cancel',
                     'OK'
                 ]
             }).then(function(isConfirm){
                    if (isConfirm) {         
                        window.location.href = "../quotation/managingOrederReceivedStatus.htm?sno=" + selectedIds + "";
                    }
                    }
                    );
      } else {
          swal("Please select atleast one checkbox")
         
        }
 
         
           

               }
               
$(document).ready(function (){
        //$(".Status").find('option[value="Active"]').attr("selected",true);
       
      //  $(".head-check").find('input[type="checkbox"]').attr("disabled", true);

});
    </script>


    <script>
        NProgress.done();
    </script>
    <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <script src="../common/theme/js/custom.js?ver=1.5"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css">
<!--    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">-->
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<!--    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>-->
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>
    <script src="https://cdn.datatables.net/plug-ins/1.10.22/sorting/natural.js"></script>
        <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script src="https://cdn.datatables.net/plug-ins/1.10.22/sorting/natural.js"></script>
        <script type="text/javascript">
           $(document).ready(function() {
            tippy('#information', {
          content: '<p>The complete list of all compled sales quote data that you have saved in the application is displayed in this page. The list also provides the action items on the right end column for additional features to "view" , "Print" & "Send Email" quotations.<p>\n\
        ------------------------------------------------------------------------------------\n\
        <ul ><li>The "Search" feature in the page can be utilized to search for customers listed in the page.</li>\n\</ul>',
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
</body>

</html>

