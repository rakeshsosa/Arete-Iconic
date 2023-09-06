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


        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <!-- Bootstrap core CSS -->


    </head>


    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
    <jsp:include page="../login/footer.jsp"/>

   <main id="main" class="main">
       <div class="mt-3">
       <jsp:include page="../login/headerlink.htm?submodule=Expense Booking&tab=Booked Expenses&pagetype=list"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Booked Expenses</h5></div> 

                        <table id="myTable"  class="table datatable table-hover table-bordered">
                            <thead>
                                    <tr>
                                        <th>Expense Category</th>
                                         <th>Expense Type</th>
                                    <th>Payment Type</th>
                                    <th>Vendor Name</th>
                                    <th>Ref PO / Invoice</th>
                                    <th class="theader" style="">Amount</th>
                                    <th class="theader" style="">Payment Mode</th>
                                   
                                    <th class="theader" style="">Action</th>
                                </tr>
                            </thead>

                            <tbody>
                                 
                                 <tr>
                                <td class="center">Test</td> 
                                  <td class="center">Test</td>   
                                  <td class="center">Test</td> 
                                <td class="center">Test</td> 
                                 <td class="center">Test</td> 
                                  <td class="center">Test</td> 
                                   <td class="center">Test</td> 
                                <td class="center">
                                    <a href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=view" class="fa fa-eye fa-lg" data-toggle="tooltip" title="View"></a>

                                        <a class="fa fa-pencil-square-o fa-lg" href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=edit" data-toggle="tooltip" title="Edit">

                                        </a>
                                    <a href="../Expenses/ExpenseCategorySettingsForm.htm?expensesCategoryId=${type[0]}&action=view" class="fa fa-recycle fa-lg" data-toggle="tooltip" title="Make Recurring"></a>

                                </td> 
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

