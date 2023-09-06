
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
                            <jsp:include page="../login/headerlink.htm?submodule=Account Receivables&tab=Aging Invoices&pagetype=list"/>
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body table-responsive">
                                            <div class="card-title">
                                                <h5>Aging Invoice List</h5>
                                            </div>

                      
                           
                            <table id="myTable"  class="table datatable">
                                <thead>
                                    <tr class="headings">

                                        <th>Customer Name</th>
                                        <th>Total Invoices</th>
                                        <th>0 - 30 days</th>
                                         <th>31 - 60 days</th>
                                         <th>61 - 90 days</th>
                                         <th>Total Amount Due</th>
                                        <th>Action</th>
                                        <!--                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                                                            </th>-->
                                    </tr>
                                </thead>

                                <tbody>
                                        
                                    <c:forEach items="${agingInvoicesList}" var="type">
                                <tr>
<!--                                     <td><input type="checkbox" id="rowcheck" class="rowcheck"/> </td>-->
                                         <td class="center">${type.customerName}</td>
                                         <td class="center"></td>
                                          <td class="center"></td>
                                         <td class="center"></td>
                                         <td class="center"></td>
                                         <td class="center">${type.subtotal}</td>

                                    <td class="center">
                                        <a class="fa fa-eye fa-lg" onclick="openAddStock()" data-toggle="tooltip" data-bs-original-title="View" aria-label="View"> </a>
                                    </td>
                                </tr>
                               </c:forEach>
                                </tbody>

                            </table>


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
 <!-- add stock Modal popup form start here -->
<div class="modal" id="addStockModal">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Aging Invoice Preview</h4>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body px-5 py-2">
       <form id="coustmermnFormm" name="frm" accept-charset="UTF-8" method="post" action="../inventory/addproductInventoryFormSubmit.htm" enctype="multipart/form-data">
           <div class="row mb-4">
                <div class="col-md-4 form-floating mb-3">
                <input type="text" placeholder="customer Name" id="cusName" class="form-control"  name="cusName" maxlength="98" required>
                <label for="groupname"><span style="color:red">*</span> Customer Name</label>
            </div> 
                <div class="col-md-4 form-floating mb-3">
                <input type="text" placeholder="customer Name" id="PropertyName" class="form-control"  name="PropertyName" maxlength="98" required>
                <label for="groupname"><span style="color:red">*</span> Property Name</label>
            </div> 
                  <div class="col-md-4 form-floating mb-3">
                <input type="text" placeholder="customer Name" id="unitName" class="form-control"  name="unitName" maxlength="98" required>
                <label for="groupname"><span style="color:red">*</span> Unit Name / Unit Number</label>
            </div> 
               
                 <table id="myTable"  class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr class="headings">

                                        <th>Invoice Date</th>
                                        <th>Invoice</th>
                                            <th>Invoice Type</th>
                                            <th>Due Date</th>
                                         <th>Total Amount</th>
                                         <th>Amount Paid</th>
                                         <th>Total Outstanding Amount</th>
                                         <th>Number Of overdue Days</th>
                                        
                                        <!--                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                                                            </th>-->
                                    </tr>
                                </thead>

                                <tbody>
                                         <tr>

                                            <td class="center">Test</td> 
                                            <td class="center">Test</td> 
                                             <td class="center">Test</td> 
                                              <td class="center">Test</td> 
                                               <td class="center">Test</td> 
                                                <td class="center">Test</td> 
                                                 <td class="center">Test</td> 
                                                  <td class="center">Test</td> 
                                                  
                                                   
                                            
                                         </tr>
                                </tbody>
                 </table>
           </div>
           <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        
      </div>
          </form>
       
      </div>
    </div>
  </div>
</div>
 <!-- add stock Modal popup form ends here -->
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Search and View the Customer Name, Total Invoices, upto 30 days, 60 days & 90 days  and Total Amount Due. </p>\n\
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

 <!--add stock all scripts starts here -->
  <script>
          function openAddStock(){
              debugger
             // var agingModal = new bootstrap.Modal(document.getElementById('addStockModal'))

           //  var agingModal = document.getElementById("")
          // agingModal.toggle()
          // agingModal.show()
             $('#addStockModal').modal('show');
                      
                    }
 </script>





</body>

</html>

