<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">
             <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Vendor Details&tab=Vendor Details&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                              <c:forEach items="${vendorReqList}" var="list">
                            <c:set value="${list.sno}" var="sno"/>
                            <c:set value="${list.vendorCode}" var="vendorCode"/>
                             <c:set value="${list.businessType}" var="businessType"/>
                            <c:set value="${list.address}" var="address"/>
                             <c:set value="${list.postalCode}" var="postalCode"/>
                            <c:set value="${list.physicalAddress}" var="physicalAddress"/>
                            <c:set value="${list.regNo}" var="regNo"/>
                            <c:set value="${list.vatNo}" var="vatNo"/>
                            <c:set value="${list.taxNo}" var="taxNo"/>
                            <c:set value="${list.supplierName}" var="supplierName"/>
                             <c:set value="${list.mobile}" var="mobile"/>
                            <c:set value="${list.designation}" var="designation"/>
                            <c:set value="${list.altmobile}" var="altmobile"/>
                            <c:set value="${list.email}" var="email"/>
                           
                    </c:forEach>  
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Supplier Details</h5>
                                                </div>
                                                <form class="row" id="subassetsForm" action="../purchase/supplierDetailsFormSubmit.htm" method="post" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Select Property Code"
                                    class="form-control"
                                    required=""
                                    id="supplierCode"
                                    name="supplierCode"
                                    maxlength="40"
                                    value="${vendorCode}"
                                    onclick="return selectAssetDetails();"
                                    onchange="return changeFloor();"
                                    onblur="return changeFloor();"
                                />
                                <label class="control-label">Vendor Code<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="businessType" name="businessType" maxlength="40" value="${businessType}" required/>
                                <label class="control-label">Business Type <a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Fill"
                                    class="form-control"
                                    id="businessName"
                                    name="businessName"
                                    maxlength="40"
                                    value="${businessType}"
                                    onkeypress="return isNumberKey3(event)"
                                    onfocus="return changeFloor();"
                                />
                                <label class="control-label">Business Name <a style="color: red;">*</a></label>
                            </div>
                                                     <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="address" name="address" maxlength="40" value="${address}" required/>
                                <label class="control-label">Business Address <a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="postalCode" name="postalCode" maxlength="6" value="${postalCode}" onkeypress="return isNumberKey(event)" required/>
                                <label class="control-label">PO Box<a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="physicalAddress" name="physicalAddress" value="${physicalAddress}" onkeypress="return isNumberKey4(event)" required/>
                                <label class="control-label">Physical Address <a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="regNo" name="regNo" value="${regNo}" onkeypress="return isAlphaNumeric(event)" required/>
                                <label class="control-label">Business Registration No (CR No)</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="vatNo" name="vatNo" value="${vatNo}" onkeypress="return isNumberKey(event)" required/>
                                <label class="control-label">VAT No</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="taxNo" name="taxNo" value="${taxNo}" onkeypress="return isNumberKey(event)" required/>
                                <label class="control-label">Tax Card No<a style="color: red;">*</a></label>
                            </div>
                                                   
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="supplierName" name="supplierName" maxlength="40" value="${supplierName}" required/>
                                <label class="control-label">Contact Person Name <a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="designation" name="designation" maxlength="40" value="${designation}" required/>
                                <label class="control-label">Designation <a style="color: red;">*</a></label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <div>Mobile Number<a style="color: red;">*</a></div>
                                <input type="tel" class="form-control" id="mobile" name="mobile" maxlength="15" value="${mobile}" required onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <div>Alternate Mobile Number</div>
                                <input type="tel" class="form-control" id="altmobile" name="altmobile" maxlength="15" value="${altmobile}" onkeypress="return isNumberKey(event);"/>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="email" name="email" value="${email}" required onblur="validateEmail(this);"/>
                                <label class="control-label">Email ID <a style="color: red;">*</a></label>
                            </div>
                            
                            <div class="col-md-12 col-sm-12 col-xs-12 form-group mb-2 mt-3">
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px;"></i> ADD</button>
                                </div>
                            </div>
                          
                            <div class="clearfix"></div>
                            <div class="table-responsive mb-4">
                                <table style="width: 130%" class="table table-bordered" id="membertable">
                                <thead>
                                    <tr>
                                       
                                        <th class="theader" style="">S.no</th>
                                        <th class="theader" style="">Contact Person Name</th>
                                        <th>Designation</th>
                                        <th class="theader" style="">Mobile</th>
                                         <th class="theader" style="">Email</th>
                                          <th class="theader" style="">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="resourcetable">
                             <c:forEach items="${vendorReqList}" var="list">
                                                        <tr class="wrk">
                                                            
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="pk11" type="text" value="${list.sno}" >
                                                            </td> 

                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="supplierName11" type="text" value="${list.supplierName}" >
                                                            </td> 
                                                             <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="designation11" type="text" value="${list.designation}" >
                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="mobile11" type="text" value="${list.mobile}" >

                                                            </td>
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="email1" type="text" value="${list.email}" >

                                                            </td>
                                                           
                                                        </tr>

                                                    </c:forEach>
                                </tbody>               
                              <script>
                                        var count = 0;
                                        function addOrderRow_test(e) {
                                            
                                            var valid1 = true;
                                          var supplierCode = document.getElementById('supplierCode').value ;
                                          var businessName = document.getElementById('businessName').value ;
                                          var designation = document.getElementById('designation').value ;
                                         var supplierName = document.getElementById('supplierName').value;
                                            var mobile = document.getElementById('mobile').value;
                                              var email = document.getElementById('email').value;
                                               
                                          var x = document.getElementById('supplierName').value &&
                                                  document.getElementById('mobile').value &&
                                                  document.getElementById('email').value;
                                            if (x === "" || x === null) {
                                                swal("Please Fill the Required Fields");
                                                valid1 = false;
                                            } 


                                            if (valid1 === true) {
                                                var table = document.getElementById("resourcetable");
                                               var slNo = table.rows.length - 1;
                                              
                                                var slNo1 = table.rows.length;
                                            
                                               var rowlen = slNo1 +1 ;
                                                var tr = table.insertRow(slNo + 1);
                                                tr.id = 'list_tr_' + slNo;

                                tr.innerHTML = '<td><input type="text" readonly class="form-control" name="userName" id="userid" value="' +rowlen  +
                                '" > </td>  <td><input type="hidden" readonly class="form-control" name="pk1" value=""><input type="text" readonly class="form-control" name="supplierName1" id="userid" value="' + supplierName +
                                '" > </td> <td><input type="text" readonly class="form-control" name="designation1" id="userid" value="' + designation +
                                '" > </td> <td><input type="text" readonly  class="form-control" name="mobile1"  id="orgid"  value="' + mobile +
                                '"> </td><td><input type="text" readonly  class="form-control" name="email1"  id="orgid"  value="' + email +
                                '"> </td>  <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                + slNo + ')"><i class="fa fa-trash text-danger"></i> </a></td>';
//                                                    document.getElementById('expensename').value = '';
//                                                    document.getElementById('expenseamount').value = '';
                
                                                count++;

                                            } else {
                                                return;
                                            }
                                        }

                                        function removeRow12(id) {    
                                             
                                            count--;
                                            var table = document.getElementById("resourcetable");
                                            for (var i = 0; i < table.rows.length; i++) {
                                                var lr = table.rows[i];
                                                if (lr.id == 'list_tr_' + id) {
                                                    table.deleteRow(i);
                                                    if (table.rows.length == 0) {
                                                        $('#uomName').prop('readonly', false);
                                                    }
                                                    return;
                                                }
                                            }
                                       }
                                         function checkGrid(e) {
                                            var table = document.getElementById("resourcetable");
                                            var slNo = table.rows.length - 1;
                                            if (slNo < 0) {
                                                swal("Please add Data in grid");
                                                $("#todayProd1").focus();
                                                $("#storage1").focus();
                                                  e.preventDefault();
                                                return false;
                                            } else {
                                                return true;
                                            }
                                        }                                               
                                    </script>
                                </table>                                                  
                            </div>

                            <c:if test="${action ne 'view'}">
                                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="submit" class="btn btn-primary" style="" onclick="return valid();">Save</button>
                                                            <a href="../purchase/supplierDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                        </div>
            
                                                    </c:if>
                        </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <script>
                            window.onload = minRentGen();
                        </script>
<script>
    $(function (){
        var input = document.querySelector("#mobile");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#mobile").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#mobile").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#mobile").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script>
    $(function (){
        var input = document.querySelector("#altmobile");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#altmobile").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#altmobile").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#altmobile").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
                    </body>

                    </html>
