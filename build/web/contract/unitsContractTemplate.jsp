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
           <jsp:include page="../login/headerlink.htm?submodule=Units Contracts Manager&tab=Units Contract Template&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Units Contract Template List</h5></div> 
              <!-- Table with stripped rows -->
              
                                  <div class="table-responsive">                 
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Contract Type</th>
                                                                    <th>Contract Period</th>
                                                                    <th>Unit Type</th>
                                                                    <th>Unit Description</th>
                                                                    <th>Property Name</th>
                                                                    <th class=" no-link last"><span class="nobr">Actions</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                  <c:forEach items="${unitContractTemplateList}" var="list">
                                                                        <tr class="even pointer">    
                                                                            <td style="text-align: left;">${list.contractType}</td>
                                                                        <td style="text-align: left;">${list.contractPeriod}</td>
                                                                        <td style="text-align: left;">${list.unitType}</td>
                                                                         <td style="text-align: left;">${list.unitDescription}</td>
                                                                        <td style="text-align: left;">${list.propertyName}</td>
                                                                        <td class=" last " style="text-align: center;">
                                                                            <%--<a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;--%>
                                                                                 <a href="../insurance/unitsContractTemplateForm.htm?pk=${list.sNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                                                                                 <a class="fa fa-pencil-square-o fa-lg"title="Edit" href="../insurance/unitsContractTemplateForm.htm?pk=${list.sNo}&action=edit">

                                                                                 </a>
                                                                                    <%--<a class="fa fa-check-square-o fa-lg" title="Active"  href="../master/insurActive.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}"onclick="if (confirm('Do you really want to active this record?')) {
                                                                                                return true;
                                                                                            } else {
                                                                                                return false;
                                                                                            }">

                                                                                    </a>
                                                                                <!--</c-->
                                                                                   
<!--                                                                                        <a class="fa fa-pencil-square-o fa-lg"title="Edit" href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=edit">

                                                                                        </a>-->

                                                                                    
                                                                                        <a class="fa  fa-trash-o fa-lg" title="Inactive"  href="../master/insurDel.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}"onclick="if (confirm('Do you really want to inactive this record?')) {
                                                                                                    return true;
                                                                                                } else {
                                                                                                    return false;
                                                                                                }">

</a>--%>
                                                                              

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
            content: '<p>Create, Search, View, Activate and Inativate Contract Type, Period, Unit Type, Unit Description, and Property Name. </p>\n\
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
