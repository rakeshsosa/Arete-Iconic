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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
                <ul class="nav nav-pills">

                    <li class="nav-item"><a class="nav-link active" href="../assets/subAssetsDetailsList.htm">Property Segments</a></li>

                     <!--<li class="nav-item"><a class="nav-link" href="../assets/propertyWiseSegmentList.htm">Property Wise Segments</a></li>-->
                 </ul>
                <br>
            <div class="text-end">
             <a class="btn btn-primary btn-sm " href="../assets/subAssetsDetailsForm.htm"><i class="bi bi-plus"></i> Create Property Segments</a>
            </div>
           <%--<jsp:include page="../login/headerlink.htm?submodule=Property Segments&tab=Property Segments&pagetype=list"/>--%>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Property Details List</h5></div> 
              <!-- Table with stripped rows -->
              
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
              <div class="table-responsive">
                                                    <table class="table datatable table-bordered table-hover">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>S.No.</th>
                                                                    <th>Unit Code</th>
                                                                    <th>Unit Name</th>
                                                                    <th>Property Code</th>
                                                                    <th>Property Name</th>
                                                                    <th>Status</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${subAssetDetails}" var="list">
                                                                    <tr class="even pointer">                  
                                                                        <td class=" "style="text-align: left;">${list[2]}</td>
                                                                        <td class=" "style="text-align: left;">${list[3]}</td>
                                                                        <td class=" "style="text-align: left;">${list[4]}</td>
                                                                        <td class=" "style="text-align: left;">${list[0]}</td>
                                                                        <td class=" "style="text-align: left;">${list[1]}</td>
                                                                        <td class=" "style="text-align: left;">${list[5]}</td>
                                                                        <td class=" last" >
                                                                            <a href="../assets/subAssetsDetailsForm.htm?pk=${list[2]}&subAssetCode=${list[3]}&assetCode=${list[0]}&action=view" data-bs-toggle="tooltip" data-bs-placement="top" class="fa fa-eye fa-lg" title="View"></a>&nbsp;
                                                                            <c:if test="${edit eq 'y'}">
                                                                                <a href="../assets/subAssetsDetailsForm.htm?pk=${list[2]}&subAssetCode=${list[3]}&assetCode=${list[0]}&action=edit" class="fa fa-pencil-square-o fa-lg"title="Edit"></a>&nbsp;
                                                                            </c:if>
                                                                                
<!--                                                                                <a class="fa  fa-trash fa-lg" title="" href="../assets/updateSubAssetDetailStatus.htm?pk=${list[2]}&status1=${list[6]}" onclick="if (confirm('Do you really want to inactive this record?')) {
                                                            return true;
                                                        } else {
                                                            return false;
                                                        }" data-toggle="tooltip" data-bs-original-title="Delete">

                                                </a>-->
                                                                                <c:if test="${list[6] eq 'Inactive'}">
                                                                            
                                                                               <a class="fa fa-trash  fa-lg" title="Active" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record active? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/updateSubAssetDetailStatus.htm?SNo=${list[2]}&status=${list[6]}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                        
                                                                            </a>
                                                                                 </c:if>
                                                                          <c:if test="${list[6] == 'Active' || list[6] == 'Update0'}">
                                                                            
                                                                               <a class="fa fa-trash  fa-lg" title="Inactive" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record inactive? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/updateSubAssetDetailStatus.htm?SNo=${list[2]}&status=${list[6]}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                              
                                                                            </a>
                                                                                 </c:if>  
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
            content: '<p>Add, Search and Inactivate Floor, Floor Name, Built- Up Area, Property Name, Room/Unit Name, Room/Unit Type, Remarks, and Minimum Rent Fixed. </p>\n\
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
