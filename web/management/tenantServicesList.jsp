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
           <jsp:include page="../login/headerlink.htm?submodule=Tenant Services&tab=Tenant Services&pagetype=list"/>
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
           <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                             <input type="text" required="" placeholder="Fill" class="form-control datepicker" id="billingDate" name="billingDate" value="">
                                              <label class="control-label">Choose Billing Month <a class="text-danger">*</a></label>
                                        </div>
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
                                                               
                                                                <c:forEach items="${tenantServicesList}" var="list">
                                                                        <tr class="even pointer">    
                                                                            <td>${list.propertyName}</td>
                                                                            <td>${list.unitNameNo}</td>
                                                                            <td>${list.tenantName}</td>
                                                                            <td>4</td>
                                                                            <td >1000</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <a href="../management/tenantServicesForm.htm?pk=${list.sNo}&propertyName=${list.propertyName}&action=view" data-toggle="tooltip" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                            <a  class="fa fa-pencil-square-o fa-lg"title="Edit" href="../management/tenantServicesForm.htm?pk=${list.sNo}&propertyName=${list.propertyName}&action=edit"> </a>
                                                                            <a href="../management/tenantServicesForm.htm?pk=${list.sNo}&action=add" class="fa fa-plus-circle fa-lg" data-bs-toggle="tooltip" title="Add"></a>

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
            content: '<p>Create, Search, View, Edit, and add Property Name, Unit Name, Tenant Name, Number of Services, and Total Monthly Service Charges. </p>\n\
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
         $('.datepicker').datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true,
                orientation:'bottom',
                todayHighlight: true,
            }).datepicker('update',new Date())
        </script>
</body>

</html>
