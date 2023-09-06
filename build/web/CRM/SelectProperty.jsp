<%-- 
    Document   : SelectDivision1
    Created on : 14 Apr, 2016, 3:04:31 PM
    Author     : ebs-sdd22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--        <link rel="icon" href="../common/theme/images/favicon.png" type="image/png" sizes="16x16">-->
      <title>Arête Property Management</title>
      <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">

       
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

    <script>
     
    </script>

    </head>


    <body>




        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12  px-5 py-2 m-0">
                <div class="x_panel">

                    <div class="x_title">
                       <h4>Employee List</h4> 
                       <hr>
                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">

                             <table id="example" class="table table-striped table-bordered" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">  
<!--                                        <th>Property Code</th> -->
                                        <th>Property Name</th> 
                                        <th>Service Request NO</th> 
                                        <th>Service Area</th> 
                                        <th>Service Name</th> 
                                          <th>Unit No</th> 
                                    </tr>
                                </thead>

                                <tbody>

                               
                                       
                                        <c:forEach items="${propertDetailsList}" var="type">
                                              <tr onclick="
//                                                  
                                                        window.opener.document.getElementById('assetName1').value = '${type.assetName}';
                                                        
                                                         window.opener.document.getElementById('serviceReqNo').value = '${type.serviceReqNo}';
                                                        window.opener.document.getElementById('tenantName').value = '${type.serviceArea}';
                                                        window.opener.document.getElementById('serviceName').value = '${type.serviceName}';
                                                        window.opener.document.getElementById('subAssetName1').value = '${type.unitNo}';
                                                      
                                                        window.close();">
                                                        
                                                    
                                                    <td class="center">${type.assetName}</td>  
                                                 
                                                    <td class="center">${type.serviceReqNo}</td> 
                                                       <td class="center">${type.serviceArea}</td> 
                                                       <td class="center">${type.serviceName}</td> 
                                                       <td class="center">${type.unitNo}</td> 

                                            </tr>
                                        </c:forEach>
                              
                                             
                                </tbody>

                            </table>
                        </form>
                        
                    </div>
                </div>
            </div>

        </div>



        <script>
        $(document).ready( function () {
                $('#example').DataTable(
                        {
//                            "order": [[ 3, "desc" ]]
                        }        
                );
            } );
    </script>

        
                 


    </body>

</html>


