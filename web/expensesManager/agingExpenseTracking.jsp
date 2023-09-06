<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

          <style>
            .hideinputbg {
                border: none;
    background: no-repeat;
            }
        </style>
        
        <script>
            
            
            
            
            function openMeterWindow4() {
                  
                 
                  
                 // alert(newMeterType);
                  
               
                  
                myWindow = window.open("../Expenses/SelectExpensesCategoryList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            
            
            
             function openMeterWindow2() {
                  
                 var expenseCategoryName = document.getElementById("expenseCategoryName").value;
                  
                 // alert(newMeterType);
                  
               
                  
                myWindow = window.open("../Expenses/SelectExpensesTypeNameList.htm?expenseCategoryName="+expenseCategoryName+"", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            
            </script>


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
<ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="../expensesManager/agingExpenseTracking.jsp">Aging Expenses</a></li>
         </ul>      </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Aging Expenses Tracking</h5></div> 
     
                        <table id="myTable"  class="table datatable">
                            <thead>

                                <tr>
                                    <th>Expense Type</th>
                                    <th>Expense Amount</th>
                                    <th>Payment Due Date</th>
                                    <th>Status</th>
                                    <th>No Of Overdue Days</th>
                                    <th>Aging Status</th>
                                   
                                </tr>
                            </thead>

                            <tbody id="operationtable">
                            <tr>
                            <td>Test</td> 
                             <td>Test</td> 
                             <td>Test</td> <td>Test</td> 
                             <td>Test</td> 
                             <td>Test</td> 
                             
                          
                        </tr>
                            </tbody>

                        </table>
</div>
			   </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

 
</body>

</html>

