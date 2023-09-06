<%-- 
    Document   : form1
    Created on : Feb 23, 2016, 3:24:29 PM
    Author     : Sudhanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>


        <title>arête Assets Management</title>
    </head>
    <script>


        $(document).ready(function () {
            $('#phyQty').bind("cut copy paste", function (e) {
                e.preventDefault();
            });
        });

        var myWindow = null;
        function openWin1()
        {

            var type1 = document.getElementById('storeLocation').value;
            //(type1);
            myWindow = window.open("../quality/selectInventoryCount.htm?prcode=" + type1 + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            $("#batchNo").val('');
            $("#availQty").val('');
            $("#expiryDate").val('');

        }


        function batchNumber1() {
            $('#expiryDate').val('');
            $('#availQty').val('');
            $('#phyQty').val('');
            $('#varianceQty').val('');
            var itemCode = document.getElementById("itemCode").value;
            var fromLocation = document.getElementById("storeLocation").value;

            $.ajax
                    ({
                        type: "POST",
                        url: '../quality/getBatchNo.htm',
                        data: {
                            itemCode: itemCode,
                            fromLocation: fromLocation


                        },
                        success: function (data) {
                            //alert(data);
                            var c = data.split(",");
                            displayName1(data);

                            $('#batchNo').val(data);
                        }
                    });
        }


        function displayName1(data)
        {
            if (data !== null)
            {

                $('#batchNo').html("");

                var nameArray = data.split(",");
                var toAppend = '';


                for (var i = 0; i < nameArray.length - 1; i++) {
                    var nameArray1 = nameArray[i].split("/");
                    toAppend += '<option value=' + nameArray[i] + '>' + nameArray1[0] + '</option>';
                }
                $('#batchNo').append(toAppend);

            }
            else {
                alert("error");
            }

        }

        function stock(val1) {
            var batchvalue = val1.split("/");
//            alert(batchvalue);
            $('#expiryDate').val(moment(batchvalue[1]).format('DD-MMM-YYYY'));
            $('#expiryDate1').val(batchvalue[1]);
            $('#availQty').val(parseFloat(batchvalue[2]).toFixed(3));
            $('#unitPrice').val(batchvalue[3]);


        }


        function isNumberKey(evt)
        {
            debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                return false;
            }
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;

//            var charCode = (evt.which) ? evt.which : event.keyCode
//            if (charCode >= 31 && (charCode < 48 || charCode > 57))
//                return false;
//            return true;


        }


        function checkGrid() {

            var table = document.getElementById("resourcetable");
            var length = table.rows.length;
            if (length <= 0) {
                alert("Add data into the grid!");
                return false;
            }
            return true;

        }




        function test1()
        {
            var sum = 0;
            var x = document.getElementById('availQty').value;
            var y = document.getElementById('phyQty').value;
            sum = parseFloat(y) - parseFloat(x);
            if (isNaN(sum) == true) {
                sum = 0;
            }
            if (sum > 0) {
                document.getElementById('varianceQty').value = "+" + sum.toFixed(3);
            } else {
                document.getElementById('varianceQty').value = sum.toFixed(3);
            }


        }


        function clearForm() {
            $('#itemCode').val('');
            $('#itemName').val('');
            $('#batchNo').empty();
            $('#expiryDate').val('');
            $('#uom').val('');
            $('#availQty').val('');
            $('#varianceQty').val('');
            $('#phyQty').val('');
            $('#unitPrice').val('');
        }
    </script>

    <body class="nav-md">

        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Stock Adjustment&tab=Stock Adjustment&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Stock Adjustment</h5>
                                                </div>


                                    <form class="form-inline row" action="../quality/inventoryCountFormSubmit.htm" method="post" id="imForm" onsubmit="return checkGrid();">
                                        <%--<c:forEach items="${damagedlist}" var="type">
                                            <c:forEach items="${item}" var="item">
                                                dskdsjdk
                                                <c:if test="${type.itemCode eq item.itemCode}">
                                                    <c:set var="itemDesc" value="${item.itemDesc}"/>
                                                </c:if>
                                            </c:forEach>
