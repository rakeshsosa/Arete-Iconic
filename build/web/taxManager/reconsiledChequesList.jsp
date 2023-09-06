<%-- 
    Document   : assetDetailsList
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=cheque manager&tab=Reconsiled Cheques&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Reconsiled Cheques List</h5></div> 
<!--                <div class="text-end">
                  <a class="btn btn-primary btn-sm " href="../taxManager/bulkPostEntryList.htm"><i class="bi bi-plus"></i> Bulk Post Entry</a>
                 </div>-->
               <div class="table-responsive">
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>PD Cheque</th>
                                                                     <th>Invoice Number</th>
                                                                    <th>Date</th>
                                                                    <th>Property Name</th>
                                                                    <th>Unit Number</th>
                                                                    <th>Tenant Name</th>
                                                                        <th>Due Date</th>
                                                                        <th>Payment Mode</th>
                                                                        <th>TRF Number</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                 
									  <tr class="even pointer">    
                                                                            <td>Test</td>
                                                                        <td>Test</td>
                                                                          <td>Test</td>
                                                                            <td>Test</td>
                                                                              <td>Test</td>
                                                                                <td>Test</td>
                                                                                  <td>Test</td>
                                                                                    <td>Test</td>
                                                                                       <td>Test</td>
                                                                        <td class=" last ">
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
<!--                                                                             <a href="../tenant/voucherForm.htm" class="fa fa-envelope-open-o fa-lg" data-toggle="tooltip" data-bs-original-title="Ledger Voucher"></a>&nbsp;-->

                                                                        </td>

                                                                    </tr>
                                               

                                                            </tbody>
				</table>
               </div>
			   </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
<div class="modal" id="removeStockModal">
  <div class="modal-dialog mw-100 w-50">
    <div class="modal-content">

    
      <div class="modal-header">
        <h4 class="modal-title">Cancel Cheque</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

       
      <div class="modal-body">
          
          <form id="coustmermnForm" name="frm" accept-charset="UTF-8" method="post" action="../inventory/removeProductInventoryFormSubmit.htm" enctype="multipart/form-data">
               <div class="row mb-4">
                            <div class="col-md-12 mb-3">
                              <label for="groupname">Do you wish to cancel this cheque ?
                                </label>
                                     <div>
                                         <label class="Yes">
                                              <input type="checkbox" name="checkbox" value="Yes"> Yes</label>
                                         <label class="No">
                                               <input type="checkbox" name="checkbox" value="No"> No</label>
                                      </div>
                             </div>
                     <div class="col-md-4 form-floating mb-3">
                                           <select type="text" autocomplete="off" id="accountGroup" name="accountGroup" maxlength="20" class="form-control capitalize validate[required]" value="" placeholder="" data-original-title="Account Group">
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Pay Through Online">Pay Through Online</option>
                                                <option value="Pay Through Cash">Pay Through Cash</option>
                                                <option value="Pay Through Card">Pay Through Card</option>
                                                <option value="Replace The Cheque">Replace The Cheque</option>  
                                                <option value="Others">Others</option>
                                            </select>
         <label class="control-label"><span style="color:red">*</span>Cancel Reason</label>
                                          </div>
                   <div class="col-md-4 form-floating mb-3">
                                           <select type="text" autocomplete="off" id="accountGroup" name="accountGroup" maxlength="20" class="form-control capitalize validate[required]" value="" placeholder="" data-original-title="Account Group">
                                                <option value="" selected="">Select an Option</option>
                                                <option value="Cash">Cash</option>
                                                <option value="Debit / Credit">Debit / Credit</option>
                                                <option value="Bank Transfer">Bank Transfer</option>
                                            </select>
         <label class="control-label"><span style="color:red">*</span>Changed Payment Mode</label>
                                          </div>
                   
                        </div>
                <div class="row">
                        <c:if test="${action ne 'view'}">                      
                                                    <div class="d-flex justify-content-center w-100">
                                                        <input type="submit"
                                                               class="btn btn-primary mr-2"  id="savebtn" value="Save">

<button type="button" class="btn btn-danger ms-2" data-bs-dismiss="modal">Cancel</button>
                                                    </div>
                                                </c:if>
                   
                                               
                                            </div>
          </form>
       
      </div>


    </div>
  </div>
</div>
   <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Add Bulk Post Entry, Search, View, and Send Ledger Voucher with PD Cheque, Voucher Number, Date, Property Name, Unit Number, Tenant Name, Due Date, Payment Mode, and TRF Number. </p>\n\
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
        $(document).ready(function () {
                    $('.datepicker3').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick3'
            })  
 $('.datepicker2').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick2'
            })
             $('.datepicker5').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick5'
            })
             $('.datepicker4').datepicker({
                format: 'dd-M-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick4'
            })
            
    })
          function openRemoveStock(e){
              

                        $('#removeStockModal').modal('show');
                      
                    }
      </script>
</body>

</html>
