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
           <jsp:include page="../login/headerlink.htm?submodule=Incoming Tax Tracking&tab=Tax Adjustments&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Tax Adjusments List</h5></div> 
              
                <div class="row">
                                    <div class="col-md-4 form-floating mb-3 pick3">
                                        <input autocomplete="off"  class="form-control datepicker3 capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>From Time Period</label>
                                         </div>  
                                     <div class="col-md-4 form-floating mb-3 pick2">
                                         <input autocomplete="off" class="form-control datepicker2 capitalize validate[required]" required placeholder="Start Date" id="startDate" name="startDate" type="text" value="" placeholder="DD/MM/YYYY" maxlength="10">
                                            <label class="control-label"><span style="color:red">*</span>To Time Period</label>
                                         </div>     
                </div>
                <div class="table-responsive">
				<table class="table datatable table-hover table-bordered">
					<thead>
                                                                <tr class="headings">
                                                                    <th>Total Incoming Tax</th>
                                                                    <th>Total Outgoing Tax</th>
                                                                     
                                                                    <th>Total Adjustments</th>
                                                                     
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               <c:forEach items="${insurMastr}" var="list">
                                                                    <c:set var="status" value="${list.status}"></c:set>
                                                                        <tr class="even pointer text-nowrap">    
                                                                            <td style="text-align: left;">${list.insuranceCompanyId}</td>
                                                                        <td style="text-align: left;">${list.insuranceCompanyName}</td>
                                                                        <td style="text-align: left;">${list.insuranceDesc}</td>
                                                                         
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
 <script>
      $(document).ready(function () {
                    $('.datepicker3').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick3'
            })  
 $('.datepicker2').datepicker({
                format: 'dd-mm-yyyy',
                startDate: '0m +0m',
                autoclose: true,
                todayHighlight: true,
                container: '.pick2'
            })
            })
  </script>
</body>

</html>
