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
           <jsp:include page="../login/headerlink.htm?submodule=Incoming Tax Tracking&tab=Incoming Tax Tracking&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Income Tax Tracking List</h5></div> 
                <div class="row">
                
                 <div class="col-md-4 form-floating mb-3">
                                        <input class="form-control capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>Property Name</label>
                                         </div>  
                 <div class="col-md-4 form-floating mb-3">
                                        <input class="form-control capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>Tenant Name</label>
                                         </div>  
                </div>
                <div class="row">
                                    <div class="col-md-4 form-floating mb-3 pick3">
                                        <input autocomplete="off" class="form-control datepicker3 capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>From Time Period</label>
                                         </div>  
                                     <div class="col-md-4 form-floating mb-3 pick2">
                                         <input autocomplete="off" class="form-control datepicker2 capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>To Time Period</label>
                                         </div>     
                </div>
                <div class="table-responsive">
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Invoice Number</th>
                                                                    <th>Property Name</th>
                                                                     
                                                                    <th>Tenant Name</th>
                                                                        <th>Total Invoice Amount</th>
                                                                        <th>Tax Name</th>
                                                                        <th>Tax Percentage</th>
                                                                    <th>Tax Amount</th>
                                                                    <th>Tax Filling Deadline</th>
                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               <c:forEach items="${insurMastr}" var="list">
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
                                                                        <td class=" last text-nowrap">
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-calendar-o fa-lg"title="Set Tax Deadline"></a>&nbsp;
                                                                                   <a onclick="openRemoveStock(event)" class="fa fa-check-circle-o fa-lg"title="Confirm Tax Payment"></a>&nbsp;
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-envelope-open-o fa-lg"title="Post Entry"></a>&nbsp;

                                                                        </td>

                                                                    </tr>
                                                 </c:forEach> 

                                                            </tbody>
				</table>
                </div>
                <div class="text-left row justify-content-end my-3">
                    <div class="col-md-4">
                        <label class="form-label">Total Tax Amount Collected For The Period</label>
                        <input type="text" class="form-control " readonly="" >
                    </div>
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
        <h4 class="modal-title">Confirm this tax payment</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

       
      <div class="modal-body">
          
          <form id="coustmermnForm" name="frm" accept-charset="UTF-8" method="post" action="../inventory/removeProductInventoryFormSubmit.htm" enctype="multipart/form-data">
               <div class="row mb-4">
                            <div class="col-md-12 mb-3">
                              <label for="groupname">Do you wish to confirm this tax payment
                                </label>
                                     <div>
                                         <label class="Yes">
                                              <input type="checkbox" name="checkbox" value="Yes"> Yes</label>
                                         <label class="No">
                                               <input type="checkbox" name="checkbox" value="No"> No</label>
                                      </div>
                             </div>
                     <div class="col-md-12 mb-3">
                              <label for="groupname">
                                Tax Not Applicable</label>
                                     <div>
                                         <label class="Yes">
                                              <input type="checkbox" name="checkbox" value="Yes"> Yes</label>
                                         <label class="No">
                                               <input type="checkbox" name="checkbox" value="No"> No</label>
                                      </div>
                             </div>
                     <div class="col-md-12 mb-3 pick5">
                              <label for="groupname">Tax Payment Date</label>
                                     <div>
                                         <input type="text" class="datepicker5 form-control" id="">
                                      </div>
                             </div>
                     <div class="col-md-12 mb-3">
                              <label for="groupname">Tax Payment Date</label>
                                     <div>
                                         <input type="file" class="form-control" id="">
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
  <script>
        $(document).ready(function () {
                    $('.datepicker3').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick3'
            })  
 $('.datepicker2').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick2'
            })
             $('.datepicker5').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick5'
            })
             $('.datepicker4').datepicker({
                format: 'dd-mm-yyyy',
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
