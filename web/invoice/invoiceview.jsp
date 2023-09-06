<%-- 
    Document   : invoiceview
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
--%>

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
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
        <title>arête Assets Management</title>       
        <style type="text/css">
            @media print
            {
                .prbtn{display:none;}
                /*.x_title{display:none;}*/
                .hdiv{display:none;}
                .mdiv{display:none;}

                .x_content { position: absolute; top: 20px; left: 10px; }
            }
        </style>

    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=GRN&tab=Invoice Screen&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Property Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />

                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group divs">
                                        <label class="control-label" style="padding-right: 20px;"> Supplier Code</label>
                                        <c:forEach var="type" items="${invDetails}" end="0">
                                            <input class="form-control" style="width: 208px;" readonly type="text" value="${type.supplierName}">
                                        </c:forEach>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group divpo">
                                        <label class="control-label" style="padding-right: 20px;"> PO No</label>
                                        <select class="form-control" style="width: 199px;" data-rel="chosen" id="pono" required name="pono" multiple="">
                                            <option></option>
                                            <c:forEach var="type" items="${distinctdetails}">
                                                <option>${type[2]}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12 form-group divgrn">
                                        <label class="control-label" style="padding-right: 20px;"> GRN No</label>
                                        <select class="form-control" style="width: 199px;" data-rel="chosen" id="grnno" required name="grnno" multiple="">
                                            <option></option>
                                            <c:forEach var="type" items="${distinctdetails}">
                                                <option>${type[1]}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <h5>Invoice Details</h5>
                                    <table id="example1" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                        <thead>
                                            <tr class="headings"> 
                                                <c:if test="${action eq 'print'}">
                                                    <th></th>  
                                                    </c:if>
                                                <th>S.No</th>       
                                                <th>PO No</th>
                                                <th>GRN No</th>
                                                <th>Document Type</th>
                                                <th>Document Ref</th>                                      
                                                <th>Document Date</th>                                      
                                                <th>Pay terms</th>                                      
                                            </tr>
                                        </thead>

                                        <tbody> 
                                            <c:set var="j" value="${0}"/>
                                            <c:forEach items="${distinctdetails}" var="type">
                                                <c:set var="j" value="${j+1}"/>
                                                <tr>
                                                    <c:if test="${action eq 'print'}">
                                                        <td class="center" ><input type="checkbox" id="selectitem" name="selectitem" value="selectitem"></td>
                                                        </c:if>
                                                    <td class="center" >${j}</td>
                                                    <td class="center" >${type[2]}</td>
                                                    <td class="center" >${type[1]}</td>
                                                    <td class="center" >${type[3]}</td>
                                                    <td class="center" >${type[4]}</td>
                                                    <fmt:parseDate value="${type[5]}" var="parsedEmpDate" pattern="yyyy-MM-dd" />
                                                    <td class="center" ><fmt:formatDate pattern="dd-MMM-yyyy" value="${parsedEmpDate}"/></td>
                                                    <td class="center" >${type[6]}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>

                                    </table>
                                    <h5>Item Details</h5>
                                    <table id="example1" class="table table-striped responsive-utilities jambo_table" style="overflow:scroll;">
                                        <thead>
                                            <tr class="headings">
                                                <c:if test="${action eq 'print'}">
                                                    <th></th> 
                                                    </c:if>
                                                <th>S.No</th>       
                                                <th>PO No</th>
                                                <th>GRN No</th>
                                                <th>Item name</th>
                                                <th>Unit price</th>                                      
                                                <th>GRN Qty</th>                                      
                                                <th>GRN Amount</th>                                      
                                            </tr>
                                        </thead>

                                        <tbody> 
                                            <c:set var="j" value="${0}"/>
                                            <c:set var="bAmt" value="0"/>
                                            <c:forEach items="${invDetails}" var="type">
                                                <c:set var="j" value="${j+1}"/>
                                                <tr>
                                                    <c:if test="${action eq 'print'}">
                                                        <td class="center" ><input type="checkbox" id="selectitem" name="selectitem" value="selectitem"></td>
                                                        </c:if>
                                                    <td class="center" >${j}</td>
                                                    <td class="center" >${type.poNo}</td>
                                                    <td class="center" >${type.grn}</td>
                                                    <td class="center" >${type.itemName}</td>
                                                    <td class="center" ><fmt:formatNumber pattern="0.000" value="${type.unitPrice}"/></td>
                                                    <td class="center" ><fmt:formatNumber pattern="0.000" value="${type.grnQty}"/></td>
                                                    <td class="center" ><fmt:formatNumber pattern="0.000" value="${type.billedAmt}"/></td>
                                                    <c:set var="bAmt" value="${bAmt+(type.billedAmt)}"/>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="6" ><span style="float: right; font-size: 19px; padding-right: 5px;">Billed Amount :</span></td>
                                                <td colspan="7" ><span id="bamt" style="font-size: 19px;"><fmt:formatNumber pattern="0.000" value="${bAmt}"/> ${currency}</span></td>
                                            </tr>
                                        </tbody>

                                    </table>
                                    <p>&nbsp;</p><p>&nbsp;</p>
                                    <div class="clearfix"></div>
                                    <c:if test="${action eq 'print'}">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group prbtn">
                                            <div class="col-md-9 col-sm-9 col-xs-12 ">
                                                <p>&nbsp;</p>

                                            </div>
                                        </div>
                                    </c:if>


                                    <div class="clearfix"></div>

                                    <div class="clearfix"></div>                

                                    <!-- /page content -->
                                </div> 

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <script>
            NProgress.done();

            function uniqueUomCode() {
                var categoryName = document.getElementById("uomCode").value;
                $.ajax({
                    type: "POST",
                    url: '../mastercodes/getUomCode.htm',
                    data: {
                        uomCode: categoryName,
                    },
                    success: function (data) {
                        if ($.trim(data) == 'Already Exists.') {
                            alert("Uom Code Already Exist");
                            document.getElementById("uomCode").value = "";
                            return false;
                        }
                    }
                });
            }

        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>
    </body>

</html>
