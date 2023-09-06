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
                                    page="../login/headerlink.htm?submodule=General Maintenance Management&tab=General Maintenance Management&pagetype=form" />
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                    <c:forEach items="${gmmlist}" var="indvList">
                            <c:set value="${indvList.SNo}" var="SNo"/>
                            <c:set value="${indvList.assetCode}" var="assetCode"/>
                             <c:set value="${indvList.assetName}" var="assetName"/>
                            <c:set value="${indvList.serviceReqNo}" var="serviceReqNo"/>
                             <c:set value="${indvList.serviceReqDate}" var="ledgerGroup"/>
                            <c:set value="${indvList.serviceArea}" var="serviceArea"/>
                            <c:set value="${indvList.unitNo}" var="unitNo"/>
                            <c:set value="${indvList.serviceName}" var="serviceName"/>
                            <c:set value="${indvList.serviceDesc}" var="serviceDesc"/>
                            <c:set value="${indvList.approvedBudget}" var="approvedBudget"/>
                            <c:set value="${indvList.deadLine}" var="deadLine"/>
                            <c:set value="${indvList.actualCost}" var="actualCost"/>
                            <c:set value="${indvList.remarks}" var="remarks"/>
                            <c:set value="${indvList.status}" var="status"/>

                    </c:forEach>    
                    
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>General Maintenance Management</h5>
                                                </div>
                                                <form class="row" id="subassetsForm" action="../AMC/gmmFormSubmit.htm" method="post" enctype="multipart/form-data" onsubmit="return checkGrid();">
                                                    <c:if test="${action ne 'view' && action ne 'edit'}">
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Select Property Code"
                                    class="form-control"
                                    required=""
                                    id="assetCode"
                                    required readonly
                                    name="assetCode"
                                    maxlength="40"
                                    value="${assetCode}"
                                    onclick="return selectAccAssetDetails();"
                                    onchange="return changeFloor();"
                                    onblur="return changeFloor();"
                                />
                                <label class="control-label">Property Code <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Fill"
                                    class="form-control"
                                    id="assetName"
                                   required readonly
                                    name="assetName"
                                    maxlength="40"
                                    value=""
                                    onkeypress="return isNumberKey3(event)"
                                    onfocus="return changeFloor();"
                                />
                                <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceNo" name="serviceNo" maxlength="40" value="${srCode}" required readonly=""/>
                                
                                <label class="control-label">Service Request No<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3 pick1">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceDate" name="serviceReqDate" maxlength="40"  required readonly=""/>
                                <label class="control-label">Service Request Date<a style="color: red;">*</a> </label>
                            </div>
                                <div class="col-md-4 form-floating mb-3" id="serviceCatHide">
                                <select id="serviceCat" name="serviceCat" required="" class="form-select" required readonly>
                                    <option value="" disabled="" selected="">Select your option</option>
                                      <option value="Rental">Rental</option>
                                       <option value="Common">Common</option>
                                </select>
                                <label class="control-label">Service Category<a style="color: red;">*</a> </label>
                            </div>
                                <div class="col-md-4 form-floating mb-3" id="serviceAreaHide">
                                <select id="serviceArea" name="serviceArea" required readonly class="form-select">
                                    <option value="" disabled="" selected="">Select your option</option>
                                    <option value="Unit">Unit</option>
                                    <option value="Utility">Utility</option>
                                </select>
                                <label class="control-label">Service Area<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="unitNoDiv">
                                <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="" name="unitNo" onclick="return selectUnitNoDetails();" required readonly/>
                                <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="assetName" name="serviceName" maxlength="40" value="" required readonly/>
                                <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceDesc" name="serviceDesc" maxlength="40" value="" required readonly/>
                                <label class="control-label">Service Description<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="approvedBudget" name="approvedBudget" maxlength="40" value="" required readonly/>
                                <label class="control-label">Approved Budget <a style="color: red;">*</a> </label>
                            </div>
                            
                            
                            <div class="col-md-4 form-floating mb-3 pick2">
                                <input type="text" placeholder="Fill" class="form-control datepicker" id="deadline" required name="deadLine" maxlength="20" value=""/ required readonly>
                                <label class="control-label">Deadline <a style="color: red;">*</a></label>
                            </div>
                            
                            
                                
                                                    </c:if>
                                                    
                                                    <c:if test="${action eq 'edit'}">
                                                        
                                                        <c:forEach items="${gmmlist}" var="list">
                                                    <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Select Property Code"
                                    class="form-control"
                                    required=""
                                    id="assetCode"
                                    readonly=""
                                    name="assetCode" readonly=""
                                    maxlength="40"
                                    value="${list.assetCode}"
                                    onclick="return selectAccAssetDetails();"
                                    onchange="return changeFloor();"
                                    onblur="return changeFloor();"
                                />
                                <label class="control-label">Property Code <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Fill"
                                    class="form-control"
                                    id="assetName"
                                    readonly=""
                                    name="assetName"
                                    maxlength="40"
                                    value="${list.assetName}"
                                    onkeypress="return isNumberKey3(event)"
                                    onfocus="return changeFloor();"
                                />
                                <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
                                
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceNo" name="serviceNo" maxlength="40" value="${list.serviceReqNo}" required readonly/>
                                <label class="control-label">Service Request No<a style="color: red;">*</a> </label>
                                <input type="hidden" placeholder="Fill" class="form-control" id="SNo" name="SNo" maxlength="40" value="${list.SNo}" required readonly/>
                            </div>
                            <div class="col-md-4 form-floating mb-3 pick1">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceDate" name="serviceReqDate" maxlength="40" value="${list.serviceReqDate}" required readonly/>
                                <label class="control-label">Service Request Date<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <select id="serviceArea" name="serviceArea" required="" class="form-control">
                                   
                                    <option value="${list.serviceArea}">${list.serviceArea}</option>
                                  
                                </select>
                                <label class="control-label">Service Area<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="unitNoDiv">
                                <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="${list.unitNo}" name="unitNo" onclick="return selectUnitNoDetails();" required readonly/>
                                <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="assetName" name="serviceName" maxlength="40" value="${list.serviceName}" required readonly/>
                                <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="serviceDesc" name="serviceDesc" maxlength="40" value="${list.serviceDesc}" required readonly/>
                                <label class="control-label">Service Description<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="approvedBudget" name="approvedBudget" maxlength="40" value="${list.approvedBudget}" required readonly/>
                                <label class="control-label">Approved Budget <a style="color: red;">*</a> </label>
                            </div>
                            
                            
                            <div class="col-md-4 form-floating mb-3 pick2">
                                <input type="text" placeholder="Fill" class="form-control datepicker" id="deadline" required name="deadLine" maxlength="20" value="${list.deadLine}" required readonly/>
                                <label class="control-label">Deadline <a style="color: red;">*</a></label>
                            </div>
                            
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" id="actualCost"  maxlength="10" value="${list.actualCost}" name="actualCost" onchange="return calcArea();" onkeypress="return checkdigit(event, this, 10, 2);" />
                                <label class="control-label">Actual Cost</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <textarea class="form-control" placeholder="Fill" n="" id="remarks" rows="1" maxlength="200" value="${list.remarks}" name="remarks" type="text" style="overflow: hidden; overflow-wrap: break-word; height: 58px;">${list.remarks}</textarea>
                                <label class="control-label">Remarks </label>
                            </div>
                                                        </c:forEach>
                                                    </c:if>
                            
                                                    <c:if test="${action eq 'view'}">
                                                        
                                                        <c:forEach items="${gmmlist}" var="list">
                                                    <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Select Property Code"
                                    class="form-control"
                                    required=""
                                    id="assetCode"
                                    readonly=""
                                    name="assetCode" readonly=""
                                    maxlength="40"
                                    value="${list.assetCode}"
                                    onclick="return selectAccAssetDetails();"
                                    onchange="return changeFloor();"
                                    onblur="return changeFloor();"
                                />
                                <label class="control-label">Property Code <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input
                                    type="text"
                                    placeholder="Fill"
                                    class="form-control"
                                    id="assetName"
                                    readonly=""
                                    name="assetName"
                                    maxlength="40"
                                    value="${list.assetName}"
                                    onkeypress="return isNumberKey3(event)"
                                    onfocus="return changeFloor();"
                                />
                                <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
                                
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="hidden"  class="form-control" id="serviceNo" name="serviceNo" maxlength="40" value="${list.serviceReqNo}" required readonly  name="serviceReqNo" >/>
                                <label class="control-label">Service Request No<a style="color: red;">*</a> </label>
                                <input type="hidden" placeholder="Fill" class="form-control" id="SNo" name="SNo" maxlength="40" value="${list.SNo}" required readonly/>
                            </div>
                            <div class="col-md-4 form-floating mb-3 pick1">
                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="serviceDate" name="serviceReqDate" maxlength="40" value="${list.serviceReqDate}" required/>
                                <label class="control-label">Service Request Date<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <select id="serviceArea" readonly="" name="serviceArea" required="" class="form-control">
                                   
                                    <option value="${list.serviceArea}">${list.serviceArea}</option>
                                  
                                </select>
                                <label class="control-label">Service Area<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3" id="unitNoDiv">
                                <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="${list.unitNo}" name="unitNo" onclick="return selectUnitNoDetails();" required readonly/>
                                <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="assetName" name="serviceName" maxlength="40" value="${list.serviceName}" required readonly/>
                                <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="serviceDesc" name="serviceDesc" maxlength="40" value="${list.serviceDesc}" required readonly/>
                                <label class="control-label">Service Description<a style="color: red;">*</a> </label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" class="form-control" readonly="" id="approvedBudget" name="approvedBudget" maxlength="40" value="${list.approvedBudget}" required readonly/>
                                <label class="control-label">Approved Budget <a style="color: red;">*</a> </label>
                            </div>
                            
                            
                            <div class="col-md-4 form-floating mb-3 pick2">
                                <input type="text" placeholder="Fill" class="form-control datepicker" readonly="" id="deadline" required name="deadLine" maxlength="20" value="${list.deadLine}" required readonly/>
                                <label class="control-label">Deadline <a style="color: red;">*</a></label>
                            </div>
                            
                            <div class="col-md-4 form-floating mb-3">
                                <input type="text" placeholder="Fill" readonly="" class="form-control" id="actualCost"  maxlength="10" value="${list.actualCost}" name="actualCost" onchange="return calcArea();" onkeypress="return checkdigit(event, this, 10, 2);" />
                                <label class="control-label">Actual Cost</label>
                            </div>
                            <div class="col-md-4 form-floating mb-3">
                                <textarea class="form-control" readonly="" placeholder="Fill" n="" id="remarks" rows="1" maxlength="200" value="${list.remarks}" name="remarks" type="text" style="overflow: hidden; overflow-wrap: break-word; height: 58px;">${list.remarks} </textarea>
                                <label class="control-label">Remarks </label>
                            </div>
                                                        </c:forEach>
                                                    </c:if>

                            <div class="col-md-4 form-floating my-auto">
                                <span>Select Inventory</span>
                                <input type="checkbox" placeholder="Fill" id="checkInventory" name="checkInventory" maxlength="98">
                            </div>

                            
                            <div class="clearfix"></div>
                            <div class="table-responsive my-3">
                                <table class="table table-bordered" id="membertable" style="width: 1600px;">
                                    <thead>
                                        <tr>
                                            <th><i class="fa fa-trash fa-lg"></i></th>
                                            <th>Item Name</th>
                                            <th>Item Code</th>
                                            <th>Available Stock</th>
                                            <th>Quantity</th>
                                            <th>UOM</th>
                                        </tr>
                                    </thead>
                                    <tbody id="resourcetable"></tbody>
                                   
                                </table>
                            </div>
                            <%--- <c:if test="${action ne 'view'}">
                                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="submit" class="btn btn-primary" style="" onclick="return valid();">Save</button>
                                                            <a href="../AMC/generalMaintenanceMgmtList.htm" class="btn btn-danger">Cancel</a>
                                                        </div>
          
