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
           <jsp:include page="../login/headerlink.htm?submodule=Utility Management&tab=Utilities Invoices&pagetype=list"/>
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
                                             <input type="text" required="" placeholder="Fill" class="form-control datepicker" id="billingDate1" name="billingDate1" value="">
                                              <label class="control-label">Choose Billing Month <a class="text-danger">*</a></label>
                                        </div>
                                               <div class="table-responsive">    
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Property Name</th>
                                                                    <th>Utility Type</th>
                                                                    <th>Utility Name</th>
                                                                         <th>Unit Number</th>
                                                                    <th>Billing Period</th>
                                                                 
                                                                    <th>Total Bill Consumption</th>
                                                                   
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${tenantCommonUtilityList}" var="list">
                                                                    
                                                                        <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.propertyName}</td>
                                                                        <td style="text-align: left;">${list.billType}</td>
                                                                        <td style="text-align: left;">${list.utilityName}</td>
                                                                         <td style="text-align: left;">${list.totalUnits}</td>
                                                                       <td style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list.billingStartDate}"/></td>
                                                                       <td style="text-align: left;">${list.consumptionComArea}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <!--<a href="../management/commonUtilityForm?pk=&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;-->
                                                                            <a href="../management/commonUtilityForm.htm?pk=${list.SNo}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>&nbsp;
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
            content: '<p>Choose Billing Month, Search and View the Property Name, Utility Type, Utility Name, Unit Number, Billing Period, and Total Billing Consumption. </p>\n\
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
