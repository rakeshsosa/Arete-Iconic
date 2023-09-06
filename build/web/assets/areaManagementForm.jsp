
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <title>Arete Iconic</title>
    <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <script>
        function selectAssetDetails()
        {
            myWindow = window.open("../assets/selectAreaCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            window.close();
        }

    </script>

    <script>
        function selectAssetDetails()
        {
            myWindow = window.open("../assets/selectAreaCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            window.close();
        }

    </script>

    <body class="nav-md">
        <jsp:include page="../login/menu.htm" />

        <jsp:include page="../login/footer.jsp" />

        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include
                    page="../login/headerlink.htm?submodule=Property Area Management&tab=Area Management&pagetype=form" />
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h5>Property Area</h5>
                                </div>
                                <form class="form-inline row validateForm" id="propertyArea" action="../assets/areaManagementFormSubmit.htm"  method="post" enctype="multipart/form-data">

                                    <div class="col-md-4 form-floating mb-3">


                                        <%--   <c:choose>
                                   <c:when test="${fn:length(AreaManagementlist) > 0}">
                                       <c:forEach items="${AreaManagementlist}" var="list">
                                           <c:choose>
                                               <c:when test="${action eq 'edit'}">
                                                   <input type="text" class="form-control" ${mand_status_1} readonly="" id="assetCode" name="assetCode" value="${list.assetCode}" onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                                   <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                   <input type="hidden" name="assetCode" id="assetCode" value="">
<!--                                                                <input type="hidden" name="status" value="${list.status}">-->
                                               </c:when>
                                               <c:otherwise>
                                                   <input type="text" class="form-control" ${mand_status_1} readonly="" id="assetCode" name="assetCode" value="${list.assetCode}" readonly="" onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                               </c:otherwise> 
                                           </c:choose>
                                       </c:forEach>
                                   </c:when>
                                   <c:otherwise>                                                    
                                       <input type="text" placeholder="Select Area Code" class="form-control" id="areaCode" readonly="" name="areaCode" maxlength="40" value=""  onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                       <input type="hidden" placeholder="Select Property Code" class="form-control d-none" id="assetCode" readonly="" name="assetCode" maxlength="40" value="">
                                       <!--<input type="text" name="assetCode" id="assetCode" value="">-->
                                   </c:otherwise>        
</c:choose> --%>
                                        
<!--                                        <input type="hidden" placeholder="Select Property Code" class="form-control d-none" id="assetCode" readonly="" name="assetCode" maxlength="40" value="">-->
                                                            <c:choose>
                                                                <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                                 <c:forEach items="${AreaManagementlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" placeholder="Select Area Code" class="form-control" id="areaCode" readonly="" name="areaCode" maxlength="40" value="${list.areaCode}">
                                                                            <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" placeholder="Select Area Code" class="form-control" id="areaCode" readonly="" name="areaCode" maxlength="40" value="${list.areaCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                 </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Select Area Code" class="form-control" id="areaCode" readonly="" name="areaCode" maxlength="40" value=""  onclick="return selectAssetDetails();" onchange="return changeFloor();" onblur="return changeFloor();">
                                                                </c:otherwise>        
                                                            </c:choose>    
                                                            <label class="control-label">Area Code  <a style="color:red;">*</a></label>

                                                    </div>

                                    <div class="col-md-4 form-floating mb-3">
                                    
                                                            <c:choose>
                                                                <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                                 <c:forEach items="${AreaManagementlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetCode" readonly="" name="assetCode" maxlength="40" value="${list.assetCode}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                            <input type="hidden" id="assetType1" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetCode" readonly="" name="assetCode" maxlength="40" value="${list.assetCode}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                            <input type="hidden" id="assetType1" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                 </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetCode" readonly="" name="assetCode" maxlength="40" value="${assetCode}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                    <input type="hidden" id="assetType1" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                        <label class="control-label">Property Code<a style="color:red;">*</a>
                                                        </label>
                                    </div>

                                    <div class="col-md-4 form-floating mb-3">


                                        <%--   <c:choose>
                                   <c:when test="${fn:length(AreaManagementlist) > 0}">
                                       <c:forEach items="${AreaManagementlist}" var="list">
                                           <c:choose>
                                               <c:when test="${action eq 'edit'}">
                                                   <input type="text" class="form-control" ${mand_status_2} readonly="" id="assetName" name="assetName" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                   <input type="hidden" id="assetType" value="${assetType}">
                                                   <input type="hidden" name="assetCode" id="assetCode" value="">
                                               </c:when>
                                               <c:otherwise>
                                                   <input type="text" class="form-control" ${mand_status_2} readonly="" id="assetName" name="assetName" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                               </c:otherwise> 
                                           </c:choose>
                                       </c:forEach>
                                   </c:when>
                                   <c:otherwise>
                                       <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                       <input type="hidden" id="assetType1" value="">
                                       <!--<input type="hidden" name="assetCode" id="assetCode" value="">-->
                                   </c:otherwise>        
</c:choose> --%>
                                        
                                                              <c:choose>
                                                                <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                                 <c:forEach items="${AreaManagementlist}" var="list">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                            <input type="hidden" id="assetType1" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                            <input type="hidden" id="assetType1" value="">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                 </c:forEach>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                    <input type="hidden" id="assetType1" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                        <label class="control-label">Property Name<a style="color:red;">*</a>
                                                        </label>



                                                    </div>


                                    <div class="col-md-4 form-floating mb-3">


                                        <%--      <c:choose>
                                            <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                <c:forEach items="${AreaManagementlist}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" ${mand_status_3} readonly="" id="floor" name="floor1"  maxlength="40" value="${list.floor}" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                            <input type="hidden" class="form-control"  id="SNo" value="${list.sno}" onkeypress="return isNumberKey4(event)" autocomplete="off">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" ${mand_status_3} readonly="" id="floor" name="floor1"  maxlength="40" value="${list.floor}" readonly="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
<!--                                                        <input type="text" placeholder="Fill" class="form-control" ${mand_status_3} id="floor"  maxlength="40" value="" onkeypress="return isNumberKey3(event)">-->
                                                <select id="floor"  class="form-control">
                                                    <option value="" disabled selected>Select your option</option>
                                                </select>
                                                <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                                <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                                <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                                <input type="hidden" id="subCode1" value="">
                                            </c:otherwise>        
</c:choose> --%>
                                        <select id="floor" name="floor"  class="form-control">
                                            <option value="" disabled selected>Select your option</option>
                                        </select>
                                        <input type="hidden" id="noOfFloors" value="" onfocus="return changeFloor();">
                                        <input type="hidden" id="mezzanineFloor" value="Y" onfocus="return changeFloor();">
                                        <input type="hidden" id="basement" value="Y" onfocus="return changeFloor();">
                                        <input type="hidden" id="subCode1" value="">
                                        <label class="control-label">Floor

                                            <a style="color:red;">*</a>

                                        </label>


                                    </div>

                                    <div class="col-md-4 form-floating mb-3">
                                        <%--  <c:choose>
                                            <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                 <c:forEach items="${AreaManagementlist}" var="list">
                                                <c:choose>
                                                    <c:when test="${action eq 'edit'}">
                                                        <input type="text" class="form-control" name="totalLandArea" id="totalLandArea" onkeypress="return isNumberKey(event)" value="${list.totalLandArea}" required="">
                                                        <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                        <input type="hidden" name="status" value="${list.status}">
                                                        <input type="hidden" id="sSavesnoedu" name="sSavesnoedu" value="">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" name="totalLandArea" id="totalLandArea" readonly="" onkeypress="return isNumberKey(event)" value="${list.totalLandArea}" required="">
                                                    </c:otherwise> 
                                                </c:choose>
                                                 </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" placeholder="Fill"  class="form-control" id="totalLandArea"  maxlength="20" name="totalLandArea" value="" onkeypress="return isNumberKey(event)">
                                            </c:otherwise>        
</c:choose> --%>
                                        <input type="text" placeholder="Fill"  class="form-control" id="totalLandArea"  maxlength="20" name="totalLandArea" value="" onkeypress="return isNumberKey(event)">
                                        <label class="control-label">Total Land Area (SQM)<a style="color:red;">*</a>
                                        </label>

                                    </div>

                                    <div class="col-md-4 form-floating mb-3">
                                        <%-- <c:choose>
                                               <c:when test="${fn:length(AreaManagementlist) > 0}">
                                               <c:forEach items="${AreaManagementlist}" var="list">
                                                   <c:choose>
                                                       <c:when test="${action eq 'edit'}">
                                                           <input type="text" class="form-control" name="builtUpArea" id="builtUpArea" value="${list.builtUpArea}" onkeypress="return isNumberKey(event)" required="">
                                                           <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                           <input type="hidden" name="status" value="${list.status}">
                                                           <input type="hidden" id="sSavesnoedu" name="sSavesnoedu" value="">
                                                       </c:when>
                                                       <c:otherwise>
                                                           <input type="text" class="form-control" name="builtUpArea" id="builtUpArea" readonly="" value="${list.builtUpArea}" onkeypress="return isNumberKey(event)" required="">
                                                       </c:otherwise> 
                                                   </c:choose>
                                               </c:forEach>
                                               </c:when>
                                               <c:otherwise>                                                    
                                                   <input type="text" placeholder="Fill"  class="form-control" id="builtUpArea"  maxlength="20" name="builtUpArea" value="" onkeypress="return isNumberKey(event)">
                                               </c:otherwise>        
</c:choose> --%>
                                        <input type="text" placeholder="Fill"  class="form-control" id="builtUpArea"  maxlength="20" name="builtUpArea" value="" onkeypress="return isNumberKey(event)">       
                                        <label class="control-label">Built Up Area (SQM)<a style="color:red;">*</a>
                                        </label>

                                    </div>


                                    <div class="col-md-4 form-floating mb-3">
                                        <%--   <c:choose>
                                                   <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                   <c:forEach items="${AreaManagementlist}" var="list">
                                                       <c:choose>
                                                           <c:when test="${action eq 'edit'}">
                                                               <input type="text" class="form-control"  name="commonArea" id="commonArea" value="${list.commonArea}" onkeypress="return isNumberKey(event)" required="">
                                                               <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                               <input type="hidden" name="status" value="${list.status}">
                                                               <input type="hidden" id="sSavesnoedu" name="sSavesnoedu" value="">
                                                           </c:when>
                                                           <c:otherwise>
                                                               <input type="text" class="form-control"  name="commonArea" id="commonArea" value="${list.commonArea}" readonly="" onkeypress="return isNumberKey(event)" required="">
                                                           </c:otherwise> 
                                                       </c:choose>
                                                   </c:forEach>
                                                   </c:when>
                                                   <c:otherwise>                                                    
                                                       <input type="text" placeholder="Fill"  class="form-control" id="commonArea"  maxlength="20" name="commonArea" value="" onkeypress="return isNumberKey(event)">
                                                   </c:otherwise>        
</c:choose>--%>
                                        <input type="text" placeholder="Fill"  class="form-control" id="commonArea"  maxlength="20" name="commonArea" value="" onkeypress="return isNumberKey(event)">       
                                        <label class="control-label">Common Area (SQM)<a style="color:red;">*</a>
                                        </label>

                                    </div>


                                    <div class="col-md-4 form-floating mb-3">
                                        <%--   <c:choose>
                                                   <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                    <c:forEach items="${AreaManagementlist}" var="list">
                                                       <c:choose>
                                                           <c:when test="${action eq 'edit'}">
                                                               <input type="text" class="form-control"  name="totalRentalArea" id="totalRentalArea" value="${list.totalRentalArea}" onkeypress="return isNumberKey(event)" required="">
                                                               <input type="hidden" id="SNo" name="SNo" value="${list.sno}">
                                                               <input type="hidden" name="status" value="${list.status}">
                                                               <input type="hidden" id="sSavesnoedu" name="sSavesnoedu" value="">
                                                           </c:when>
                                                           <c:otherwise>
                                                               <input type="text" class="form-control"  name="totalRentalArea" id="totalRentalArea" value="${list.totalRentalArea}" onkeypress="return isNumberKey(event)" readonly="" required="">
                                                           </c:otherwise> 
                                                       </c:choose>
                                                    </c:forEach>
                                                   </c:when>
                                                   <c:otherwise>                                                    
                                                       <input type="text" placeholder="Fill"  class="form-control" id="totalRentalArea"  maxlength="20" name="totalRentalArea" value="" onkeypress="return isNumberKey(event)">
                                                   </c:otherwise>        
</c:choose> --%>
                                        <input type="text" placeholder="Fill"  class="form-control" id="totalRentalArea"  maxlength="20" name="totalRentalArea" value="" onkeypress="return isNumberKey(event)">       
                                        <label class="control-label">Total Rental Area (SQM)<a style="color:red;">*</a>
                                        </label>

                                    </div>
                                    <div class="col-md-4 form-floating mb-3">
                                        <%--   <c:choose>
                                                <c:when test="${fn:length(AreaManagementlist) > 0}">
                                                 <c:forEach items="${AreaManagementlist}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" class="form-control" placeholder="Fill"  name="floorDetails" id="units" name="units" value="${list.units}" value="" onkeypress="return isNumberKey(event)" required="">
                                                            
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" placeholder="Fill"  name="floorDetails" id="units" name="units" value="${list.units}" value="" onkeypress="return isNumberKey(event)" readonly="" required="">
                                                            
                                                        </c:otherwise> 
                                                    </c:choose>
                                                 </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Fill"  class="form-control" id="units"  maxlength="20" name="units" value="" onkeypress="return isNumberKey(event)">
                                                    <input type="hidden" placeholder="Fill"  class="form-control" id="assetCode"  maxlength="20" name="assetCode" value="" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
</c:choose> --%>
                                        <input type="text" placeholder="Fill"  class="form-control" id="units"  maxlength="20" name="units" value="" onkeypress="return isNumberKey(event)">
                                        <input type="hidden" placeholder="Fill"  class="form-control" id="assetCode"  maxlength="20" name="assetCode" value="" onkeypress="return isNumberKey(event)">       
                                        <label class="control-label">Units<a style="color:red;">*</a>
                                        </label>

                                    </div>

                                    <c:if test="${action ne 'view'}">
                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group my-4">
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <button type="button" class="btn btn-primary" style="" onclick="addOrderRow_test(event);"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                            </div>
                                        </div>

                                    </c:if>

                                    <div class="clearfix"></div>

                                    <c:if test="${action ne 'view' && action ne 'edit'}">

                                        <div class="table-responsive mb-3" >

                                            <table  class="table table-bordered" id="membertable" style="width: 1600px;">
                                                <thead>
                                                    <tr>
                                                        <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                        <th>Floor</th>
                                                        
                                                        <th><span style="color:red">*</span>Total Land Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Built Up Area (SQM)</th>
                                                        <th><span style="color:red">*</span>Common Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Total Rental Area (SQM)</th>
                                                        <th><span style="color:red">*</span> Units</th>
                                                    </tr>

                                                </thead>
                                                <tbody id="resourcetable">

                                                </tbody>
                                                <script>
                                                    var count = 0;
                                                    function addOrderRow_test(event) {
                                                        event.preventDefault();

                                                        var valid1 = true;
                                                        var x = document.getElementById('areaCode').value &&
                                                                document.getElementById('assetCode').value &&
                                                                document.getElementById('assetName').value &&
                                                                document.getElementById('totalLandArea').value &&
                                                                document.getElementById('builtUpArea').value &&
                                                                document.getElementById('commonArea').value &&
                                                                document.getElementById('units').value &&
                                                                document.getElementById('totalRentalArea').value;
                                                        if (x == "" || x == null)
                                                        {
                                                            alert("Please Select Mandatory Fields");
                                                            valid1 = false;
                                                        }



                                                        if (valid1 == true) {
                                                            document.getElementById('areaCode').removeAttribute('onclick');

                                                            var areaCode = document.getElementById('areaCode').value;
                                                             var assetCode = document.getElementById('assetCode').value;
                                                            var assetName = document.getElementById('assetName').value;
                                                            var totalLandArea = document.getElementById('totalLandArea').value;
                                                            var builtUpArea = document.getElementById('builtUpArea').value;
                                                            var commonArea = document.getElementById('commonArea').value;
                                                            var totalRentalArea = document.getElementById('totalRentalArea').value;
                                                           // var assetCode = document.getElementById('assetCode').value;
                                                            var units = document.getElementById('units').value;
                                                            var table = document.getElementById("resourcetable");
                                                            var floor = document.getElementById("floor").value;
                                                            debugger
                                                            $('#resourcetable tr').each(function () {
                                                                var a = $(this).find('#floorGrid').val();
                                                                if (a == floor) {
                                                                    alert('Floor Name Is Already Added');
                                                                    document.getElementById('td').value = "";
                                                                    return false;
                                                                } else {
                                                                    return true;
                                                                }
                                                            })

                                                            var slNo = table.rows.length - 1;
                                                            var slNo1 = table.rows.length;
                                                            var id1 = slNo1;
                                                            var tr = table.insertRow(slNo + 1);
                                                            tr.id = 'list_tr_' + slNo;
                                                            tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                    + slNo + ')" ></button> </td>' +
                                                                    '<td ><input class="form-control "  id="floorGrid" type="text" readonly name="floor1" value="' + floor +
                                                                    '" ></td><td><input class="form-control "  type="text"readonly name="totalLandArea1" value="' + totalLandArea +
                                                                    '" style="border: none"></td><td><input class="form-control "  type="text"readonly name="builtUpArea1" value="' + builtUpArea +
                                                                    '" style="border: none"></td><td><input class="form-control " type="text"readonly name="commonArea1" value="' + commonArea +
                                                                    '" style="border: none"></td><td><input class="form-control "  type="text" readonly name="totalRentalArea1" value="' + totalRentalArea +
                                                                    '" style="border: none"></td><td><input class="form-control " type="text" readonly name="units1" value="' + units +
                                                                    '" style="border: none"></td>';
                                                            count++;

                                                            document.getElementById('totalLandArea').value = "";
                                                            document.getElementById('builtUpArea').value = "";
                                                            document.getElementById('commonArea').value = "";
                                                            document.getElementById('totalRentalArea').value = "";
                                                            document.getElementById('units').value = "";


                                                        } else {
                                                            return;
                                                        }

                                                        document.getElementById('assetCode').disabled = false;
                                                    }

                                                    function removeRow(id) {
                                                        count--;
                                                        var table = document.getElementById("resourcetable");
                                                        for (var i = 0; i < table.rows.length; i++) {
                                                            var lr = table.rows[i];
                                                            if (lr.id == 'list_tr_' + id) {
                                                                table.deleteRow(i);
                                                                return;
                                                            }
                                                        }
                                                    }
                                                    function checkGrid() {
                                                        var table = document.getElementById("resourcetable");
                                                        var slNo = table.rows.length - 1;
                                                        if (slNo < 0) {
                                                            alert("Please add data in grid");
                                                            $("#subAssetName").focus();
                                                            $("#floor").focus();
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

                                        <div class="table-responsive mb-3" >

                                            <table  class="table table-bordered" id="membertable" style="width: 1600px;">
                                                <thead>
                                                    <tr>

                                                        <th>Floor</th>
                                                      
                                                        <th><span style="color:red">*</span>Total Land Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Built Up Area (SQM)</th>
                                                        <th><span style="color:red">*</span>Common Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Total Rental Area (SQM)</th>
                                                        <th><span style="color:red">*</span> Units</th>
                                                    </tr>

                                                </thead>
                                                <tbody id="resourcetable">
                                                    <c:forEach items="${areaManagementId}" var="list">
                                                        <tr class="wrk">
                                                            
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="floor11" id="floor11" type="text" value="${list.floor}" >
                                                            </td> 

                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="areaCode11" id="areaCode11" type="text" value="${list.totalLandArea}" >
                                                            </td> 
                                                             <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="assetCode11" id="assetCode11" type="text" value="${list.builtUpArea}" >
                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="assetName11" id="assetName11" type="text" value="${list.commonArea}" >

                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="totalLandArea11" id="totalLandArea11" type="text" value="${list.totalRentalArea}" >
                                                            </td>
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="builtUpArea11" id="builtUpArea11" type="text" value="${list.units}" >
                                                            </td>
<!--                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="commonArea11" id="commonArea11" type="text" value="${list.commonArea}" >
                                                            </td>
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="totalRentalArea11" id="totalRentalArea11" type="text" value="${list.totalRentalArea}" >
                                                            </td>

                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="units11" id="units11" type="text" value="${list.units}" >
                                                            </td>-->

                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>       
                                    </c:if>

                                    <c:if test="${action eq 'edit'}">

                                        <div class="table-responsive mb-3" >

                                            <table  class="table table-bordered" id="membertable" style="width: 1600px;">
                                                <thead>
                                                    <tr>

                                                        <th>Floor</th>
                                                    
                                                        <th><span style="color:red">*</span>Total Land Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Built Up Area (SQM)</th>
                                                        <th><span style="color:red">*</span>Common Area (SQM)</th>

                                                        <th><span style="color:red">*</span> Total Rental Area (SQM)</th>
                                                        <th><span style="color:red">*</span> Units</th>
                                                    </tr>

                                                </thead>
                                                <tbody id="resourcetable">
                                                    <c:forEach items="${areaManagementId}" var="list">
                                                        <tr class="wrk">
                                                            
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"  readonly="" autocomplete="off" name="floor1" id="floor11" type="text" value="${list.floor}" >
                                                            </td> 

                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"   autocomplete="off" name="totalLandArea1" id="totalLandArea1" type="text" value="${list.totalLandArea}" >
                                                            </td> 
                                                             <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"   autocomplete="off" name="builtUpArea1" id="builtUpArea1" type="text" value="${list.builtUpArea}" >
                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"   autocomplete="off" name="commonArea1" id="commonArea1" type="text" value="${list.commonArea}" >

                                                            </td> 
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"   autocomplete="off" name="totalRentalArea1" id="totalRentalArea1" type="text" value="${list.totalRentalArea}" >
                                                            </td>
                                                            <td>
                                                                <input class="form-control validate[required]" style="width: 100%;"   autocomplete="off" name="units1" id="units1" type="text" value="${list.units}" >
                                                            </td>

                                                        </tr>

                                                    </c:forEach>
                                                </tbody>
                                            </table>

                                        </div>       
                                    </c:if>


                                    <c:if test="${action ne 'view'}">

                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../assets/areaManagementList.htm" class="btn btn-danger">Cancel</a>
                                        </div>

                                    </c:if>
                                    <c:if test="${action eq 'view'}">

                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                            <a href="../assets/areaManagementList.htm" class="btn btn-danger">Cancel</a>
                                        </div>

                                    </c:if>
                                </form>
                            </div>

                        </div>
                    </div>
            </section>

        </main><!-- End #main -->

        <script>
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }




            function changeFloor() {
                var fld = document.getElementById('noOfFloors').value;
                var mezzanineFloor1 = document.getElementById('mezzanineFloor').value;
                var basement3 = document.getElementById('basement').value;
                var basement5 = document.getElementById('basement').value;



                if (mezzanineFloor1 == 'Y' || basement3 == 'Y' || basement5 == 'Y') {

                    var basement4 = "Basement 1";
                    var basement6 = "Basement 2";
                    var mezzanineFloor2 = "Mezzanine Floor";
                }
//                
                $("#floor").empty();
                var x = document.getElementById("floor");
                var option = document.createElement("option");
                var floor1 = new Option(mezzanineFloor2, mezzanineFloor2);
                var floor2 = new Option(basement4, basement4);
                var floor3 = new Option(basement6, basement6);

//                var floors = ["Ground Floor", "1ST Floor", "2ND Floor", "3RD Floor", "4TH Floor", "5TH Floor", "6TH Floor", "7TH Floor", "8TH Floor", "9TH Floor", "10TH Floor", "11TH Floor", "12TH Floor", "13TH Floor", "14TH Floor", "15TH Floor", "16TH Floor", "17TH Floor", "18TH Floor", "19TH Floor", "20TH Floor", "21ST Floor"];
//                for (var i = 0; i < fld; i++) {
//                    var floor = new Option(floors[i], floors[i]);
//                    x.options.add(floor);
                if (mezzanineFloor1 == 'Y' || basement3 == 'Y' || basement5 == 'Y') {

                    x.options.add(floor2);
                    x.options.add(floor3);
                    x.options.add(floor1);
                }
                var floors = ["Ground Floor", "1st Floor", "2nd Floor", "3rd Floor", "4th Floor", "5th Floor", "6th Floor", "7th Floor", "8th Floor", "9th Floor", "10th Floor", "11th Floor", "12th Floor", "13th Floor", "14th Floor", "15th Floor", "16th Floor", "17th Floor", "18thFloor", "19th Floor", "20th Floor", "21th Floor"];
                for (var i = 0; i < fld; i++) {
                    var floor = new Option(floors[i], floors[i]);
                    x.options.add(floor);
                }
// assetType();
            }
        </script>
        <script src="../common/theme/js/custom.js"></script>
    </body>

</html>