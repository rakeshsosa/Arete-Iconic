<%-- 
    Document   : insuranceDetailsList
    Created on : 27 Jul, 2016, 4:55:32 PM
    Author     : Lakshmi
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
           <jsp:include page="../login/headerlink.htm?submodule=Insurance Details&tab=Insurance Tagging&pagetype=list"/>
       </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Insurance Tagging Details  List</h5></div> 
                                        <div class="table-responsive">

                                         
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                   
                                                        <table id="example" class="table datatable table-bordered table-hover">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Insurance Policy No</th>
                                                                    <th>Insurance Category</th>
                                                                    <th>Insurance For</th>
                                                                    <th>Insurance company Name</th>
                                                                    <th>Insurance valid From</th>
                                                                    <th>Insurance valid To</th>
                                                                    <th>Property Name</th>
                                                                    <th>Floor Name/No</th>
                                                                    <th>Unit Name/No</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>

                                                                <c:forEach items="${insurancetaglist}" var="list">
                                                                    <tr class="even pointer">                                                                   
                                                                        <td style="text-align: left;">${list.insuranceNo}</td>
                                                                        <td style="text-align: left;">${list.insuranceCategory}</td>
                                                                        <td style="text-align: left;">${list.insuranceFor}</td>
                                                                        <%--<c:forEach items="${insMast}" var="list1">
                                                                            <c:if test="${list1.insuranceCompanyId eq list.insuranceCompanyId}">
                                                                                <c:set value="${list1.insuranceCompanyName}" var="compnam"/> 
                                                                            </c:if>
                                                                        </c:forEach>--%>
                                                                        <td style="text-align: left;">${list.insuranceCompName}</td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.insValidFrom}"/></td>
                                                                        <td style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.insValidTo}"/></td>
                                                                        <td style="text-align: left;">${list.propertyName}</td>
                                                                        <td style="text-align: left;">${list.floorName}</td>
                                                                        <td style="text-align: left;">${list.flatName}</td>

                                                                        <td class=" last " style="text-align: center;">

                                                                            <a href="../insurance/insuranceTaggingDetailsForm.htm?pk=${list.sno}&action=view" class="fa fa-eye fa-lg"title="View"></a>
                                                                            &nbsp;
                                                                            <c:if test="${edit eq 'y'}">
                                                                                <a  class="fa fa-pencil-square-o fa-lg" href="../insurance/insuranceTaggingDetailsForm.htm?pk=${list.sno}&action=edit" title="Edit">
                                                                                     
                                                                                                                               
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

    </body>

</html>