</c:forEach>--%>

<!--                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red">*</span> Store Location</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" readonly id="storeLocation" name="storeLocation" type="text" value="${type.storeLocationName}" maxlength="80">
                                                                <input name="sno" type="hidden" value="${type.SNo}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input class="form-control" readonly id="storeLocation" name="storeLocation" type="text" value="${type.storeLocationName}">

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${not empty storeName}">
                                                        <input class="form-control" readonly="" id="storeLocation" name="storeLocation" type="text" value="${storeName}" maxlength="80">
                                                    </c:if>
                                                    <input class="form-control"  readonly="" type="hidden" value="<%=session.getAttribute("orgId").toString()%>" maxlength="80">
                                                    <input class="form-control" id="storeLocation" autocomplete="off" type="text" name="storeLocation" value="" maxlength="80">
                                                    <c:if test="${empty storeName}">
                                                        <select id="storeLocation" name="storeLocation" class="form-control validate[required]" onchange="clearForm();" >
                                                            <option selected value="">Choose option</option>
                                                            <c:forEach items="${store1}" var="list">

                                                                <option value="${list.storeName}">${list.storeName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>-->

                                        <div class="col-md-4 form-floating mb-3">
                                         

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="itemCode"  name="itemCode" type="text" value="${type.itemCode}" maxlength="80"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="itemCode" id="itemCode" type="text" value="${type.itemCode}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" autocomplete="off"  readonly="" id="itemCode" name="itemCode"  type="text" value="" maxlength="80" onclick="openWin1();">
                                                    <!--<input id="unitPrice"  name="unitPrice" value="" type="hidden">-->
                                                    <input type="hidden" name="division" value="<%=session.getAttribute("orgCode").toString()%>">
                                                </c:otherwise>        
                                            </c:choose>
                                                       <label class="control-label"><span style="color: red">*</span> Item Code</label>
                                        </div>

                                        <div class="col-md-4 form-floating mb-3">
                                        

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="itemName" name="itemName" type="text" value="${type.itemName}" maxlength="120"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control validate[required]" readonly name="itemName" id="itemName" type="text" value="${type.itemName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                               
                                                        <input class="form-control" id="itemName"  placeholder="Click to select items" name="itemName" readonly="" autocomplete="off" placeholder=""  type="text" value="" maxlength="120">
<!--                                                    <div style="float: right;"><button type="button" class="btn btn-group" style="float:right; margin-top: 1px;font-size: 10px;" onclick="batchNumber1();">Batch No</button></div>-->


                                                </c:otherwise>        
                                            </c:choose>
    <label class="control-label"><span style="color: red">*</span> Item Name</label>
                                        </div>
                                       
   <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control " autocomplete="off" id="uom" name="uom" type="text" value="${type.uom}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="uom" id="uom" type="text" value="${type.uom}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="uom" name="uom" placeholder="" autocomplete="off"  type="text" value="" maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
 <label class="control-label"><span style="color: red">*</span> UOM</label>
                                        </div>
   <div class="col-md-4 form-floating mb-3">
                                        

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control " autocomplete="off" id="store" name="store" type="text" value="${type.uom}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="store" id="store" type="text" value="${type.uom}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="store" name="store" placeholder="" autocomplete="off"  type="text" value="" maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
    <label class="control-label"><span style="color: red">*</span> Store</label>
                                        </div>
 <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Click to select items" autocomplete="off" id="availQty" name="availQty" type="text" value="${type.availableStock}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="availQty" id="availQty" type="text" value="${type.availableStock}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="availQty" name="availQty"  autocomplete="off"  type="text" value="" maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
 <label class="control-label"><span style="color: red">*</span>Available Stock</label>
                                        </div>
 <div class="col-md-4 form-floating mb-3">
                                         

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Click to select items" autocomplete="off" id="phystock" name="phystock" type="text" value="${type.availableStock}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="phystock" id="phystock" type="text" value="${type.availableStock}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="phystock" name="phystock"  autocomplete="off"  type="text" value="" maxlength="10">
                                                </c:otherwise>        
                                            </c:choose>
   <label class="control-label"><span style="color: red">*</span>Total Physical Stock</label>
                                        </div>
      <div class="col-md-4 form-floating mb-3">
                                          

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" placeholder="Click to select items" autocomplete="off" id="phyQtyDate" name="phyQtyDate" type="text" value="${type.physicalCountDate}" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="phyQtyDate" id="phyQtyDate" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.physicalCountDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="phyQtyDate" name="phyQtyDate" readonly=""  type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="<%=new java.util.Date()%>"/>" maxlength="50" onclick="NewCssCal('phyQtyDate', 'ddMMMyyyy', '', '', '', '', '');">
                                                </c:otherwise>        
                                            </c:choose>
  <label class="control-label"><span style="color: red">*</span> Physical Count Date</label>
                                        </div>
   <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red"></span> Adjust Stock</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[custom[required,onlyLetterSp]]" placeholder="Click to select items" readonly autocomplete="off" id="itemDesc" name="itemDesc" type="text" value="" maxlength="30"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${item}" var="item">
                                                                    <c:if test="${type.itemCode eq item.itemCode}">
                                                                        <c:set var="itemDesc" value="${item.itemDesc}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <input class="form-control" readonly name="itemDesc" id="itemDesc" type="text" value="${itemDesc}">

                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" id="itemDesc" placeholder="Click to select items" readonly="" autocomplete="off" name="itemDesc" type="text" value="" maxlength="30">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red"></span> Adjust Stock Reason</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[custom[required,onlyLetterSp]]" placeholder="Click to select items" readonly autocomplete="off" id="itemDesc" name="itemDesc" type="text" value="" maxlength="30"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${item}" var="item">
                                                                    <c:if test="${type.itemCode eq item.itemCode}">
                                                                        <c:set var="itemDesc" value="${item.itemDesc}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <input class="form-control" readonly name="itemDesc" id="itemDesc" type="text" value="${itemDesc}">

                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" id="itemDesc" placeholder="Click to select items" readonly="" autocomplete="off" name="itemDesc" type="text" value="" maxlength="30">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>




<!--                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red">*</span> Batch No</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="batchNo" name="batchNo" type="text" value="${type.batchNo}" maxlength="30"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="batchNo" id="batchNo" type="text" value="${type.batchNo}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>     
                                                    
                                                       <input class="form-control" readonly name="batchNo" id="batchNo" type="text" value="">
                                                    <select id="batchNo" name="batchNo" class="form-control validate[required]" onchange="stock(this.value);" >
                                                        <option value="">Click Batch No Button</option>
                                                    </select>


                                                    <input class="form-control" id="batchNo" autocomplete="off" name="batchNo" type="text" value="" maxlength="30">
                                                </c:otherwise>        
                                            </c:choose>


                                        </div>-->

<!--    
                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red">*</span> Unit Price</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="unitPrice" name="unitPrice" type="text" value="<fmt:formatNumber value="${type.unitPrice}" pattern="0.000"/>"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="unitPrice" id="unitPrice" type="text" value="<fmt:formatNumber value="${type.unitPrice}" pattern="0.000"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" id="unitPrice" name="unitPrice" autocomplete="off" type="text" value="">

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                       
                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red">*</span> Physical Qty</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="phyQty" name="phyQty" type="text" value="${type.physicalCountQty}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="phyQty" id="phyQty" type="text" value="${type.physicalCountQty}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" id="phyQty" name="phyQty" autocomplete="off" type="text" value="" maxlength="10" onkeypress=" return isNumberKey(event);" onkeyup="test1();">
                                                    <input class="form-control" readonly name="subCategory" id="subCategory" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>



                                  

                                        <div class="col-md-4 form-floating mb-3">
                                            <label class="control-label"><span style="color: red">*</span> Variance Qty</label>

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" id="varianceQty" name="varianceQty" type="text" value="${type.varianceQty}" maxlength="10"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="varianceQty" id="varianceQty" type="text" value="${type.varianceQty}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" id="varianceQty" readonly="" name="varianceQty" autocomplete="off" type="text" value="" maxlength="10" onkeypress=" return isNumberKey(event);">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>-->
                                      
                                        <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" autocomplete="off" placeholder="Click to select items" id="user" name="user" type="text" value="${type.preparedBy}" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="user" id="user" type="text" value="${type.preparedBy}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>

                                                    <input class="form-control validate[required]" placeholder="Click to select items" id="user"  name="user" autocomplete="off" readonly=""  type="text" value="<%=session.getAttribute("userId")%>" maxlength="50">

                                                </c:otherwise>        
                                            </c:choose>
 <label class="control-label"><span style="color: red">*</span> Created By</label>
                                        </div>
 <div class="col-md-4 form-floating mb-3">
                                           

                                            <c:choose>
                                                <c:when test="${fn:length(inventrylist) > 0}">
                                                    <c:forEach items="${inventrylist}" var="type">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control " autocomplete="off" id="expiryDate" name="expiryDate" type="text" value="${type.expiryDate}" maxlength="50"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly name="expiryDate" id="expiryDate" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.expiryDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" id="expiryDate" placeholder="Click to select items" readonly=""  type="text" name="expiryDate" maxlength="50" onclick="NewCssCal('expiryDate', 'ddMMMyyyy', '', '', '', '', '');">
                                                 
                                                </c:otherwise>        
                                            </c:choose>
 <label class="control-label"><span style="color: red">*</span> Creation Date</label>
                                        </div>
                                        <p>&nbsp;</p>

                           <div class="col-md-12 mb-3">
                                <label class="control-label">Total Available Stock</label>
                                <button class="btn btn-primary ms-4">Available Stock - Adjust Stock</button>
                           </div>
                                        
                                        <div class="col-md-12">
                                             <h5>Stock Adjustment History</h5>
                                                <table class="table table-bordered my-4">
                                                <thead>
                                                    <tr>
                                                        <th>Creation Date</th>
                                                        <th>Creation By</th>
                                                        <th>Available Stock</th>
                                                        <th>Adjust Stock</th>
                                                        <th>Reason</th>
                                                        <th>Total Available Stock</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>



                                        <%--<c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                    <button type="button" class="btn btn-primary" style="" onclick="addToGrid();">ADD</button>

                                                </div>
                                            </div>



                                            <div class="clearfix"></div>


                                            <div style="overflow: scroll;height: 200px;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table id="example" class="table table-striped responsive-utilities">
                                                    <thead>
                                                        <tr>

                                                            <th style="background:#425567;color:#fff;">Item Code</th>
                                                            <th style="background:#425567;color:#fff;">Item Name</th>
                                                            <th style="background:#425567;color:#fff;">Batch No</th>
                                                            <th style="background:#425567;color:#fff;">Expiry Date</th>
                                                            <th style="background:#425567;color:#fff;">Uom</th>
                                                            <th style="background:#425567;color:#fff;">Available Stock</th>
                                                            <th style="background:#425567;color:#fff;">Physical Count</th>
                                                            <th style="background:#425567;color:#fff;">Physical Count Date</th>
                                                            <th style="background:#425567;color:#fff;">Prepared By</th>


                                                        </tr>


                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 0;


                                                        function addToGrid() {

                                                            var x =
                                                                    document.getElementById('itemCode').value &&
                                                                    document.getElementById('itemName').value &&
                                                                    document.getElementById('batchNo').value &&
                                                                    document.getElementById('expiryDate').value &&
                                                                    document.getElementById('uom').value &&
                                                                    document.getElementById('availQty').value &&
                                                                    document.getElementById('phyQty').value &&
                                                                    document.getElementById('phyQtyDate').value &&
                                                                    document.getElementById('user').value;

                                                            if (x === null || x === "") {
                                                                alert("Mandatory Fields Should not be Empty");
                                                                return false;
                                                            }
                                                            else {
                                                                var location = document.getElementById("storeLocation").value;
                                                                var code = document.getElementById('itemCode').value;
                                                                var name = document.getElementById('itemName').value;
                                                                var batchNo = document.getElementById('batchNo').value;
                                                                var expiryDate = document.getElementById('expiryDate').value;
                                                                var uom = document.getElementById("uom").value;
                                                                var availQty = document.getElementById('availQty').value;
                                                                var phyQty = document.getElementById('phyQty').value;
                                                                var phyQtyDate = document.getElementById('phyQtyDate').value;
                                                                var user = document.getElementById('user').value;
                                                                var unitPrice = document.getElementById("unitPrice").value;




                                                                //var loc = location.split("/");
                                                                var cCode = code.split("/");
                                                                var cName = name.split("/");
                                                                var cbatchNo = batchNo.split("/");
                                                                var cexpiryDate = expiryDate.split("/");
                                                                var cuom = uom.split("/");
                                                                var cavailQty = availQty.split("/");
                                                                var cphyQty = phyQty.split("/");
                                                                var cphyQtyDate = phyQtyDate.split("/");
                                                                var cuser = user.split("/");
                                                                var cunitPrice = unitPrice.split("/");


                                                                for (var i = 0; i < cCode.length; i++) {
                                                                    
                                                                    $('#resourcetable tr').each(function () {
                                                                        $(this).find('td').each(function () {
                                                                            var a = $(this).find('#itemCode').val();
                                                                            var itmName = $(this).find('#itemName').val();

                                                                            if (itmName === cName[i]) {
                                                                                alert('Record already added to grid');
                                                                                document.getElementById('td').value = "";
                                                                                return false;
                                                                            } else {
                                                                                return true;
                                                                            }
                                                                        })
                                                                    })
                                                                    if (cCode[i] !== "")
                                                                    {



                                                                        var table = document.getElementById("resourcetable");

                                                                        var slNo = table.rows.length;
                                                                        var tr = table.insertRow(slNo);


                                                                        tr.id = 'list_tr_' + slNo;
                                                                        tr.innerHTML = '<td align="center" class="tinput"><button class="fa fa-trash" onclick="removeRow('
                                                                                + slNo + ')" style="border: none"></button> </td>' +'<td class="tinput"><input type="text" readonly name="itemCode" id="itemCode" value="' + cCode[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="itemName" id="itemName" value="' + cName[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="batchNo" value="' + cbatchNo[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="expiryDate" value="' + cexpiryDate[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="uom" value="' + cuom[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="availQty" value="' + cavailQty[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="phyQty" value="' + cphyQty[i] +
                                                                                '" style="border: none"></td><td class="tinput"><input type="text" readonly name="phyQtyDate" value="' + cphyQtyDate[i] +
                                                                                '" style="border: none"><input name="unitPrice" value="' + cunitPrice[i] + '" type="hidden"><input name="storeLocation" value="' + location + '" type="hidden"></td>\n\
                                                                                <td class="tinput"><input type="text" readonly name="user" value="' + cuser[i] + '" style="border: none"></td>';

                                                                        count++;



                                                                    }
                                                                }

                                                            }
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
                                                    </script>

                                                </table>
                                            </div>
</c:if>--%>

                                      


                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../quality/inventoryCountList.htm" class="btn btn-danger" style="">Cancel</a>
                                            </div>  
                                        </c:if>

                                    </form>

                               </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />

        <script>
            NProgress.done();

            $(document).ready(function () {

                jQuery("#imForm").validationEngine();
            });


        </script>

    </body>

</html>
