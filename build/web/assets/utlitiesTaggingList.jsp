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
           <jsp:include page="../login/headerlink.htm?submodule=Utlities Tagging&tab=Utlities Tagging&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Utilities Tagging List</h5></div> 
              <!-- Table with stripped rows -->
              
                                                   
                                                   <div class="table-responsive">
              <table class="table datatable table-hover table-bordered">
                                                            <p id="successMessage" style="text-align: center;padding-right: 200px; color: red;font-family:calibri,verdana,sans-serif;font-size: 17px;">${message}</p>
                                                           
                                                        
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>S. No.</th>
                                                                    <th>Property Code</th>
                                                                    <th>Property Name </th>
                                                                    <th>Creation Date</th>
                                                                    
                                                                    <!--<th>Type Sequence No</th>-->
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                
                                                                 <c:forEach items="${utlitiesTaggingList}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td class=" "style="text-align: left;">${list[3]}</td>
                                                                        <td class=" "style="text-align: left;">${list[0]}</td>
                                                                        <td class=" "style="text-align: left;">${list[1]}</td>
                                                                        <td class=" "style="text-align: left;"><fmt:formatDate pattern="dd-MM-yyyy" value="${list[2]}"/></td>
                                                                        
                                                                        <td class="last">
                                                                            <a href="../assets/utlitiesTaggingForm.htm?pk=${list[3]}&assetCode=${list[0]}&action=view" class="fa fa-eye fa-lg" title="View"></a>
                                                                            <a href="../assets/utlitiesTaggingForm.htm?pk=${list[3]}&assetCode=${list[0]}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
<!--                                                                            <a href="#" class="fa fa-print fa-lg" title="Print"></a>-->
                                                                            
                                                                           
                                                
                                                
                                                                                    
                                                                            <%-- <a href="../assets/utlitiesTaggingForm.htm?assetCode=${list[0]}&action=edit" class="fa fa-pencil fa-lg" title="Edit"></a>&nbsp;--%>
                                                                 <c:if test="${list[4] eq 'Inactive'}">
                                                                            
                                                                               <a class="fa fa-trash fa-lg" title="Active" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record ACTIVE? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/utilityDetailsDel.htm?SNo=${list[3]}&status=${list[4]}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                        
                                                                            </a>
                                                                                 </c:if>
                                                                          <c:if test="${list[4] == 'Active' || list[4] == 'Update0'}">
                                                                            
                                                                               <a class="fa fa-trash fa-lg" title="Inactive" href="javascript:"  onClick="
                                                                                  if (window.confirm('Do you really wish to make this record INACTIVE? Please confirm.'))
                                                                                        {         
                                                                                            window.location.href = '../assets/utilityDetailsDel.htm?SNo=${list[3]}&status=${list[4]}';
                                                                                        }
                                                                                           " >
                                                                               
                                                                                                                              
                                                                            </a>
                                                                                 </c:if>  
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
            content: '<p>  Create Documents Tracking using the + icon in the upper right corner. </p>\n\
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
