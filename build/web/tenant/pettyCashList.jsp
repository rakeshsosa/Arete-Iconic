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


                </head>


                <body class="nav-md">
                    <jsp:include page="../login/menu.htm" />
                    <jsp:include page="../login/footer.jsp" />

                    <main id="main" class="main">
                        <div class="mt-3">
                            <jsp:include
                                page="../login/headerlink.htm?submodule=Petty Cash Manager&tab=Petty Cash Manager&pagetype=list" />
                        </div>
                        <div class="pagetitle">

                        </div><!-- End Page Title -->
                        <section class="section">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="card">

                                        <div class="card-body">
                                            <div class="card-title">
                                                
                                            </div>
                                            <!-- Table with stripped rows -->

                                            <div class="table-responsive">
                                            <table class="table datatable table-hover table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Wallet Number</th>
                                                        <th>Custodian Name</th>
                                                        <th>Balance</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                
                                                <tbody>
                                                    <c:forEach items="${pettyCashList}" var="type">
                                                    <tr>
                                                        <td>${type.walletNumber}</td>
                                                        <td>${type.custodianName}</td>
                                                        <td>${type.openBalance}</td>
<!--                                                        <td></td>-->
                                                        <td class="text-nowrap last">
                                                            <a href="../tenant/pettyCashForm.htm?pk=${type.sNo}&walletNumber=${type.walletNumber}&action=view" class="fa fa-eye fa-lg" title="View"></a>
                                                            <a href="../tenant/pettyCashForm.htm?pk=${type.sNo}&walletNumber=${type.walletNumber}&action=edit" class="fa fa-pencil-square-o fa-lg" title="Edit"></a>
                                                            <a onclick="openAddAmount(event)" class="fa fa-money fa-lg" title="Add Amount"></a>
                                                            <a href="#" class="fa fa-print fa-lg" title="Generate Statement"></a>
                                                            <a href="#" class="fa fa-trash-o fa-lg" title="Inactive"></a>
                                                        </td>
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
<div class="modal" id="addStockModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add Amount</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body px-5 py-2">
       <form id="coustmermnFormm" name="frm" accept-charset="UTF-8" method="post" action="../Expenses/pettyCashAddAmount.htm" enctype="multipart/form-data">
               <div class="row mb-4">
                    <div class="col-lg-12 form-group">
                        <label class="control-label"> Deposit Amount <span style="color:red">*</span></label>
                            <input type="hidden"  class="form-control" name="walletinpopup" value="${type[1]}" id="walletinpopup">
                            <input required type="number" onchange="allowThreeDecimal(event)" class="form-control" name="depositAmountinpopup" value="depositAmount" id="depositAmountinpopup" maxlength="98">

                                  </div>
                    <div class="col-lg-12 form-group">
                                          <label class="control-label"> Balance <span style="color:red">*</span></label>

                                     <input type="text" class="form-control" readonly name="balanceinpopup" value="" id="balanceinpopup" maxlength="98">
                                     <input type="hidden" class="form-control" readonly value="" id="balanceinpopupconst">

                         </div>
                  </div>
                      <div class="row">

                <c:if test="${action ne 'view'}">                      
                    <div class="d-flex justify-content-center w-100 mt-3">
                        <input type="submit"
                               class="btn btn-primary mr-2" id="savebtnn" value="Save">

<!--                                                        <a href="../inventory/productInventoryList.htm" class="btn btn-danger">Cancel</a> -->
<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </c:if>
                                                                </div>
               
          </form>
       
      </div>
    </div>
  </div>
</div>   
                     <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Create, Search, View, Edit, Add Amount, Generate Statement, and Inactivate with Wallet Number, Custodian Name, Deposit Amount, and Opening Balance. </p>\n\
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
                    <script>
                         function openAddAmount(e){

//                        $("#walletinpopup").val(walletNo) 
//                    $("#depositAmountinpopup").val(depAmount)  
//                    
//                       $("#balanceinpopupconst").val(balAmount)
//                        $("#balanceinpopup").val(balAmount)                                      
                        $('#addStockModal').modal('show');
                      
                    }
                    </script>
                </body>

                </html>