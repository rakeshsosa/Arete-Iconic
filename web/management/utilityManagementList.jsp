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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Utility Management&tab=Utility Management&pagetype=list"/>
       </div>
        <div class="text-end">
                  <a class="btn btn-primary btn-sm " id="utilityBtn"><i class="bi bi-plus"></i> Create Utility Bills</a>
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
              <form  method="post" class="row">
              <div class="col-md-4  form-floating mb-3">     
                                                   <select placeholder="Fill" class="form-select" id="jointeeName1" name="jointeeName1" >
                                                   <option value="individual">Individual Utility</option>
                                                   <option value="common">Common Utility</option>
                                                   </select>
                                            <label class="control-label">Choose Utility Type<a class="text-danger">*</a></label>
                                        </div>
                              
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                             <input type="text" required="" placeholder="Fill" class="form-control datepicker" id="billingDate" name="billingDate" value="">
                                              <label class="control-label">Choose Billing Month <a class="text-danger">*</a></label>
                                        </div>
              </form>
                                     <div class="table-responsive">              
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Property Name</th>
                                                                         <th>Unit Number</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Number Of Services</th>
                                                                    <th>Total Monthly Service Charges</th>
                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${utilityManagementList}" var="list">
                                                                        <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.propertyName}</td>
                                                                        <td style="text-align: left;">${list.unitNumber}</td>
                                                                        <td style="text-align: left;">${list.tenantName}</td>
                                                                         <td style="text-align: left;">${list.utilityBillNumber}</td>
                                                                       <td style="text-align: left;">${list.totalBillConsuption}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <a href="../management/individualUtilityForm.htm?pk=${list.sNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <a  class="fa fa-pencil-square-o fa-lg"title="Edit" href="../management/individualUtilityForm.htm?pk=${list.sNo}&action=edit"> </a>
                                                                            <a href="../management/generateInvoiceList.htm?action=view" class="fa fa-newspaper-o fa-lg" data-bs-toggle="tooltip" title="Generate Invoice"></a>
                                                                            <c:if test="${list.updateStatus eq 'Inactive'}">
                                                                            
                                                                               <a class="fa fa-trash  fa-lg" title="Active" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record active? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../management/updateUtilityManagementStatus.htm?SNo=${list.sNo}&updateStatus=${list.updateStatus}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                        
                                                                            </a>
                                                                                 </c:if>
                                                                          <c:if test="${list.updateStatus == 'Active' || list.updateStatus == 'Update0'}">
                                                                            
                                                                               <a class="fa fa-trash  fa-lg" title="Inactive" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record inactive? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../management/updateUtilityManagementStatus.htm?SNo=${list.sNo}&updateStatus=${list.updateStatus}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                              
                                                                            </a>
                                                                                 </c:if>
                                                                            <a href="#" class="fa fa-envelope fa-lg" data-bs-toggle="tooltip" title="Email"></a>

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
    </section>

  </main><!-- End #main -->

   <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit, Generate Invoice, Delete and Email the choosen Utility Type and Month with the details of Property Name, Unit Number, Tenant Name, Number of Services, and Total Monthly charges. </p>\n\
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
     $("#utilityBtn").on("click", function (e) {
         
         swal({
  text: "Please choose the type of utility you want to create?",
 // icon: "fi",
  buttons: true,
        buttons: {
    cancel: "Cancel",
    common: {
      text: "Common utility"
    },
    Individual: {
      text: "Individual utility"
    },
  },
  dangerMode: true,
}) .then((value) => {
  switch (value) {
 
    case "common":
       location.href = "../management/commonUtilityForm.htm";
      break;
 
    case "Individual":
       location.href = "../management/individualUtilityForm.htm";
      break;
 
    default:
     
  }
});



     })
     
          $('.datepicker').datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
    
    
    
    
  </script>
</body>

</html>
