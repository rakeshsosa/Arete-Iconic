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


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Location Master&tab=Bill To Location&pagetype=list"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Bill To Location List</h5></div> 
              <!-- Table with stripped rows -->
              
        <div class="table-responsive">
           
				<table class="table datatable table-hover table-bordered">
                    <thead>
                        <tr class="headings">
                            
                            <th>Division</th>
                            <th>Address</th>
                            <th>Contact Number</th>
                            <th>Email ID</th>
                            <th class=" no-link last"><span class="nobr">Action</span>
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${billloclist}" var="type">
                            <tr>
                                <td class="center">${type.divisionName}</td>
                                <td class="center">${type.address}</td>
                                <td class="center">${type.contactNo}</td>
                                <td class="center">${type.emailId}</td>
                                <td class="center" style="">
                                    <a href="../master/billlocForm.htm?pk=${type.sno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                    <a href="../master/billlocForm.htm?pk=${type.sno}&action=edit" class="fa fa-edit fa-lg"title="Edit"></a>&nbsp;
                                    
                                </td>   
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
            content: '<p>  View, Edit, Create and Search Division, Address, Contact Number, and Email ID using the action buttons. </p>\n\
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
