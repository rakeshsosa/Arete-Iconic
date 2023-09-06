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
        <title>Arete Iconic</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Tenant Profiling&tab=Tenant Profiling&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Tenant Profiling List</h5></div> 
              <!-- Table with stripped rows -->
         
              <div class="table-responsive">
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Property Name</th>
                                                                    <th>Unit No</th>
                                                                         <th>Customer Name</th>
                                                                         <th>Contract Period</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Customer Reference</th>
                                                                    <th>Billing Cycle</th>
                                                                    <th>Renewal Date</th>
                                                                    <th>Approval Status</th>
                                                                    <th>Occupancy Status</th>
                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Actions</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${tenantProfilingList}" var="list">
                                                                <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.propertyName}</td>
                                                                        <td style="text-align: left;">${list.unitNumber}</td>
                                                                        <td style="text-align: left;">${list.customerName}</td>
                                                                         <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.contractStartDate}"/></td>
                                                                       <td style="text-align: left;">${list.tenantName}</td>
                                                                       <td style="text-align: left;">${list.customerReference}</td>
                                                                       <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.billingDate}"/></td>
                                                                       <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.renewalDate}"/></td>
                                                                       <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.renewalDate}"/></td>
                                                                         <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.renewalDate}"/></td>
                                                                        <td class=" last text-nowrap" >
                                                                           
                                                                          <a href="../management/tenantProfilingForm.htm?pk=${list.sno}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>&nbsp;
                                                                           <a href="../management/tenantProfilingForm.htm?pk=${list.sno}&action=edit" class="fa fa-pencil-square-o fa-lg" data-toggle="tooltip" title="Edit"></a>&nbsp;
                                                                            
                                                                           <a href="../insurance/tenantContractForm.htm" class="fa fa-recycle fa-lg" data-toggle="tooltip" title="Renew"></a>&nbsp;
<!--                                                                            <a href="#" class="fa fa-user fa-lg" data-toggle="tooltip" title="Register Tenant" onclick="openModel()"></a>&nbsp;-->
<!--                                                                            <a href="#" class="fa fa-envelope fa-lg" data-toggle="tooltip" title="Send Email"></a>&nbsp;
                                                                            <a href="../management/tenantProfilingForm.htm" class="fa fa-send fa-lg" data-toggle="tooltip" title="Vacate Notice"></a>&nbsp;-->
                                                                            

                                                                        </td>

                                                                    </tr>
                                                                    </c:forEach>
                                                               <%-- <c:forEach items="${insurMastr}" var="list">
                                                                    <c:set var="status" value="${list.status}"></c:set>
                                                                        <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.insuranceCompanyId}</td>
                                                                        <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td style="text-align: left;">${list.insuranceDesc}</td>
                                                                         <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="Outstanding Dues"></a>&nbsp;
                                                                          <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-window-close-o fa-lg"title="Cancel Notice"></a>&nbsp;

                                                                            <a onclick="openRemoveStock(event)" class="fa fa-check fa-lg"title="Confirm Vacate"></a>&nbsp;
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-handshake-o fa-lg"title="Process Handover"></a>&nbsp;
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-location-arrow fa-lg"title="Book Unit"></a>&nbsp;

                                                                        </td>

                                                                    </tr>
</c:forEach> --%>

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
        <h4 class="modal-title">Confirm Vacate</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

       
      <div class="modal-body">
          
          <form id="coustmermnForm" name="frm" accept-charset="UTF-8" method="post" action="../inventory/removeProductInventoryFormSubmit.htm" enctype="multipart/form-data">
               <div class="row mb-4">
                            <div class="col-md-12 mb-3">
                              <label for="groupname">
                                 Do you wish to confirm vacate the premises ?</label>
                                     <div>
                                         <label class="Yes">
                                              <input type="checkbox" name="checkbox" value="Yes"> Yes</label>
                                         <label class="No">
                                               <input type="checkbox" name="checkbox" value="No"> No</label>
                                      </div>
                             </div>
                     <div class="col-md-12 mb-3">
                              <label for="groupname">
                                Do you wish to vacate without clearing the outstanding dues ?</label>
                                     <div>
                                         <label class="Yes">
                                              <input type="checkbox" name="checkbox" value="Yes"> Yes</label>
                                         <label class="No">
                                               <input type="checkbox" name="checkbox" value="No"> No</label>
                                      </div>
                             </div>
                     <div class="col-md-12 mb-3">
                              <label for="groupname">
                                 Please select a mode for clearing the dues ?</label>
                                     <div>
                                         <label class="Cash">
                                              <input type="checkbox" name="checkbox" value="Cash"> Cash
                                         </label>
                                         <label class="Bank Transfer">
                                               <input type="checkbox" name="checkbox" value="Bank Transfer"> Bank Transfer
                                         </label>
                                            <label class="Post Dated Cheque">
                                               <input type="checkbox" name="checkbox" value="Post Dated Cheque"> Post Dated Cheque
                                         </label>
                                            <label class="Cheque">
                                               <input type="checkbox" name="checkbox" value="Cheque"> Cheque
                                         </label>
                                            <label class="Card">
                                               <input type="checkbox" name="checkbox" value="Card"> Card
                                         </label>
                                      </div>
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
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Register Tenant</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form class="validateForm" id="quoteForm" action="#"  method="post" enctype="multipart/form-data">
                <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Name <a class="text-danger">*</a></label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Phone Number <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Tenant Email Id <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Id Card Type <a class="text-danger">*</a></label>
                </div>
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Labour Card Number <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 form-floating mb-3">  
                  <input type="text" placeholder="Fill" class="form-control" id="" name="" value="">
                  <label class="control-label">Permanent Address <a class="text-danger">*</a></label>
                </div>
              
              <div class="col-md-12 col-sm-12 col-xs-12 mb-3">  
                   <label class="control-label">Attachment </label>
                  <input type="file" placeholder="Fill" class="form-control" id="" name="" value="">
                </div>
              
              
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
   <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit, Renew, Register Tenant, Send Email and Vacate Notice with the details of Property Name, Unit Number, Customer Name, Contract Period, Tenant Name, Customer Reference, Billing Cycle, Renewal Date, Approval Status and Occupancy Status. </p>\n\
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
          function openRemoveStock(e){
              

                        $('#removeStockModal').modal('show');
                      
                    }
                
                function openModel(){
                    $("#exampleModal").modal('show');
                }
                
      </script>
</body>

</html>
