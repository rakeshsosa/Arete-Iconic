<%-- Document : assetDetailsList Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                                       <div class="mt-3">
                            <jsp:include
                                page="../login/headerlink.htm?submodule=Tax Manager&tab=Tax Manager&pagetype=list" />
                        </div>

    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">


                <div class="card-title"><h5>Tax Manager</h5></div>
                 <div class="row d-flex justify-content-center">
           <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <a style="color: inherit" href="../tenant/taxForm.htm">
                 
             
             <div class="flex-column">
                <span>Tax Masters</span>
                 <i class="fa fa-newspaper-o fa-3x mt-2"></i>
             </div>
                 </a>
         </div>
     </div>
                       <div class="col-lg-3 mt-2 mt-lg-0 p-3 " >
         <div class="round-box">
             <a style="color: inherit" href="../taxManager/incomeTrackingList.jsp">
                 
             
             <div class="flex-column">
                <span>Tax Tracking</span>
                 <i class="fa fa-list-ul fa-3x mt-2"></i>
             </div>
                 </a>
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
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create and Maintain Tax Masters, and Tax Tracking. </p>\n\
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
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script>
     $("#newInvoice").on("click", function (e) {
         
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