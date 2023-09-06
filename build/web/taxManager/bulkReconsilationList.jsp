
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
  
    </head>

   <body class="nav-sm">
    <jsp:include page="../login/menu.htm" />
                  <jsp:include page="../login/footer.jsp" /> 

                    <main id="main" class="main">
                        <div class="mt-3">
                            <ul class="nav nav-pills">
                               <li class="nav-item "><a class="nav-link active" href="#">Open Cheques</a></li>
                            </ul>  
                         </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                <h5>Bulk Reconsilation List</h5>
                                            </div>
                                            <div class="table-responsive">
                            <table id="myTable"  class="table datatable table-hover table-bordered">
                                <thead>
                                    <tr class="headings">
                                        <th><input type="checkbox" id="headcheck" class="headcheck"/> </th>
                                        <th>PD Cheque</th>
                                        <th>Date</th>
                                        <th>Tenant Name</th>
                                        
                                        <th>Invoice Amount</th>
                                        <th>Amount Received</th>
                                        <th>TRF Number</th>
                                        <th>Action</th>
                                      
                                    
              
                                    </tr>
                                </thead>

                                <tbody>
                                
                                     <tr>
                                            <td><input type="checkbox" id="rowcheck" class="rowcheck"/> </td>
                                            <td id="qtnno">Test</td>
                                            <td>Test</td>
                                           <td>Test</td>
                                            <td>Test</td> 
                                            <td>Test</td>
                                            <td>Test</td>
                                            


                                            <td>
                                                <button class="btn btn-primary">Match</button>    
                                                </td>
                               


                                        </tr>
                                </tbody>

                            </table>
                                            </div>
                      


     <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" id="">Save</button>
                                                <a href="../taxManager/openChequesList.htm"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                                              </div>
                    </div>

                </div>
            </div>
    
  </div>
                                    </div>

                                </div>
                            </div>
                        </section>

                    </main><!-- End #main -->


    <script>
 

              var indexNo ;         
 $(".Status").on("change", function(event) {
     
    if ($(this).val() !== "Active") {
    
         swal("Would you like to confirm, Please write message", {
                            closeOnClickOutside: false,
                            content: "input",
                            buttons:["Cancel", "OK"]
                          })
                          .then((value) => {
                             if (value == null || value == '') {
                                 event.target.selectedIndex = indexNo;
                                 event.preventDefault();
                            return false;
                        }
                       else {
                              indexNo = event.target.selectedIndex;
                              $(this).closest('tr').find("#reason").text(value);
                              
                              var status = $(this).val();
                                var sno = $(this).closest('tr').find("#SINO").text();
                                var reason = value;
                                //alert(reason);

                                                $.ajax({
                                                    type: "POST",
                                                    url: "../quotation/changeQuotStatus.htm",
                                                    data: {
                                                        status : status,
                                                        sno : sno,
                                                        reason : reason


                                                    },
                                                    dataType: "text",
                                                    success: function (data){
                                                        
                                                    }

                                                });
                           }
                       });
                       
       // $(this).closest('tr').find("#reason").text(value);
        
        if ($(this).closest('tr').find('input[type="checkbox"]:checked').length > 0) {
            $(this).closest('tr').find('input[type="checkbox"]').trigger('click');
        }
    $(this).closest('tr').find('input[type="checkbox"]').prop("checked", false);
    $(this).closest('tr').find('input[type="checkbox"]').attr("disabled", true);
    
   

} else {

    $(this).closest('tr').find('input[type="checkbox"]').removeAttr("disabled");
    $(this).closest('tr').find("#reason").text("")
   var status = $(this).val();
                                var sno = $(this).closest('tr').find("#SINO").text();
                                var reason = "";
                                //alert(reason);

                                                $.ajax({
                                                    type: "POST",
                                                    url: "../quotation/changeQuotStatus.htm",
                                                    data: {
                                                        status : status,
                                                        sno : sno,
                                                        reason : reason


                                                    },
                                                    dataType: "text",
                                                    success: function (data){
                                                        
                                                    }

                                                });
}



});


      function getSelected(){
	var selectedIds = tbl.columns().checkboxes.selected()[0];
	//console.log(selectedIds)
        
             
 
 
         if(Array.isArray(selectedIds) && selectedIds.length){
//             if(confirm("Do you wish to convert this sales quote to a client order ?")){
//                //window.location.href = "../quotation/managingOrederReceivedStatus.htm?sno=" + selectedIds + "";
//             }
             swal({
                 text:"Do you wish to bulk post these invoices ?",
                 buttons: [
                     'Cancel',
                     'OK'
                 ]
             }).then(function(isConfirm){
                    if (isConfirm) {         
                        window.location.href = "../quotation/managingOrederReceivedStatus.htm?sno=" + selectedIds + "";
                    }
                    }
                    );
      } else {
          swal("Please select atleast one checkbox")
         
        }
 
         
           

               }
               
$("#headcheck").on('click', function (e) {
     $('input:checkbox').not(this).prop('checked', this.checked);
})
    </script>


</body>

</html>

