<%-- Document : assetDetailsForm Created on : Sep 15, 2016, 10:42:18 AM Author : Kondal Reddy N --%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                  
                    <script>
        function selectPropertyDetails()
        {
            myWindow = window.open("../tenant/selectPropertyName.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            window.close();
        }

    </script>

                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                            <ul class="nav nav-pills">
                               <li class="nav-item "><a class="nav-link active" href="#">Income</a></li> &nbsp;
                            </ul>  
                            <br>
                            <div class="text-end">
                                <a class="btn btn-primary btn-sm" href="../tenant/incomeAmountList.htm"><i class="bi bi-eye"></i> Show Income Records</a>
                            </div>
                         </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <form id="paymentform" class="row mt-3" action="../tenant/AddincomeFormSubmit.htm">
                                                    <div class="row">
                                                        <label for="custId"><b>Time Period</b></label>
                                                      <div class="form-floating col-lg-4 mb-2 pick1"> 
                                                        
                                                        <c:choose>
                                                    <c:when test="${fn:length(incomeAmountList) > 0}">
                                                        <c:forEach items="${incomeAmountList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" placeholder="fill" autocomplete="off" class="form-control datepicker1" name="startDate" id="startDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.fromDate}"/>" required onchange="return dateValidation()">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="fill" autocomplete="off" class="form-control datepicker1" name="startDate" id="startDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.fromDate}"/>" readonly="" required>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="fill" class="form-control datepicker1" autocomplete="off" name="startDate" id="startDate" required onchange="return dateValidation()">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label for="groupname"><span style="color:red">*</span>From</label> 
                                                    </div>
                                                     <div class="form-floating col-lg-4 mb-2 pick2"> 
                                                        
                                                        <c:choose>
                                                    <c:when test="${fn:length(incomeAmountList) > 0}">
                                                        <c:forEach items="${incomeAmountList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" placeholder="fill" class="form-control datepicker2" autocomplete="off" name="endDate" id="endDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.toDate}"/>" required onchange="return dateValidation()">
                                                                    <input type="hidden" class="form-control"  id="pk" name="pk" value="${list.sNo}" maxlength="40">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="fill" class="form-control datepicker2" autocomplete="off" name="endDate" id="endDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.toDate}"/>" readonly="" required>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="fill" class="form-control datepicker2" autocomplete="off" name="endDate" id="endDate" required onchange="return dateValidation()">
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label for="custId"><span style="color:red">*</span>To</label> 
                                                     </div>
                                                      <div class="form-floating col-lg-4 mb-2"> 
                                                        
                                                        <c:choose>
                                                    <c:when test="${fn:length(incomeAmountList) > 0}">
                                                        <c:forEach items="${incomeAmountList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="Property" name="Property" class="form-control"  placeholder="xyz" value="${list.property}" onclick="selectLead();" required> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="Property" name="Property" class="form-control"  placeholder="xyz" value="${list.property}" readonly=""  required> 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" placeholder="Fill" id="Property" name="Property" class="form-control" value="" readonly="" onclick="return selectLead();" autocomplete="off">
                                                        <input type="hidden" placeholder="Select Property Code" class="form-control d-none" id="assetCode" readonly="" name="assetCode" maxlength="40" value="">
                                                        
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label for="custId"><span style="color: red;">*</span>Property</label> 
                                                    </div>
                                                    </div>
                                                    
                                                       <div class="row">
                                                      <div class="form-floating col-lg-4 mb-2"> 
                                                        
                                                        <c:choose>
                                                    <c:when test="${fn:length(incomeAmountList) > 0}">
                                                        <c:forEach items="${incomeAmountList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="Unit" name="Unit" class="form-control"  placeholder="xyz" value="${list.unit}" onclick="selectLead1();" required> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" id="Unit" name="Unit" class="form-control"  placeholder="xyz" value="${list.unit}" readonly="" onclick="selectLead1();" required> 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" id="Unit" name="Unit" class="form-control"  placeholder="xyz" readonly="" onclick="selectLead1();" required> 
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label for="custId"><span style="color: red;">*</span>Unit</label> 
                                                      </div>
                     
                                                    <div class="form-floating col-lg-4  mb-2">
                                                        <select class="form-select" id="Incometype" name="Incometype">
                                                            <option selected="" disabled="">Select an option</option>
                                                            <option value="Rent">Rent</option>
                                                            <option value="Service">Service</option>
                                                            <option value="Utility">Utility</option>
                                                        </select>
                                                         <label class="control-label">Income Type</label>
                                                     </div>
                                                           
                                                           <div class="form-floating col-lg-4 mb-2"> 
                                                        <input type="text" id="CustomerName" name="CustomerName" class="form-control" placeholder="xyz" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Customer Name</label> 
                                                      </div>
                                                    </div>
                                                    
                                                     <div class="row">
                                                     <div class="form-floating col-lg-4 mb-2"> 
                                                        <input type="text" id="PropertyName" name="PropertyName" class="form-control" placeholder="xyz" required> 
                                                        <label for="custId"><span style="color: red;">*</span>Property Name</label> 
                                                    </div>
                                                         <div class="form-floating col-lg-4 mb-2"> 
                                                        <input type="text" id="TotalPayable" name="TotalPayable" class="form-control" placeholder="xyz" required onkeypress="isNumberKey(event);"> 
                                                        <label for="custId"><span style="color: red;">*</span>Total Payable</label> 
                                                    </div>
                                                    </div>
                                     
                                                              
                                                   <c:if test="${action ne 'view'}">
                                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline my-3">
                                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                                <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>
            
                                                            </div>
                                                        </div>
                                                   </c:if>     
            
                                                        <div class="clearfix"></div>
                                                        
                                                        <c:if test="${action ne 'view' && action ne 'edit'}">
            
                                                                    <div class="mb-3" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">
            
                                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="theader" style="">S.no</th>   
                                                                        <th>Income Type</th>
                                                                        <th>Customer Name</th>
                                                                        <th>Property Name</th>
                                                                        <th>Total Payable</th>
                                                                        <th class="theader" style="">Action</th>
            
                                                                    </tr>
            
                                                                </thead>
                                                                <tbody id="resourcetable">
            
                                                                </tbody>
                                                                <script>
                                                                    var count = 0;
                                                                    var aplevel = 1;
                                                                    function addOrderRow_test() {
            
                                                                        var valid1 = true;
                                                                        var incomeType = document.getElementById('Incometype').value;
                                                                        var customerName = document.getElementById('CustomerName').value;
                                                                        var propertyName = document.getElementById('PropertyName').value;
                                                                        var total = document.getElementById('TotalPayable').value;
            
                                                                        var x = document.getElementById('Incometype').value &&
                                                                                document.getElementById('CustomerName').value &&
                                                                                document.getElementById('PropertyName').value &&
                                                                                document.getElementById('TotalPayable').value;
            
                                                                        if (x == "" || x == null)
                                                                        {
                                                                            alert("Please select mandatory fields...!!!");
                                                                            valid1 = false;
                                                                        }
            
            
            
                                                                        if (valid1 == true) {
            
                                                                  var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                  
                                                                    var slNo1 = table.rows.length;
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;
                                                                            tr.innerHTML = '<td><input type="text" readonly class="form-control" name="userName" id="userid" value="' +rowlen  +
                                                                                    '" > </td><td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="submodulename" id="submodulename1" value="' + incomeType + '" style="border: none">\n\
                                                                                    <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text" readonly name="tabname" id="tabname1" value="' + customerName + '" style="border: none"></td>\n\
                                                                                      <td><input class="form-control capitalize  validate[required]" readonly style="width: 100%;text-align: center" type="text" name="Role" id="Role1" value="' + propertyName + '"  style="border: none"></td>\n\
                                                                                         <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="user" id="user1" value="' + total +'" style="border: none">\n\
                                                                                          <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
                                                                            count++;
                                                                            aplevel++;
                                                                        }
            
                                                                        else {
                                                                            return;
                                                                        }
                                                                    }
            
                                                                    function removeRow12(id) {
                                                                        count--;
                                                                        aplevel--;
                                                                        var table = document.getElementById("resourcetable");
                                                                        for (var i = 0; i < table.rows.length; i++) {
                                                                            var lr = table.rows[i];
                                                                            if (lr.id == 'list_tr_' + id) {
                                                                                table.deleteRow(i);
                                                                                var lvl = 1;
                                                                                $('#resourcetable tr').each(function () {
            
                                                                                    $(this).find('#level1').val(lvl);
                                                                                    lvl++;
                                                                                });
                                                                                return;
                                                                            }
                                                                        }
                                                                    }
                                                                    function checkGrid() {
                                                                        var table = document.getElementById("resourcetable");
                                                                        var slNo = table.rows.length - 1;
                                                                        if (slNo < 0) {
                                                                            alert("Please add data in grid...!!!");
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    }
            
                                                                    function validCapacity($this) {
                                                                        var $itemRow = $($this).closest('tr');
                                                                        var availCapacity1 = $itemRow.find('#availCapacity').val();
                                                                        var loadcap = $itemRow.find('#loadcap').val();
                                                                        if (parseFloat(loadcap) > parseFloat(availCapacity1)) {
                                                                            alert("Qlts cannot be greater than Available Capacity");
                                                                            $itemRow.find('#loadcap').val("");
                                                                            return false;
                                                                        } else {
                                                                            var total = 0;
                                                                            $('input#loadcap').each(function (i) {
                                                                                var total1 = $(this).val();
                                                                                if (!isNaN(total1))
                                                                                    total += Number(total1);
                                                                            });
                                                                            if (parseFloat(total) > parseFloat(document.getElementById('todayProd').value)) {
                                                                                alert("Total Qlts cannot be greater than Total Production");
                                                                                $('input#loadcap').val(0);
                                                                                $('input#loadcap').focus();
                                                                            }
                                                                            //                                                            validBulkLtrs($this, loadcap);
                                                                            // var inputs = $('input', $itemRow);
                                                                            //inputs.prop('readonly', true);
                                                                            return true;
                                                                        }
                                                                    }
            
                                                                </script>
            
                                                            </table>  
                                                        </div>  
                                                            
                                                        </c:if> 
                                                        
                                                        <c:if test="${action eq 'view'}">
            
                                                                    <div class="mb-3" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">
            
                                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="theader" style="">S.no</th>   
                                                                        <th>Income Type</th>
                                                                        <th>Customer Name</th>
                                                                        <th>Property Name</th>
                                                                        <th>Total Payable</th>
                                                                        <!--<th class="theader" style="">Action</th>-->
            
                                                                    </tr>
            
                                                                </thead>
                                                                <tbody id="resourcetable">
            
                                                                    <c:forEach items="${incomeTrackingId}" var="list">
                                                        <tr class="wrk">
                                                            
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="pk" id="pk" type="text" value="${list.sNo}" >
                                                            </td>
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="submodulename" id="submodulename" type="text" value="${list.incomeType}" >
                                                            </td> 

                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="tabname" id="tabname" type="text" value="${list.customerName}" >
                                                            </td> 
                                                             <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="Role" id="Role" type="text" value="${list.propertyName}" >
                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="user" id="user" type="text" value="${list.totalPayble}" >

                                                            </td> 
                                                        </tr>

                                                    </c:forEach>
                                                                </tbody>
                                                                <script>
                                                                    var count = 0;
                                                                    var aplevel = 1;
                                                                    function addOrderRow_test() {
            
                                                                        var valid1 = true;
                                                                        var incomeType = document.getElementById('Incometype').value;
                                                                        var customerName = document.getElementById('CustomerName').value;
                                                                        var propertyName = document.getElementById('PropertyName').value;
                                                                        var total = document.getElementById('TotalPayable').value;
            
                                                                        var x = document.getElementById('Incometype').value &&
                                                                                document.getElementById('CustomerName').value &&
                                                                                document.getElementById('PropertyName').value &&
                                                                                document.getElementById('TotalPayable').value;
            
                                                                        if (x == "" || x == null)
                                                                        {
                                                                            alert("Please select mandatory fields...!!!");
                                                                            valid1 = false;
                                                                        }
            
            
            
                                                                        if (valid1 == true) {
            
                                                                  var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                  
                                                                    var slNo1 = table.rows.length;
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;
                                                                            tr.innerHTML = '<td><input type="text" readonly class="form-control" name="userName" id="userid" value="' +rowlen  +
                                                                                    '" > </td><td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="submodulename" id="submodulename1" value="' + incomeType + '" style="border: none">\n\
                                                                                    <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text" readonly name="tabname" id="tabname1" value="' + customerName + '" style="border: none"></td>\n\
                                                                                      <td><input class="form-control capitalize  validate[required]" readonly style="width: 100%;text-align: center" type="text" name="Role" id="Role1" value="' + propertyName + '"  style="border: none"></td>\n\
                                                                                         <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="user" id="user1" value="' + total +'" style="border: none">\n\
                                                                                          <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
                                                                            count++;
                                                                            aplevel++;
                                                                        }
            
                                                                        else {
                                                                            return;
                                                                        }
                                                                    }
            
                                                                    function removeRow12(id) {
                                                                        count--;
                                                                        aplevel--;
                                                                        var table = document.getElementById("resourcetable");
                                                                        for (var i = 0; i < table.rows.length; i++) {
                                                                            var lr = table.rows[i];
                                                                            if (lr.id == 'list_tr_' + id) {
                                                                                table.deleteRow(i);
                                                                                var lvl = 1;
                                                                                $('#resourcetable tr').each(function () {
            
                                                                                    $(this).find('#level1').val(lvl);
                                                                                    lvl++;
                                                                                });
                                                                                return;
                                                                            }
                                                                        }
                                                                    }
                                                                    function checkGrid() {
                                                                        var table = document.getElementById("resourcetable");
                                                                        var slNo = table.rows.length - 1;
                                                                        if (slNo < 0) {
                                                                            alert("Please add data in grid...!!!");
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    }
            
                                                                    function validCapacity($this) {
                                                                        var $itemRow = $($this).closest('tr');
                                                                        var availCapacity1 = $itemRow.find('#availCapacity').val();
                                                                        var loadcap = $itemRow.find('#loadcap').val();
                                                                        if (parseFloat(loadcap) > parseFloat(availCapacity1)) {
                                                                            alert("Qlts cannot be greater than Available Capacity");
                                                                            $itemRow.find('#loadcap').val("");
                                                                            return false;
                                                                        } else {
                                                                            var total = 0;
                                                                            $('input#loadcap').each(function (i) {
                                                                                var total1 = $(this).val();
                                                                                if (!isNaN(total1))
                                                                                    total += Number(total1);
                                                                            });
                                                                            if (parseFloat(total) > parseFloat(document.getElementById('todayProd').value)) {
                                                                                alert("Total Qlts cannot be greater than Total Production");
                                                                                $('input#loadcap').val(0);
                                                                                $('input#loadcap').focus();
                                                                            }
                                                                            //                                                            validBulkLtrs($this, loadcap);
                                                                            // var inputs = $('input', $itemRow);
                                                                            //inputs.prop('readonly', true);
                                                                            return true;
                                                                        }
                                                                    }
            
                                                                </script>
            
                                                            </table>  
                                                        </div>  
                                                            
                                                        </c:if> 
            
            
            
                                                  
                                                        
                                                  
            
                                                    <c:if test="${action ne 'view' && action ne 'edit'}">
            
                                                       <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../tenant/incomeAmountList.htm" class="btn btn-danger">Cancel</a>
                                                        </div>
                                                    </c:if>
            
                                                </form>
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>

                        <script>
                            $(document).ready(function () {
                                //                $('#roleMast').validationEngine();
                            });
                
                            $("#submodulename").change(function () {
                                $("#tabname").empty();
                                var submodname = document.getElementById("submodulename").value;
                                $.ajax
                                        ({
                                            type: "POST",
                                            url: '../login/gettab.htm',
                                            data: {
                                                submodname: submodname
                                            },
                                            success: function (data) {
                                                $("#tabname").append('<option value="" disabled selected>Select your option</option>');
                                                if (data != '') {
                                                    var tab = data.split("$$");
                                                    for (var i = 0; i < tab.length - 1; i++) {
                
                                                        $("#tabname").append("<option value='" + tab[i] + "'>" + tab[i] + "</option>");
                
                
                                                    }
                                                }
                                            }
                                        });
                
                
                            });
                
                            $(document).on('change', '#Role', function ()
                //            $("#districtName").change(function ()
                            {
                                $("#user").empty();
                                var roleName = document.getElementById("Role").value
                
                                $.ajax
                                        ({
                                            type: "POST",
                                            url: '../login/getuser.htm',
                                            data: {
                                                roleName: roleName
                                            },
                                            success: function (data) {
                                                $("#user").append('<option value="" disabled selected>Select your option</option>');
                                                if (data != '') {
                                                    var st = data.split("##");
                                                    for (var i = 0; i < st.length - 1; i++) {
                                                        var userlis = st[i].split("$$");
                
                                                        $("#user").append("<option value='" + userlis[0] + "$$" + userlis[1] + "$$"+ userlis[2] +"'>" + userlis[0] + userlis[1]+"</option>");
                
                
                                                    }
                                                }
                                            }
                                        });
                
                
                            });
                
                            NProgress.done();
                
            
          $('.datepicker2').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    startDate:'0m 0d',
    todayHighlight: true,
    container: '.pick2'
});

$('.datepicker1').datepicker({
    format: 'dd-mm-yyyy',
    autoclose: true,
    startDate:'0m 0d',
    todayHighlight: true,
    container: '.pick1'
});
                            
           function selectLead() {
                myWindow = window.open("../tenant/selectPropertyName.htm", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                window.close();
            }
            function selectLead1(){
                myWindow = window.open("../tenant/selectPropertyName.htm", "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
                        </script>
                    </body>

                    </html>
