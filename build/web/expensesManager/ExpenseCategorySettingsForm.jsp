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
                    </head>


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                          <jsp:include page="../login/headerlink.htm?submodule=Expenses Settings&tab=Expenses Category Settings"/>        
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Expense Category Settings</h5>
                                                </div>
         <form class="myFormForValidation form-inline row" action="../Expenses/expensesCategoryFormSubmit.htm" id="coustmermnForm">
                           <div class="col-md-4 form-floating mb-3">
                                                    
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesCategoryList) > 0}">
                                                                <c:forEach items="${expensesCategoryList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" readonly="" name="expensesCategoryNumber" value="${type[0]}" maxlength="98">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[0]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" readonly="" class="form-control" value="EXP-${ordno}" name="expensesCategoryNumber" maxlength="98" id="expno"  required onkeypress="return isAlphaNumeric(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
  <label class="control-label" > Expense Category Number <span style="color:red">*</span></label>
                                                    </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                                       
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesCategoryList) > 0}">
                                                                <c:forEach items="${expensesCategoryList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control text-capitalize-first" id="expcat" name="expenseCategoryName" value="" maxlength="98" required onkeypress="return isAlphabet(event)">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[1]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>                                                    
                                                                <input type="text" placeholder="fill" class="form-control text-capitalize-first" name="expenseCategoryName" maxlength="98" id="expcat" required onkeypress="return isAlphabet(event)">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                                  <label class="control-label"> Expense Category Name <span style="color:red">*</span></label>
                                                    </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                                      
                                                        <c:choose>
                                                            <c:when test="${fn:length(expensesCategoryList) > 0}">
                                                                <c:forEach items="${expensesCategoryList}" var="type">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control"  name="categoryDesc" value="${type[2]}" maxlength="98">
                                                                        </c:when>
                                                                        <c:otherwise>

                                                                            <input type="hidden" class="form-control" readonly="" value="${type[2]}">

                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise>   
                                                            
                                                                <input type="text" placeholder="fill" class="form-control" name="categoryDesc" maxlength="98" id="dname" onkeypress="return isAlphaNumeric(event)">
                                                                      

                                                                  
                                                      
                                                                 </c:otherwise>        
                                                        </c:choose>
                                                                                 <label class="control-label"> Category Description</label>
                                                    </div>
                                                  
                                               
                                                
                                                
                                               <div class="row my-2">
                                                   
                                                     <c:if test="${action ne 'edit' && action ne 'view'}">  
                                                         <div class="col-md-12">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>
    
                                                         </div>
                                                <div class="mt-3 mx-3" style="overflow: scroll;height: 200px;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">Expense Category Number</th>
                                                            <th class="theader" style="">Expense Category Name</th>
                                                           
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
//                                                              var expdept = document.getElementById('expdept').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value;
                                                                 //    document.getElementById('expdept').value ;
                                                             
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

                                                  tr.innerHTML = ' <td><input type="text" class="form-control" readonly name="auditrole" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text"  class="form-control"  id="expcat" name="expenCat" value="' + expname +
                                                    '"> </td><input type="hidden"  class="form-control"  id="kk" name="expNo" value=""> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
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
                                                </div>
                                                  
                                                 <div class="row my-2">
                                                
                                                  <c:if test="${action eq 'edit'}">  
                                                        <div class="col-md-12">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>
    
                                                         </div>
                                             
                                                <div class="mt-3 mx-3" style="overflow: scroll;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">Expense Category Number</th>
                                                            <th class="theader" style="">Expense Category Name</th>
                                                            
                                                             <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                        
                                                        
                                                         <c:forEach items="${expensesCatUniqGridList}" var="list">
                                                         <tr class="wrk">
                                                         
                                                             
                                                     
                                                        
                                                       
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="exp" id="expno" type="text" value="${list.expensesCategoryNumber}" >
                                                            <input name="expNo" type="hidden" value=<c:out value="${list.expensesCategoryId}"/> >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expenCat" id="expcat" type="text" value="${list.expenseCategoryName}" >
                                                        </td> 
                                                        
                                                        <td align="center" class="tinput" style="vertical-align: middle;">
                                                        <a title="Remove Item" id="deleteWrk"
                                                                                                       class="btn btn-light border"
                                                                                      href="../Expenses/DelExpenseCategorySettings.htm?snoExpensesCatId=${list.expensesCategoryId}&expensesCategoryId=${list.expensesCategoryNumber}&action=edit">
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
                                                              var expno = document.getElementById('expno').value ;
                                                              var expname = document.getElementById('expcat').value ;
                                                           //   var expdept = document.getElementById('expdept').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value;
                                                                    // document.getElementById('expdept').value ;
                                                             
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

                                                  tr.innerHTML = ' <td><input type="text" readonly class="form-control text-center" name="auditrole" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text"  class="form-control text-center"  id="expcat" name="expenCat" value="' + expname +
                                                    '"> </td><input type="hidden"  class="form-control text-center"  id="kk" name="expNo" value=""> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
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
                                                
                                             
                                                    <div class="row my-2">
                                                <c:if test="${action eq 'view'}">  
                                                   
                                                <div class="mt-3 mx-3" style="overflow: scroll;width: 100%;border: 1px solid grey">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                            <th class="theader" style="">Expense Category Number</th>
                                                            <th class="theader" style="">Expense Category Name</th>
                                                            
                                                              <c:if test="${action  ne 'view'}">  
                                                             <th class="theader" style="">Action</th>
                                                              </c:if>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                        
                                                        
                                                         <c:forEach items="${expensesCatUniqGridList}" var="list">
                                                         <tr class="wrk">
                                                         
                                                             
                                                     
                                                        
                                                       
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="exp" id="expno" type="text" value="${list.expensesCategoryNumber}" >
                                                            <input name="expNo" type="hidden" value=<c:out value="${list.expensesCategoryId}"/> >
                                                        </td> 
                                                         <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="expenCat" id="expcat" type="text" value="${list.expenseCategoryName}" >
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
                                                              var expno = document.getElementById('expno').value ;
                                                              var expname = document.getElementById('expcat').value ;
                                                            //  var expdept = document.getElementById('expdept').value ;
                                                              
                                                              var x = document.getElementById('expno').value &&
                                                                      document.getElementById('expcat').value ;
                                                                  //   document.getElementById('expdept').value ;
                                                             
                                                                if (x === "" || x === null) {
                                                                    swal("Please Fill the Required Fields");
                                                                    valid1 = false;
                                                                } 

//                                                                $('#resourcetable tr').each(function () {
//                                                                        var a = $(this).find('#expno').val();
//                                                                        if (a === expdept) {
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

                                                  tr.innerHTML = ' <td><input type="text" readonly class="form-control text-center" name="auditrole" id="expno"  value="' + expno +
                                                    '" > </td><td><input type="text"  class="form-control text-center"  id="expcat" name="expenCat" value="' + expname +
                                                    '"> </td><input type="hidden"  class="form-control text-center"  id="kk" name="expNo" value=""> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
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
                                                </div>     
                                                    <c:if test="${action ne 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <button type="submit" id="sav" class="btn btn-primary mx-1" onclick="checkGrid()">Save</button>
                                                                <a href="./ExpenseCategorySettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
                                                        </div> 
                                                    </c:if>
                                            
                                            
                                              <c:if test="${action eq 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                         
                                                                <a href="../Expenses/ExpenseCategorySettingsList.htm" class="btn mx-1 btn-danger">Cancel</a>
                                                            
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

