<%-- 
    Document   : insuranceDetailsList
    Created on : 27 Jul, 2016, 4:55:32 PM
    Author     : Shweta S S
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Insurance Details&tab=Insurance Creation&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Insurance Creation List</h5></div> 
                                        <div class="table-responsive">

                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                  
                                                        <table id="example" class="table datatable table-hover table-bordered">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Insurance Policy No</th>
                                                                    <th>Insurance For</th>
                                                                    <th>Insurance company Name</th>
                                                                    <!--///Newly Added By Lakshmi-->
                                                                    <th>Insurance Category</th>
                                                                    <!--///////-->
                                                                    <th>Insurance valid From</th>
                                                                    <th>Insurance valid To</th>
                                                                    <th>Insurance Type</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${insurance}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td style="text-align: left;">${list.insuranceNo}</td>
                                                                        <td style="text-align: left;">${list.insuranceFor}</td>
                                                                        <c:forEach items="${insMast}" var="list1">
                                                                            <c:if test="${list1.insuranceCompanyId eq list.insuranceCompanyId}">
                                                                                <c:set value="${list1.insuranceCompanyName}" var="compnam"/> 
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <td style="text-align: left;">${compnam}</td>
                                                                        <!--////Newly Added By Lakshmi////-->
                                                                        <td style="text-align: left;">${list.insuranceCategory}</td>
                                                                        <!--////////////-->
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.insValidFrom}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.insValidTo}"/></td>
                                                                        <td style="text-align: left;">${list.insuranceType}</td>

                                                                        <td class=" last " style="text-align: center;">

                                                                            <a href="../insurance/insuranceDetailsForm.htm?pk=${list.sno}&insuranceNo=${list.insuranceNo}&insuranceCompanyId=${list.insuranceCompanyId}&action=view" class="fa fa-eye fa-lg"title="View"></a>
                                                                            &nbsp;
                                                                            <c:if test="${edit eq 'y'}">
                                                                                <a  class="fa fa-pencil fa-lg" href="../insurance/insuranceDetailsForm.htm?pk=${list.sno}&insuranceNo=${list.insuranceNo}&insuranceCompanyId=${list.insuranceCompanyId}&action=edit" title="Edit">
                                                                                     
                                                                                                                               
                                                                                </a></c:if>&nbsp;
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
            content: '<p>  Create, View, Search and Edit Insurance Policy Number, Category, Insurance for, Insurance Company Name, Insurance Validity, Property Name, and Floor Name/ Number. </p>\n\
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
