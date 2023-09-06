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
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
        
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.js"></script>
      <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.17/themes/base/jquery-ui.css">

         <style>
     .round-box{
            box-shadow: 0px 0 30px rgb(1 41 112 / 10%);
    background: #fff;
/*    width: 220px;*/
    height: 220px;
        border-radius: 4px;
    border-top: 25px solid #314c68;
    cursor: pointer;
     }
     .round-box div {
             display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    padding: 15px;
     }
  
     .round-box span {
         font-size: 21px;
         font-weight: 500;
         text-align: center;
     }
   

        </style>
            </head>
            
             <body class="nav-md">
        <% java.util.Date d = new java.util.Date();%>
       
                <jsp:include page="../login/menu.htm"/>
               <jsp:include page="../login/footer.jsp"/>

                                
                                   <main id="main" class="main">
      
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section mt-3">
      <div class="row">
        <div class="col-lg-12">


<!--                <div class="card-title"><h5>Receivable Manager</h5></div>-->
                 <div class="row d-flex justify-content-center">
           
     <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box" id="newInvoice">
          <a style="color: inherit" href="../expensesManager/ExpenseCategorySettingsList.jsp">
              <div class="flex-column">
                <span>Expense Settings</span>
                 <i class="fa fa-cog fa-3x mt-2"></i>
             </div>
                 </a>
         </div>
     </div>
           
                <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <a style="color: inherit" href="../expensesManager/bookedExpensesTracking.jsp">
                 
             
             <div class="flex-column">
                <span>Expense Booking</span>
                 <i class="fa fa-book fa-3x mt-2"></i>
             </div>
                 </a>
         </div>
     </div>
               
                <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             
             <div class="flex-column">
                <span>Expense Tracking</span>
                
                <i class="fa fa-exchange fa-3x mt-2"></i>
             </div>
         </div>
     </div>
                         
                                 
                               
                                    </div>
                         
                    
                     
                              
                 
    

        </div>
      </div>
    </section>

  </main><!-- End #main -->
        <script>
            //window.onload = minRentGen();
        </script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
     $("").on("click", function (e) {
         
         swal({
  text: "Please choose the type of invoice you want to create?",
 // icon: "fi",
  buttons: true,
        buttons: {
    cancel: "Cancel",
    rent: {
      text: "Rent Invoice"
    },
    standard: {
      text: "Standard Invoice"
    },
  },
  dangerMode: true,
}) .then((value) => {
  switch (value) {
 
    case "rent":
       location.href = "../tenant/receiableRentInvoiceForm.htm";
      break;
 
    case "standard":
       location.href = "../tenant/standardInvoiceForm.htm";
      break;
 
    default:
     
  }
});



     })
    
  </script>
</body>

</html>

