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
        <style>
            #hideIcons {
                display: none;
            }
        </style>

    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Tenant Exit Process&tab=Tenant Exit&pagetype=list"/>
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
                                                                    <th>Vacate Code</th>
                                                                    <th>Property Name</th>
                                                                    <th>Unit Number</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Vacate Notice Date</th>                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                        <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.insuranceCompanyId}</td>
                                                                        <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td style="text-align: left;">${list.insuranceDesc}</td>
                                                                         <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            
                                                                            <a href="#" data-toggle="tooltip" class="fa fa-eye fa-lg"title="Outstanding Dues"></a>&nbsp;
                                                                             <a onclick="openRemoveStock(event)" class="fa fa-check fa-lg" data-toggle="tooltip" title="Confirm Vacate"></a>&nbsp;
                                                                            <a href="#" data-toggle="tooltip" class="fa fa-trash-o fa-lg"title="Cancel Notice"></a>&nbsp;

                                                                         
                                                                            <a id="hideIcons" href="../management/processHandOverForm.htm?action=view" class="fa fa-handshake-o fa-lg" data-toggle="tooltip" title="Process Handover"></a>&nbsp;
                                                                            <a id="hideIcons" href="#" class="fa fa-location-arrow fa-lg" data-toggle="tooltip" title="Book Unit"></a>&nbsp;

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
   <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Search, View, Cancel and Confirm Vacate Code, Property Name, Unit Number, Tenant Name, and Vacate Notice Date. </p>\n\
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
              debugger
              var prhd = $(e.target).next();
               var bookUnit = $(e.target).next().next();
              prhd.show();
              bookUnit.show()
//                   
                        $('#removeStockModal').modal('show');
                      
                    }
      </script>
</body>

</html>
