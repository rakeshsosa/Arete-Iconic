<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include
                                    page="../login/headerlink.htm?submodule=Income and Expense Tracking&tab=Income and Expense Tracking&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                                    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
              
            <div class="card-body">
                <div class="card-title"><h5>Income And Expense Form</h5></div> 
               <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../Transactional/calendarPeriodFormSubmit.htm" enctype="multipart/form-data" commandName="calendarPeriod">
                                        <div id="spinner" class="spinner" style="display:none;">
                                            <img id="img-spinner" src="spinner.gif" alt="Loading"/>
                                        </div>
                                       <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="incomeExpense" required="" name="incomeExpense" maxlength="10"  class="form-control capitalize validate[required]" value="" placeholder='fill'>   
                                         <label class="control-label"><span style="color:red">*</span>Income /Expense</label>
                                         </div>
                                        <div class="col-md-4 form-floating mb-3">
                                         <select class="form-control capitalize validate[required]" required=""  id="serviceArea" name="serviceArea"  type="text" value="" maxlength="10" placeholder="" data-original-title="Parent Code">                                                
                                              <option value="" selected="">Select an Option</option>

                                                  <option value="Income">Income</option>

                                                  <option value="Expense">Expense</option>

                                          </select>
                                              <label class="control-label"><span style="color:red">*</span>Category</label>
                                        </div> 
                   <div class="col-md-4 form-floating mb-3" id="incomeAmtDiv" style="display: none;">
                                           <input type="text" autocomplete="off" id="incomeAmount" required name="incomeAmount" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Income Amount"> 
                                       <label class="control-label"><span style="color:red">*</span>Income Amount</label>
                                          </div>
                                         <div class="col-md-4 form-floating mb-3" id="expenseAmtDiv" style="display: none;">
                                           <input type="text" autocomplete="off" id="expenseAmount" required name="expenseAmount" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Expense Amount"> 
                                       <label class="control-label"><span style="color:red">*</span>Expense Amount</label>
                                          </div>
                                         <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="description"  name="description" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Description"> 
                                       <label class="control-label">Description</label>
                                        </div>
                                         <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" readonly id="financeYear" required="" name="financeYear" maxlength="10"  onkeypress="return isNumberKey(event)"  class="form-control capitalize validate[required]" value="" placeholder='Financial Year'>   
                                         <label class="control-label"><span style="color:red">*</span>Financial Year</label>
                                         </div>
                                       
                                
<!--                                    <div class="col-md-4 form-floating mb-3">
                                           <input type="text" autocomplete="off" id="description" required name="description" maxlength="50"  class="form-control capitalize validate[required]" value="" placeholder="Description"> 
                                       <label class="control-label"><span style="color:red">*</span>Tax Percentage</label>
                                        </div>-->
      
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../tenant/incomeExpenseList.jsp"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                                   
                                    </form>
                           </div></div>

        </div>
      </div>
    </section>

                        </main><!-- End #main -->
                        <script>
                            window.onload = minRentGen();
                        </script>
                        <jsp:include page="../login/footer.jsp" />
                        
                        <script>
$("#serviceArea").on('change', function() {
    var serviceArea = document.getElementById("serviceArea").value;
    if (serviceArea === 'Income')
    {
        $("#incomeAmtDiv").show();
        $("#expenseAmtDiv").hide();
    }
    else{
        $("#incomeAmtDiv").hide();
        $("#expenseAmtDiv").show();
    }

});
</script>
                    </body>

                    </html>