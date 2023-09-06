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
<body>

<jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
           <jsp:include page="../login/headerlink.htm?submodule=Property Profile&tab=Property Profile&pagetype=list"/>
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
              <div class="table-responsive">
              <table class="table datatable table-bordered table-hover">
                                                            <p id="successMessage" style="text-align: center;padding-right: 200px; color: red;font-family:calibri,verdana,sans-serif;font-size: 17px;">${message}</p>
                                                            <c:remove var="message" scope="session" /> 
                                                        
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                    
                                                        
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Property Code</th>
                                                                    <th>Property Name</th>
                                                                    <th>Property Building No</th>
                                                                    
                                                                    <!--<th>Type Sequence No</th>-->
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${assetDetails}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td class=" "style="text-align: left;">${list.assetCode}</td>
                                                                        <td class=" "style="text-align: left;">${list.assetName}</td>
                                                                        <td class=" "style="text-align: left;">${list.assetBuilding}</td>
                                                                        
                                                                        <td class="last" style="width: 100px;text-align: left;">
                                                                  <!--          <p>${list.status} "test"</p>      -->
                                                                            <a href="../assets/assetsDetailsForm.htm?pk=${list.SNo}&assetCode=${list.assetCode}&action=view" class="fa fa-eye fa-lg" title="View"></a>
                                                                            <a href="../assets/assetsDetailsForm.htm?pk=${list.SNo}&assetCode=${list.assetCode}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
                                                                            <c:if test="${list.status eq 'Inactive'}">
                                                                            
                                                                               <a class="fa fa-trash fa-lg" title="Active" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record ACTIVE? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/assetDetailsDel.htm?SNo=${list.SNo}&status=${list.status}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                        
                                                                            </a>
                                                                                 </c:if>
                                                                          <c:if test="${list.status == 'Active' || list.status == 'Update0'}">
                                                                            
                                                                               <a class="fa fa-trash fa-lg" title="Inactive" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record INACTIVE? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/assetDetailsDel.htm?SNo=${list.SNo}&status=${list.status}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                              
                                                                            </a>
                                                                                 </c:if>  
                                                                        </td>
                                                                          </c:forEach>
                                                                         </tbody>

                                                        </table>

<!--                                                                           <a href="../assets/assetsDetailsForm.htm?pk=${list.SNo}&assetCode=${list.assetCode}&action=edit" class="fa fa-pencil fa-lg" title="Edit"></a>
                                                                             <a href="#" class="fa fa-times fa-lg" title="Inactive" onclick="if (confirm('Do you really want to active this record?')) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }">
                                            </a>
                                          
                                                                            
                                                                
                                <%--   <c:choose>
                                        <c:when test="${ status eq 'Inactive'}">
-->                                            <a class="fa fa-check-square-o fa-lg" title="Active"  href="../assets/assetsActive.htm?SNo=${type.SNo}"onclick="if (confirm('Do you really want to active this record?')) {
                                                        return true;
                                                    } else {
                                                        return false;
                                                    }">

                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${edit eq 'y'}">
                                                <a  class="fa fa-pencil fa-lg"title="Edit" href="../assets/assetsDetailsForm.htm?pk=${type.SNo}&action=edit">

                                                </a></c:if>&nbsp;
                                            <c:if test="${inactive eq 'y'}">
-->                                                < a class="fa  fa-times-rectangle-o fa-lg" title="Inactive"  href="../assets/assetsDel.htm?SNo=${type.SNo}"onclick="if (confirm('Do you really want to inactive this record?')) {
                                                            return true;
                                                        } else {
                                                            return false;
                                                        }">

                                                </a></c:if>
                                        </c:otherwise> 
                                    </c:choose>    --%>
                                                                        </td>
                                                                    </tr>
                                                              
                                                                    
                                                            </tbody>

                                                        </table>
              </div>
              <!-- End Table with stripped rows -->
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
            content: '<p>Create, Search, View, Edit property profile with Property Name, Built Up Area, Address, PO Box, Way No, Number of Floors, Owner Details and also add documents.</p>\n\
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
