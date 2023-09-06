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

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
  
   <main id="main" class="main">
       <div>
        <jsp:include page="../login/headerlink.htm?submodule=Accessory Details&tab=UOM Master&pagetype=list"/>
      </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>UOM Master List</h5></div> 
              <!-- Table with stripped rows -->
              
        <div class="table-responsive">
          <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
				<table class="table datatable">
          <thead>

            <tr class="headings">

                <th>UOM </th>
                <th>UOM Description</th>
                <th class=" no-link last"><span class="nobr">Actions</span>
                </th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${uomList}" var="list">
                <c:set var="status" value="${list.status}"></c:set>
                    <tr class="even pointer">                                                                   
                        <td style="text-align: left;">${list.uomName}</td>
                    <td style="text-align: left;">${list.uomDesc}</td>

                    <td class=" last " style="text-align: center;">
                        <a href="../master/uomForm.htm?pk=${list.sno}&uomId=${list.uomId}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;


                        <c:choose>
                            <c:when test="${ status eq 'Inactive'}">
                                <a class="fa fa-check-square-o fa-lg" title="Active"  href="../master/uomActive.htm?pk=${list.sno}&uomId=${list.uomId}"onclick="if (confirm('Do you really want to active this record?')) {
                                            return true;
                                        } else {
                                            return false;
                                        }">

                                </a>
                            </c:when>
                            <c:otherwise>
                                <c:if test="${edit eq 'y'}">
                                    <a  class="fa fa-pencil fa-lg" href="../master/uomForm.htm?pk=${list.sno}&uomId=${list.uomId}&action=edit">

                                    </a></c:if>&nbsp;
                                <c:if test="${inactive eq 'y'}">
                                    <a class="fa  fa-times-rectangle-o fa-lg" title="Inactive"  href="../master/uomDel.htm?pk=${list.sno}&uomId=${list.uomId}"onclick="if (confirm('Do you really want to inactive this record?')) {
                                                return true;
                                            } else {
                                                return false;
                                            }">

                                    </a>
                                </c:if>
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
      </div>
    </section>

  </main><!-- End #main -->

  <jsp:include page="../login/footer.jsp"/>
</body>

</html>
