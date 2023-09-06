<%@page import="java.text.SimpleDateFormat"%>
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
</head>
 <body class="nav-md">
   <jsp:include page="../login/menu.htm"/>
  <main id="main" class="main">
      <div>
             <ul class="nav nav-pills">
          <li class="nav-item"><a class="nav-link active" href="../tenant/makeRecurringForm.jsp">Make Recurring</a></li>
        </ul>
        <br />
      </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Rent Invoice Form</h5></div>
                        <form class="row" id="coustmermnForm" autocomplete="off" name="frm" accept-charset="UTF-8" method="post" action="../finance/rentInvoiceFormSubmit.htm" enctype="multipart/form-data">
                               <div class="col-md-4 form-floating mb-3">
                                           <input type="text" placeholder="fill" autocomplete="off" id="costcentername" required  name="invoiceId" maxlength="50"  class="form-control capitalize validate[required]" value="${invoiceNo}" > 
                                           <label class="control-label">Invoice Number <span class="text-danger">*</span></label>
                             </div>
                              <div class="col-md-4 form-floating mb-3">
                                           <input type="text" placeholder="fill" autocomplete="off" id="costcentername" required  name="invoiceId" maxlength="50"  class="form-control capitalize validate[required]" value="${invoiceNo}" > 
                                          <label class="control-label">Invoice Type <span class="text-danger">*</span></label>
                             </div>
                          
                                        <div class="col-md-4 form-floating mb-3 pick1" id="dueDateHide">
                                            <input type="text" placeholder="Org Name" id="docexpiry" class="form-control datepicker1" name="groupName" maxlength="98" required onkeypress="firstToUpperCase1(event);" />
                                            <label for="groupname"><span style="color: red;">*</span> Next Issue Date</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3" id="intervalHide">
                                            <select class="form-select" name="frequency" placeholder="Category" id="doctype" maxlength="98">
                                                <option value="" selected="selected" disabled>Select An Option</option>
                                                <option value="Weekly">Weekly</option>
                                                <option value="Monthly">Monthly</option>
                                                <option value="Quarterly">Quarterly</option>
                                                <option value="Half-yearly">Half-yearly</option>
                                                <option value="Yearly">Yearly</option>
                                            </select>

                                            <label for="clientType"><span style="color: red;">*</span> Frequency Interval</label>
                                        </div>
                                        <div class="col-md-4" id="settingHide">
                                            <label for="groupname"><span style="color: red;">*</span> Invoice Settings</label>
                                            <div>
                                                <label for="invoicenotify"> <input type="radio" name="invoiceRecurringType" id="" /> Send Invoices Automatically</label> <br />
                                                <label for="invoicenotify"> <input type="radio" name="invoiceRecurringType" id="" /> Create Draft Invoice And Send Manually</label>
                                            </div>
                                        </div>
                            
                            
                              <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                      
                                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                                <a href="../finance/rentInvoicesPDCList.htm"  class="btn btn-danger" >Cancel</a>      
                                            </div>  
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../login/footer.jsp"/>   
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>Fill in the Invoice, Tenant, Rent, Recurring and Additional Details, and Save or Send or Print. </p>\n\
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
        function showSubscripeDetails() {
    var amccheckBox = document.getElementById("amccustomToggle");
    if (amccheckBox.checked == true) {
        $("#dueDateHide").show();
        $("#intervalHide").show();
        $("#settingHide").show();
    } else {
        $("#dueDateHide").hide();
        $("#intervalHide").hide();
        $("#settingHide").hide();
    }
}
        $(document).ready(function () {
          
      $(".datepicker1")
        .datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true,
            container: ".pick1",
        })
        .datepicker("update", new Date());
        })
        </script>

   </body>
</html>