</c:if> --%>
                              <c:if test="${action ne 'approve'}">
                                                      <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                            <button type="submit" class="btn btn-primary" style="" onclick="return valid();">Approve</button>
                                                            <a href="../AMC/generalMaintenanceMgmtList.htm" class="btn btn-danger">Reject</a>
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
                    $(function(){
                        $("#serviceArea").on('change', function() {
                        var serviceArea = document.getElementById("serviceArea").value;
                        if (serviceArea === 'Unit')
                        {
                            $("#unitNoDiv").show();
                            $("#utilityAreaDiv").hide();
                        }
                        else{
                            $("#unitNoDiv").hide();
                            $("#utilityAreaDiv").show();
                        }

                    });
                    if($("#checkInventory").prop("checked")){
                          $("table").show()
                      } else {
                          $("table").hide()
                      }
                    $("#checkInventory").on('change', function() {
                      if($("#checkInventory").prop("checked")){
                          $("table").show()
                      } else {
                          $("table").hide()
                      }
                    })
                    })
                </script>
                <script>
                    $("#utilityAreaDiv").on('change', function() {
                        var utilityArea = document.getElementById("utilityArea").value;
                        if (utilityArea === 'Common')
                        {
                            $("#chooseUnitDiv").show();
                        }
                        else{
                            $("#chooseUnitDiv").hide();
                        }

                    });
                    
                     function selectAccAssetDetails()
                            {
                                
                                myWindow = window.open("../assets/selectAccAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            
                            function selectUnitNoDetails()
                            {
                                
                                myWindow = window.open("../assets/selectgmmUnitNumbers.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            
                    $(document).ready(function(){
                        $("#serviceAreaHide").hide()
                        $("#serviceDate").datepicker({
                            format: 'dd-mm-yyyy',
                            autoclose: true,
                            container: '.pick1'
                        })
                        
                        
                        $("#deadline").datepicker({
                            format: 'dd-mm-yyyy',
                            autoclose: true,
                            container: '.pick2'
                        })
                    })
                    
                    $("#serviceCat").on('change', function (e) {
                        if(e.target.value == "Rental") {
                            $("#serviceAreaHide").show()
                        } else {
                            $("#serviceAreaHide").hide()
                        }
                    })
                    
                    $("#deadline").on('change', function (e) {
                      
                       var dateFrom = $('#serviceDate').datepicker('getDate');
                var dateTo = $('#deadline').datepicker('getDate');
                if (dateFrom >= dateTo) {
                    swal("Deadline date should be greater than service date.");
                }
                    })
                </script>
                       
                        <jsp:include page="../login/footer.jsp" />
                    </body>

                    </html>