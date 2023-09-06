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


                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Utility Master&tab=Property Services&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
<!--                                                    <h5>Department Roles</h5>-->
                                                </div>
                                                <form class="form-inline row" action="../login/rolesubmit.htm">
                                                       <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                            <c:choose>
                                                <c:when test="${fn:length(quoteList) > 0}">
                                                    <c:forEach items="${quoteList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="jointeeName1" name="jointeeName1" value="${list.jointeeName1}" autocomplete="off">
                                                                <input type="hidden" class="form-control"  id="jointeeName11" value="${list.jointeeName1}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="jointeeName1" value="${list.jointeeName1}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill" class="form-control" id="jointeeName1" name="jointeeName1" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label">Property Name <a class="text-danger">*</a></label>
                                        </div>
                                                    
                                                   
                                        
                                                     <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="servicename" class="form-control"  name="servicename" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Service Name</label>
                                                    </div>
                                                      <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceper" class="form-control"  name="serviceper" maxlength="98" required onkeypress="firstToUpperCase1(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Description</label>
                                                    </div>
                                                       <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="serviceinterval" class="form-control"  name="serviceinterval" maxlength="98" required onkeypress="isNumberKey(event);">
<!--                                                        <select >
                                                            <option>Choose</option>
                                                            <option>Monthly</option>
                                                            <option>Quarterly</option>
                                                            <option>Half-yearly</option>
                                                            <option>Yearly</option>
                                                        </select>-->
                                                        <label for="groupname"><span style="color:red">*</span> Service Charges Interval</label>
                                                    </div>
                                               <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="fixservicecharg" class="form-control"  name="fixservicecharg" maxlength="98" required onkeypress="isNumberKey(event);">
                                                        <label for="groupname"><span style="color:red">*</span> Fixed Service Charges</label>
                                                    </div>
                                                    
                                                    <div class="col-md-4 form-floating mb-3">
                                                        <input type="text" placeholder="Org Name" id="" class="form-control"  name="">
                                                        <label for="groupname"><span style="color:red">*</span> Service Category</label>
                                                    </div>
                                             
                                                 
                                                    
                                             <div class="col-lg-12 mt-3">
                                                       <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle"></i> ADD</button>

                                                   </div>
                                                    
                                                    <div class="my-3 col-lg-12" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll">

                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                           
                                                          
                                                            <th class="theader" style="">Service Name</th>
                                                            <th class="theader" style="">Description</th>
                                                             <th class="theader" style="">Service Charges Interval</th>
                                                               <th class="theader" style="">Fixed Service Charges</th>
                                                               
                                                              <th class="theader" style="">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="resourcetable">
                                                 
                                                    </tbody>               
                                                  <script>
                                                            var count = 0;
                                                            function addOrderRow_test(e) {
                                                                
                                                                var valid1 = true;
                                                              var docname = document.getElementById('servicename').value ;
                                                              var doctype = document.getElementById('fixservicecharg').value ;
                                                             var docexpiry = document.getElementById('serviceinterval').value;
                                                               var serviceper = document.getElementById('serviceper').value ;
                                                             
                                                              var x = document.getElementById('servicename').value &&
                                                                      document.getElementById('fixservicecharg').value &&
                                                                      document.getElementById('serviceinterval').value &&
                                                                       document.getElementById('serviceper').value ;
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
                                                                
                                                                   var rowlen = slNo1 +1 ;
                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;

                                                    tr.innerHTML = '<td><input type="text" readonly class="form-control" name="documentName" id="userid" value="' + docname +
                                                    '" > </td> <td><input type="text" readonly  class="form-control" name="documentType"  id="orgid"  value="' + serviceper +
                                                    '"> </td>  <td><input type="text" readonly  class="form-control" name="documentDateOfUploadDate"  id="ctCode"  value="' +  docexpiry +
                                                    '"> </td>  </td> <td><input type="text" readonly  class="form-control" name="documentExpirtyDate"  id="ctDesc"  value="' + doctype +
                                                    '"> </td> <td align="center" class="tinput" style="vertical-align: middle;"><a href="javascript:" class="btn btn-light border" onclick="removeRow12('
                                                    + slNo + ')"><i class="fa fa-trash-o text-danger"></i> </a></td>';
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
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
            
                                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                                            <a href="../master/propertyServicesList.htm" class="btn btn-danger">Cancel</a>
            
                                                        </div> 
            
                                                    </c:if>
                                                    <c:if test="${action eq 'view'}">
                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                            <a href="../master/propertyServicesList.htm" class="btn btn-danger">Cancel</a>
                                                        </div> 
            
                                                    </c:if>
                                                </form>
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
                    </body>

                    </html>