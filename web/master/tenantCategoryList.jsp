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
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Property/Flat/Tenant Type&pagetype=list"/>
      </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Property/Flat/Tenant Type List</h5></div> 
              <!-- Table with stripped rows -->
              
        <div class="table-responsive">
          <c:forEach items="${permission}" var="type">
            <c:set var="add" value="${type.newEntry}"></c:set>
            <c:set var="edit" value="${type.edit}"></c:set>
            <c:set var="inactive" value="${type.inactive}"></c:set>
            <c:set var="review" value="${type.review}"></c:set>
            <c:set var="approve" value="${type.approve}"></c:set>
        </c:forEach>
				<table class="table datatable table-hover table-bordered">
          <thead>

            <tr class="headings">
                <th style="width:25%;">Type Code</th>
                <th style="width:30%;">Property/Flat/Tenant Type</th>
                <th style="width:25%;">Description</th>
                <!--<th>Category Sequence No</th>-->
                <th style="width:20%;" class=" no-link last"><span class="nobr">Action</span>
                </th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${category}" var="list">
                <tr class="even pointer"> 
                    <td class=" " style="text-align: left;">${list.categorySeqNo}</td>
                    <td class=" " style="text-align: left;">${list.tenantCategory}</td>
                    <td class=" " style="text-align: left;">${list.categoryDesc}</td>
                    <td class=" last" style="text-align:center;width: 300px;">
                        <a href="../master/tenantCategoryForm.htm?pk=${list.sno}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;
                        <c:if test="${edit eq 'y'}">
                            <a href="../master/tenantCategoryForm.htm?pk=${list.sno}&action=edit" class="fa fa-edit fa-lg"title="Edit"></a>&nbsp;</c:if>
<!--                                                                        <a class="fa fa-trash fa-lg" title="Inactive" href="../master/tenCategDel.htm?pk=${list.sno}" onclick="if (confirm('Do you really want to Inactive this record?')) {
                                            return true;
                                        } else {
                                            return false;
                                        }">
                                                                             
                                </a>-->

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
            content: '<p>  Create, View, Edit, and Seach Type Code, Property/ Unit/ Tenant Type, and their Description. </p>\n\
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
