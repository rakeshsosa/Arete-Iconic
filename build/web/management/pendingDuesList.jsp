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
           <jsp:include page="../login/headerlink.htm?submodule=Charges Tracking&tab=Pending Dues&pagetype=list"/>
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
                                                                                          
                                                    <select placeholder="Fill" class="form-select" id="jointeeName1" name="jointeeName1" >
                                                        <option value="Rent">Rent</option>
                                                      <option value="Service">Service</option>
                                                        <option value="Utility">Utility</option>
                                                          <option value="Tax">Tax</option>
                                                           <option value="Others">Others</option>
                                                        
                                                    </select>
                                               
                                            <label class="control-label">Invoice type<a class="text-danger">*</a></label>
                                        </div>
                                     <div class="table-responsive">              
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Invoice Type</th>
                                                                         <th>Invoice</th>
                                                                    <th>Property Name</th>
                                                                    <th>Unit Number</th>
                                                                    <th>Invoice Amount</th>
                                                                    <th>Due Date</th>
                                                                   
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
                                                                        <td style="text-align: left;">${list.insuranceDesc}</td>
                                                                         <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                       <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
 <a  class="fa fa-pencil fa-lg"title="Edit" href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=edit"> </a>

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
            content: '<p>Select Invoice Type, Search and View the Invoice Type, Invoice, Property Name, Unit Number, Invoice Amount, and Due date. </p>\n\
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
</body>

</html>
