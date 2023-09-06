<%-- 
    Document   : chartOfAccountsForm
    Created on : 30 Mar, 2017, 11:08:37 AM
    Author     : Akshata
--%>
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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <script>
            
            function selectAssetDetails()
            {
                myWindow = window.open("../finance/selectPropertyListInLedger.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }
            
        </script>
    </head>
    <body class="nav-md">
     <jsp:include page="../login/menu.htm"/>
   <jsp:include page="../login/footer.jsp"/>  

   <main id="main" class="main">
       <div class="mt-3">
        <ul class="nav nav-pills">
            <li class="nav-item"><a class="nav-link active" href="../finance/ledgerList.htm">Ledger</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/calendarMasterList.jsp">Calendar Period</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/bankMasterList.jsp">Bank</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/earningDeductionMasterList.jsp">Earning Deduction</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/assetsList.jsp">Assets</a></li>
            <li class="nav-item"><a class="nav-link" href="../finance/liabiliatiesList.jsp">Liabilities</a></li>
        </ul>
        <br />
        <div class="text-end">
            <a class="btn btn-primary btn-sm" href="../finance/ledgerList.htm"><i class="bi bi-eye"></i> Show Ledger List</a>
        </div>
    </div>

    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title"><h5>Ledger Form</h5></div>

                        <form class="row validateForm" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../finance/ledgerFormSubmit.htm" enctype="multipart/form-data" commandName="coa">
                            <div class="col-md-4 form-floating pick2 mb-3">
                                <input placeholder="fill" type="text" required id="startDate" name="creationDate" class="form-control datepicker2" readonly=""/>
                                <label class="control-label"><span style="color: red;">*</span>Ledger Creation Date</label>
                            </div>
                              <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" required id="ledgerAccNo" name="ledgerNo" class="form-control" onkeypress="return isNumberKey(event);"/>
                                <label class="control-label"><span style="color: red;">*</span>Ledger Account Number</label>
                            </div>
                            
                            <div class="col-md-4 form-floating mb-3">
                                <select class="form-select" id="ledgerType" name="ledgerCode">
                                    <option value="" selected="" disabled="">Select an option</option>
                                    <option value="General">General</option>
                                    <option value="Sales">Sales</option>
                                    <option value="Purchase">Purchase</option>
                                </select>
                                <label class="control-label"><span style="color: red;">*</span>Ledger Type</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <select class="form-select" id="accountGroup" name="ledgerGroup">
                                    <option value="" selected="" disabled="">Select an option</option>
                                    <option value="Asset">Asset</option>
                                    <option value="Liabilities">Liabilities</option>
                                    <option value="Income">Income</option>
                                    <option value="Expenditure">Expenditure</option>
                                </select>
                                <label class="control-label"><span style="color: red;">*</span>Account Group</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="assetSubGroupHide">
                                <select id="sub_groupName" name="sub_groupName" class="form-select capitalize validate[required]">
                                    <option value="" selected="">Select an Option</option>                                                
                                    <option value="Current Asset">Current Assets</option>
                                    <option value="Fixed Assets">Fixed Assets</option>
                                    <option value="Investments">Investments</option>                                                   
                                </select>
                                <label class="control-label"><span style="color:red">*</span>Sub Group Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="liabilitySubGroupHide">
                                <select id="sub_groupName" name="sub_groupName" class="form-select capitalize validate[required]">
                                    <option value="" selected="">Select an Option</option>                                                
                                    <option value="Capital Account">Capital Account</option>
                                    <option value="Current Liabilities">Current Liabilities</option>
                                    <option value="Loans">Loans</option>                                                   
                                </select>
                                <label class="control-label"><span style="color:red">*</span>Sub Group Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" required name="ledgerName" maxlength="50" class="form-control capitalize validate[required]" />
                                <label class="control-label"><span style="color: red;">*</span>Ledger Account Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="fill" autocomplete="off" id="costcentername" required name="ledgerDescription" maxlength="50" class="form-control capitalize validate[required]" />
<!--                                <input type="hidden" id="ledgerNo" required name="ledgerNo" maxlength="50" value="${orderNo}" class="form-control capitalize validate[required]" />-->
                                <label class="control-label"><span style="color: red;">*</span>Ledger Account Description</label>
                            </div>
                            <div class="col-md-4 mb-3 my-auto">
                               <label class="control-label">
                                   <input type="checkbox" placeholder="fill" id="keepBankAcc" name="costcentername" /> Do you wish to add the bank details? 
                               </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="bankAccNameHide">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" required name="bankAccountName" maxlength="50" class="form-control capitalize validate[required]" />
                                <label class="control-label"><span style="color: red;">*</span>Bank Account Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="bankAccNoHide">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" required name="bankAccountNo" maxlength="50" class="form-control capitalize validate[required]" onkeypress="return isNumberKey(event)"/>
                                <label class="control-label"><span style="color: red;">*</span>Bank Account Number</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="propertyname" required name="ledgerReportGroup" maxlength="50" class="form-control capitalize validate[required]" value="" onclick="return selectAssetDetails()"/>
                                <label class="control-label"><span style="color: red;">*</span>Property Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="unitnumber" required name="ledgerSubgroup" maxlength="50" class="form-control capitalize validate[required]" readonly value="" />
                                <label class="control-label"><span style="color: red;">*</span>Unit Number</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" required name="shop" maxlength="50" class="form-control capitalize validate[required]" value="" />
                                <label class="control-label"><span style="color: red;">*</span>Shop Name / Customer Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" name="costCenter" maxlength="50" class="form-control capitalize validate[required]" value="" />
                                <label class="control-label">Cost Center</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input placeholder="fill" type="text" autocomplete="off" id="costcentername" required name="ledgerOpeningBalance" maxlength="50" onkeypress="isNumberKey(event)" class="form-control capitalize validate[required]" value="0" />
                                <label class="control-label"><span style="color: red;">*</span>Opening Balance</label>
                            </div>

                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                <a href="../finance/ledgerList.htm" class="btn btn-danger">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<script>
$(document).ready(function () {
    $("#assetSubGroupHide").hide();
    $("#liabilitySubGroupHide").hide();
    $("#bankAccNameHide").hide();
    $("#bankAccNoHide").hide();

    $(".datepicker2")
        .datepicker({
            format: "dd-M-yyyy",
            startDate: "0m +0m",
            autoclose: true,
            todayHighlight: true,
            container: ".pick2",
        })
        .datepicker("update", new Date());
});

//showBank details if checkbox enabled
$("#keepBankAcc").on("click", function (e) {
    if ($("#keepBankAcc").is(":checked")) {
        $("#bankAccNameHide").show();
        $("#bankAccNoHide").show();
    } else {
        $("#bankAccNameHide").hide();
        $("#bankAccNoHide").hide();
    }
});

//show or hide sub group name based on dropdown values
$("#accountGroup").on("change", function (e) {
    var accGrpVal = e.target.value;
    if (accGrpVal == "Asset") {
        $("#assetSubGroupHide").show();
        $("#liabilitySubGroupHide").hide();
    } else if (accGrpVal == "Liabilities") {
        $("#assetSubGroupHide").hide();
        $("#liabilitySubGroupHide").show();
    } else {
        $("#assetSubGroupHide").hide();
        $("#liabilitySubGroupHide").hide();
    }
});

</script>

</body>
</html>
