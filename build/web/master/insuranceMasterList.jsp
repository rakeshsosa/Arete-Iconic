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
    @media screen and (max-width: 600px){
    .insuranceTable-mobileview{
         overflow-x: auto !important;
    }
    .cardMobileview{
        width: fit-content;
    }
    }
    </style>
    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
           
            <jsp:include page="../login/footer.jsp"/> 
      

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Insurance Master&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section insuranceTable-mobileview">
      <div class="row">
        <div class="col-lg-12">

          <div class="card cardMobileview">
              
            <div class="card-body">
                <div class="card-title"><h5>Insurance Master List</h5></div> 
              <!-- Table with stripped rows -->
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
                                                                    <th style="width:25%;">Insurance Company Id</th>
                                                                    <th style="width:25%;">Insurance Company</th>
                                                                    <th style="width:25%;">Company Description</th>
                                                                    <th style="width:25%;" class=" no-link last"><span class="nobr">Action</span>
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

                                                                        <td class=" last text-nowrap">
                                                                            <a href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

                                                                            <c:choose>
                                                                                <c:when test="${ status eq 'Inactive'}">
                                                                                    <a class="fa fa-check-square-o fa-lg" title="Active"  href="../master/insurActive.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}"onclick="if (confirm('Do you really want to active this record?')) {
                                                                                                return true;
                                                                                            } else {
                                                                                                return false;
                                                                                            }">

                                                                                    </a>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <c:if test="${edit eq 'y'}">
                                                                                        <a  class="fa fa-pencil-square-o fa-lg"title="Edit" href="../master/insuranceMasterForm.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}&action=edit">

                                                                                        </a></c:if>&nbsp;

                                                                                    <c:if test="${inactive eq 'y'}">
                                                                                        <a class="fa  fa-trash-o fa-lg" title="Inactive"  href="../master/insurDel.htm?pk=${list.sno}&insuranceCompId=${list.insuranceCompanyId}"onclick="if (confirm('Do you really want to inactive this record?')) {
                                                                                                    return true;
                                                                                                } else {
                                                                                                    return false;
                                                                                                }">

                                                                                        </a></c:if>
                                                                                </c:otherwise> 
                                                                            </c:choose>

                                                                        </td>

                                                                    </tr>
                                                                </c:forEach> 

                                                            </tbody>
				</table>
						
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
            content: '<p>  View, Edit, Create, Search and Inactivate Insurance Master details: Insurance Company, its ID, and Description. </p>\n\
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
