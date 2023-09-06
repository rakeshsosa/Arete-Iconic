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

               <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
                  <script>


      function openMeterWindow4() {



         // alert(newMeterType);



        myWindow = window.open("../Expenses/SelectExepenseCategoryNameList.htm", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    }

    </script>
            </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                      <jsp:include page="../login/headerlink.htm?submodule=Expenses Settings&tab=Expenses Type Settings"/>
                    
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Expense Type Settings</h5>
                                                </div>
        
         <form class="myFormForValidation form-inline row" action="../Expenses/expensesTypeFormSubmit.htm" id="coustmermnForm">
                     <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesTypeList) > 0}">
                                                                <c:forEach items="${expensesTypeList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                       
                                                                            <input type="text" placeholder="fill" class="form-control" id="expenseTypeId" readonly="" name="expenseTypeId" value="${type[0]}" maxlength="98">
                                                                     
                                                                             </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>    
                                                               
                                                                     <input type="text" placeholder="fill" class="form-control" name="expenseTypeId" maxlength="98" id="expenseTypeId" required onkeypress="return isAlphaNumeric(event)">
                                                              
                                                               
                                                            </c:otherwise>        
                                                        </c:choose>
 <label class="control-label"> Expense Type ID<span style="color:red">*</span></label>
                                                    </div>
                            <div class="col-md-4 mb-3">
                                                        <label class="control-label" > Select Expense Category Name <span style="color:red">*</span></label>
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesTypeList) > 0}">
                                                                <c:forEach items="${expensesTypeList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                             <div class="d-flex">
                                                                            <input type="text" placeholder="" class="form-control" id="expno" readonly="" name="expensesCategoryName" value="${type[0]}" maxlength="98">
                                                                            <i class="fa fa-hand-pointer-o fa-2x ml-2" onclick="return openMeterWindow4();"></i>
                                                                         </div>
                                                                             </c:when>
                                                                        <c:otherwise>

                                                                            <input type="text" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>    
                                                                <div class="d-flex">
                                                                     <input type="text" placeholder="" class="form-control" name="expensesCategoryName" maxlength="98" id="expno" required onkeypress="return isAlphaNumeric(event)">
                                                                <i class="fa fa-hand-pointer-o fa-2x ml-2" onclick="return openMeterWindow4();"></i>
                                                                </div>
                                                               
                                                            </c:otherwise>        
                                                        </c:choose>

                                                    </div>
                                                 
                                                       <div class="col-md-4 form-floating mb-3">
                                                          
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesTypeList) > 0}">
                                                                <c:forEach items="${expensesTypeList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input placeholder="fill" type="text" class="form-control" readonly="" id="expcat" name="expenseTypeName" value="${type[0]}" maxlength="98" onkeypress="return isAlphabet(event)">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control" name="expenseTypeName" maxlength="98" id="expcat" required onkeypress="return isAlphabet(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                   <label class="control-label"> Expense Type Name <span style="color:red">*</span></label>
                                                    </div>
                                                    
                                        
                                                         <div class="col-md-4 form-floating mb-3">
                                                           
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesTypeList) > 0}">
                                                                <c:forEach items="${expensesTypeList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" name="auditrole" value="" maxlength="98" id="dname">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                           

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>   
                                                            
                                                                    <input type="text" placeholder="fill" class="form-control" name="auditrole" maxlength="98" id="dname" required onkeypress="return isAlphaNumeric(event)">
                                  
                                                               
                                                                 </c:otherwise>        
                                                        </c:choose>
                                                     <label class="control-label"> Description <span style="color:red">*</span></label>
                                                    </div>
                  <div class="col-md-4 form-floating mb-3">
                                                       <c:choose>
                                                            <c:when test="${fn:length(expensesTypeList) > 0}">
                                                                <c:forEach items="${expensesTypeList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                           <select type="text" class="form-control" name="accGroup" id="accGroup">
                                                                    <option value="Test">Test</option>
                                                                </select>
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <select type="text" class="form-select" name="accGroup" id="accGroup">
                                                                    <option value="Test">Test</option>
                                                                </select>
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                   <label class="control-label" > Account Group<span style="color:red">*</span></label>
                                                    </div>
                                                    
                                                   
                                               <div class="row my-2">
                                                   <div class="col-md-12">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>
                                                   </div>
                                                    <c:if test="${action ne 'edit' && action ne 'view'}">  
                                                <div class="my-3 mx-3" style="overflow: scroll;height: 200px;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                          
                                                            <th class="theader" style="">Expense Category Name</th>
                                                             <th class="theader" style="">Expense Type ID</th>
                                                            <th class="theader" style="">Expense Type Name</th>
                                                            <th class="theader" style="">Description </th>
                                                             <th class="theader" style="">Account Group</th>
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {

                                                                var valid1 = true;
                                                              var expno = document.getElementById('expno').value ;
                                                              var expname = document.getElementById('expcat').value ;
                                                              var dname = document.getElementById('dname').value ;
                                                                 var expenseTypeId = document.getElementById('expenseTypeId').value ;
                                                              var accGroup = document.getElementById('accGroup').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value &&
                                                                    document.getElementById('dname').value &&
                                                                     document.getElementById('expenseTypeId').value ;
                                                             
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

                                                                $('#resourcetable tr').each(function () {
                                                                        var a = $(this).find('#expcat').val();
                                                                        if (a === expname) {
                                                                            
                                                                            e.preventDefault();
                                                                            swal('Selected record already exists in grid.');
                                                                            valid1 = false;
                                                                            return false;                                                                        
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                  tr.innerHTML = ' <td><input type="text" readonly class="form-control" name="expCatNo" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text" readonly class="form-control" name="expCatNo" id="expno"  value="' + expenseTypeId +
                                                    '" > </td><td><input type="text"  class="form-control"  id="expcat" name="expenType" value="' + expname +
                                                    '"> </td><td><input type="text"  class="form-control" name="expDesc"  id="expcat"  value="' + dname +
                                                    '"><input type="hidden"  class="form-control"  id="kk" name="expNo" value=""> </td><td><input type="text" readonly class="form-control" name="expCatNo" id="expno"  value="' + accGroup +
                                                    '" > </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
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
                                                            function checkGrid() {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                 
                                                    </table>                                                  
                                                </div>
                                                   
                                                    </c:if>
                                                   
                                                   <c:if test="${action eq 'edit'}">  
                                                   
                                                <div class="my-3 mx-3" style="overflow: scroll;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">Expense Category Number</th>
                                                            <th class="theader" style="">Expense Type</th>
                                                            <th class="theader" style="">Description </th>
                                                            <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                        
                                                        
                                                         <c:forEach items="${expensesTypeNewUniqGridList}" var="list">
                                                         <tr class="wrk">
                                                         
                                                             
                                                     
                                                        
                                                       
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expCatNo" id="expno" type="text" value="${list.expensesCategoryNumber}" >
                                                            <input name="expNo" type="hidden" value=<c:out value="${list.expensesTypeId}"/> >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expenType" id="expcat" type="text" value="${list.expenseTypeName}" >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expDesc" id="expcat" type="text" value="${list.desc}" >
                                                        </td> 
                                                        <td align="center" class="tinput" style="vertical-align: middle;">
                                                        <a title="Remove Item" id="deleteWrk"
                                                                                                       class="btn btn-light border"id=""
                                                                                      href="../Expenses/DelExpenseTypeSettingsForm.htm?snoExpensesTypeIdId=${list.expensesTypeId}&expensesCategoryNumber=${list.expensesCategoryNumber}&expenseCategoryName=${list.expensesCategoryName}&action=edit">
                                                                      <i class="fa fa-trash-o text-danger"></i>
                                                                                                    </a>
                                                        </td>


                                                              
                                                                </tr>   
                                                                </c:forEach>
                                                        
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {
                                                                
                                                                var valid1 = true;
                                                              var expno = document.getElementById('expensesCatIdNum').value ;
                                                              var expname = document.getElementById('expcat').value ;
                                                              var dname = document.getElementById('dname').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value &&
                                                                     document.getElementById('dname').value ;
                                                             
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

                                                                $('#resourcetable tr').each(function () {
                                                                        var a = $(this).find('#expcat').val();
                                                                        if (a === expname) {
                                                                            
                                                                            e.preventDefault();
                                                                            swal('Selected record already exists in grid.');
                                                                            valid1 = false;
                                                                            return false;                                                                        
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                  tr.innerHTML = ' <td><input type="text" readonly class="form-control text-center" name="expCatNo" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text"  class="form-control text-center"  id="expcat" name="expenType" value="' + expname +
                                                    '"> </td><td><input type="text"  class="form-control text-center" name="expDesc"  id="expdept"  value="' + dname +
                                                    '"><input type="hidden"  class="form-control text-center"  id="kk" name="expNo" value=""> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
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
                                                            function checkGrid() {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                 </table>                                                  
                                                </div>
                                                         
                                                     </c:if>
                                                   
                                                   
                                                   
                                                   
                                                   
                                                     
                                                   <c:if test="${action eq 'view'}">  
                                                   
                                                <div class="my-3 mx-3" style="overflow: scroll;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">Expense Category Number</th>
                                                            <th class="theader" style="">Expense Type</th>
                                                            <th class="theader" style="">Description </th>
<!--                                                            <th class="theader" style="">Action</th>-->
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                        
                                                        
                                                         <c:forEach items="${expensesTypeNewUniqGridList}" var="list">
                                                         <tr class="wrk">
                                                         
                                                             
                                                     
                                                        
                                                       
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expCatNo" id="expno" type="text" value="${list.expensesCategoryNumber}" >
                                                            <input name="expNo" type="hidden" value=<c:out value="${list.expensesTypeId}"/> >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expenType" id="expcat" type="text" value="${list.expenseTypeName}" >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expDesc" id="expcat" type="text" value="${list.desc}" >
                                                        </td> 
                                                        <td align="center" class="tinput" style="vertical-align: middle;">
                                                        
                                                        </td>


                                                              
                                                                </tr>   
                                                                </c:forEach>
                                                        
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {

                                                                var valid1 = true;
                                                              var expno = document.getElementById('expensesCatIdNum').value ;
                                                              var expname = document.getElementById('expcat').value ;
                                                              var dname = document.getElementById('dname').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value &&
                                                                     document.getElementById('dname').value ;
                                                             
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

//                                                                $('#resourcetable tr').each(function () {
//                                                                        var a = $(this).find('#expno').val();
//                                                                        if (a === expno) {
//                                                                            
//                                                                            e.preventDefault();
//                                                                            swal('Selected record already exists in grid.');
//                                                                            valid1 = false;
//                                                                            return false;                                                                        
//                                                                        } else {
//                                                                            return true;
//                                                                        }
//                                                                    });

                                                                if (valid1 === true) {
                                                                    var table = document.getElementById("resourcetable");
                                                                   var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                  tr.innerHTML = ' <td><input type="text" class="form-control text-center" name="expCatNo" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text"  class="form-control text-center"  id="expcat" name="expenType" value="' + expname +
                                                    '"> </td><td><input type="text"  class="form-control text-center" name="expDesc"  id="expdept"  value="' + dname +
                                                    '"><input type="hidden"  class="form-control text-center"  id="kk" name="expNo" value=""> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
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
                                                            function checkGrid() {
                                                                var table = document.getElementById("resourcetable");
                                                                var slNo = table.rows.length - 1;
                                                                if (slNo < 0) {
                                                                    swal("Please add Data in grid");
                                                                    $("#todayProd1").focus();
                                                                    $("#storage1").focus();
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            }                                               
                                                        </script>
                                                 </table>                                                  
                                                </div>
                                                         
                                                     </c:if>
                                                   
                                                 
                                                    <c:if test="${action ne 'view'}">
                                                          <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <button type="submit" id="sav" class="btn btn-primary mx-1" onclick="checkGrid()">Save</button>
                                                                <a href="./ExpenseTypeSettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                                
                                                
                                                  <c:if test="${action eq 'view'}">
                                                          <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <a href="../Expenses/ExpenseTypeSettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                             </div>
                        </form>
  
  </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
</body>

</html>

