<%-- 
    Document   : comparedQuotForm
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <!--<link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">-->




        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body class="nav-sm">


        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form class="form-inline" id="compForm" action="../purchase/quotApprove.htm" method="post" enctype="multipart/form-data">
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Supplier Quotation&tab=Compared Quotation&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Quotation List

                                        </h2>
                                        <div class="clearfix">


                                        </div>
                                    </div>

                                    <c:forEach items="${quotList}" var="type">
                                        <c:set var="division" value="${type.divisionName}"/>
                                        <c:set var="potype" value="${type.purchaseType}"/>
                                        <c:set var="department" value="${type.department}"/>
                                        <c:set var="ReqNo" value="${type.prNo}"/>
                                        <c:set var="reqDate" value="${type.prDate}"/>
                                        <c:set var="prCode" value="${type.projectCode}"/>
                                        <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                        <c:set var="requiredDate" value="${type.deliveryDate}"/>
                                        <%--<c:set var="priority" value="${type.priority}"/>--%> 
                                    </c:forEach>

                                    <div class="x_content">
                                        <div class="col-md-4 col-sm-12 col-xs-12 ">
<!--                                            <div>
                                                <strong style="padding-right: 8px;">Division:</strong> ${division}
                                            </div>-->
                                            <div>
                                                <strong style="padding-right: 8px;">PO Type:</strong> ${potype}
                                            </div>
                                            <div>
                                                <strong style="padding-right: 8px;">Department:</strong> ${department}
                                            </div>
                                            <div><strong style="padding-right: 8px;">Requisition No:</strong> ${ReqNo}
                                                <input name="reqNo" id="ReqNo" value="${ReqNo}" type="hidden">
                                            </div>


                                            <div><strong style="padding-right: 8px;width: 50px">Requisition Date:</strong> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}" />
                                                <input name="reqDate" type="hidden" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/>" tabindex="-1"/>
                                                <input class="input-xlarge"id="" name="ReqDateNo" readonly="" type="hidden" value="<%= (new SimpleDateFormat("dd-MMM-yyyy")).format(new java.util.Date())%>">

                                            </div>

                                        </div>
                                        <div class="col-md-offset-6">
<!--                                            <div>
                                                <strong style="padding-right: 8px;">Project Code:</strong>${prCode}
                                            </div>-->
                                            <div > 
                                                <!--<strong style="padding-right: 8px;">Required Date:</strong>-->
                                                <%--<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>--%>
                                                <input type="hidden" name="requiredByDate" class="form-control"  readonly   value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>">

                                            </div>                                                          


                                            <div> 

                                                <strong style="padding-right: 8px;">Store Name:</strong><b style="width: 100px;font-weight: normal;">${deliveryLocation}</b>


                                            </div>
                                        </div>
                                    </div>
                                    <p>&nbsp;</p> 
                                    <div class="col-md-4 col-sm-12 col-xs-12 ">
                                        <strong style="padding-right: 8px;">Attachment:</strong>
                                        <c:forEach items="${purchDocList}" var="doc">
                                            <c:if test="${not empty doc.fileName}">
                                                <a style="color: black" href="../purchase/requiAttachDownload.htm?sno=${doc.SNo}" title="Click to download">
                                                    <i class="fa fa-file-pdf-o" style="font-size: 15px" ></i>
                                                    ${doc.fileName}
                                                </a>
                                            </c:if> 
                                        </c:forEach>

                                    </div>

                                    <div class="x_content">                                        

                                        <p>&nbsp;</p> 


                                        <div class="x_content">

                                            <div style="height:auto;overflow-y:scroll;">
                                                <table id="example" class="table table-striped responsive-utilities jambo_table" style="font-size:12px;border:3px solid #686868;">
                                                    <thead>
                                                        <tr class="headings" > 
                                                            <th colspan="2" style="border-right:   3px solid #686868;text-align: center" >Item</th>
                                                            <!--<th>Item Description</th>-->
                                                            <c:forEach items="${groupSupList}" var="grpSupList">
                                                                <th colspan="6" style="border-right:   3px solid #686868;" ><center>
                                                            Supplier Name- 
                                                            ${grpSupList[1]}

                                                        </center></th>                                                        
                                                    </c:forEach>

                                                    <!--suplier display in header donot delete  -->

                                                    <%--<c:forEach items="${quotList}" var="list">--%>
                                                    <%--<c:if test="${existItem ne list.supplierCode}">--%>
                                                    <!--<th colspan="5" style="border-right:   3px solid #686868;" ><center>-->
                                                    <!--Supplier Name---> 
                                                    <%--<c:if test="${existItem ne list.supplierName}">--%>
                                                    <%--${list.supplierName}--%>
                                                    <%--</c:if>--%>
                                                    <%--<c:set var="existItem" value="${list.supplierName}"/>--%>

                                                    <!--                                                            </center></th>   -->
                                                    <%--</c:if>--%>
                                                    <%--<c:set var="existItem" value="${list.supplierCode}"/>--%>

                                                    <%--</c:forEach>--%>

                                                    </tr>
                                                    </thead>

                                                    <tbody> 
                                                        <tr>
                                                            <th colspan="2" style="border-right:   3px solid #686868;width:200px;" ><center style="width: 350px;" >Item Name - Item Description</center></th>
                                                            <%--<c:forEach items="${quotList}" var="list">--%>
                                                            <c:forEach items="${groupSupList}" var="grpSupList">
                                                        <th colspan="2" style="width:100px;"><center >Qty</center></th>
                                                        <th>
                                                        <center>Price</center>
                                                        </th>
                                                        <th><center>Discount(%)</center></th>
                                                        <th><center>Discount Amount</center></th>
                                                        <th style="border-right: 3px solid #686868;" ><center>Total</center></th>
                                                        </c:forEach>
                                                        <%--</c:forEach>--%>


                                                    </tr>
                                                    <c:forEach items="${itemList}" var="type">  
                                                        <tr id="qoutItem" class="lowesttotal">

                                                            <td style="display: none"> <input type="hidden" name="checkedradio"  id="checkedradio" value=""></td>
                                                            <td style="display: none"> <input type="text" name="prSNo"  id="prSNo" value=""></td>
                                                            <td>
                                                                <div id="dynamicdiv" style="display: inline">${type[0]}</div>                                                             

                                                            </td>
                                                            <td style="border-right:   3px solid #686868;" >
                                                                <div id="dynamicdiv" style="display: inline">${type[1]}</div>                                                                

                                                            </td> 
                                                            <c:set var="SNo" value="null"/>
                                                            <c:set var="quantity" value="0"/>                                                                                           
                                                            <c:set var="unitPrice" value="0"/>
                                                            <c:set var="discount" value="0"/>
                                                            <c:set var="supplierCode" value=""/>
                                                            <c:set var="itemName" value="${type[0]}"/>                                                            
                                                            <c:set var="totalPrice" value="0"/>

                                                            <c:set var="existItm" value="0"/>

                                                            <c:forEach items="${quotList}" var="list">
                                                                <c:if test="${type[2] eq list.itemCode}">
                                                                    <c:set var="itemCode" value="${type[2]}"/>
                                                                    <c:set var="deliveryDate" value="${list.deliveryDate}"/>
                                                                </c:if>
                                                            </c:forEach>  

                                                            <c:forEach items="${groupSupList}" var="grpSupList">
                                                                <c:forEach items="${quotList}" var="list">                                                                    


                                                                    <c:if test="${grpSupList[0] eq list.supplierCode}">

                                                                        <%--<c:if test="${existItm ne list.itemName}">--%>

                                                                        <c:if test="${type[2] eq list.itemCode}">
                                                                            <c:if test="${type[3] eq list.deliveryDate}">
                                                                                <c:set var="SNo" value="${list.SNo}"/>
                                                                                <c:set var="quantity" value="${list.quantity}"/>                                                                                           
                                                                                <c:set var="unitPrice" value="${list.unitPrice}"/>
                                                                                <c:set var="discount" value="${list.discount}"/>
                                                                                <c:set var="supplierCode" value="${list.supplierCode}"/>
                                                                                <c:set var="itemCode" value="${list.itemCode}"/>
                                                                                <c:set var="totalPrice" value="${list.totalPrice}"/>
                                                                                <c:set var="deliveryDate" value="${list.deliveryDate}"/>

                                                                            </c:if>

                                                                        </c:if>                                                                               

                                                                        <%--</c:if>--%>
                                                                        <%--<c:set var="existItm" value="${type[0]}"/>--%>


                                                                    </c:if>
                                                                </c:forEach>
                                                                <td style="width:10px;">                                                                        
                                                                    <div id="radioCheck${supplierCode}">
                                                                        <input type="radio" required="" value="${SNo}"  name="radioCheck${deliveryDate}${itemCode}" id="radioChecked${supplierCode}" onkeyup="" onclick="setSelectedTotal(this, '${supplierCode}', '${itemName}', '${SNo}');"/>

                                                                    </div>
                                                                    <input type="hidden" id="suppName${SNo}" value="${supplierName}">
                                                                    <input type="hidden" id="itemName${SNo}" value="${itemCode}">
                                                                </td>

                                                                <td style="width:80px;"><input style="width:80px;" class="right form-control  input-sm validate[required,custom[float5]]" onpaste="return false" readonly="" required="" name="qty${SNo}" autocomplete="off" id="qty${SNo}" onkeyup="validatePrice(this, '${SNo}');" onkeypress="return check_digit(event, this, 10, 3)"  type="text" value="${quantity}"></td> 

                                                                <td style="width:90px;"><input style="width:90px;" class="right form-control  input-sm validate[required,custom[float5]]" onpaste="return false" readonly="" required="" autocomplete="off" onkeyup="validatePrice(this, '${SNo}');" onkeypress="return check_digit(event, this, 6, 3);" name="price${SNo}" id="price${SNo}" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${unitPrice}"/>"></td> 
                                                                <td style="width:90px;"><input style="width:90px;" class="right form-control  input-sm" required="" name="discount${SNo}" readonly="" id="discount${SNo}" onpaste="return false" onkeyup="validatePrice(this, '${SNo}');" onkeypress="return check_digit(event, this, 2, 2);" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${discount}"/>"></td> 
                                                                 <td style="width:90px;"><input style="width:90px;" class="right form-control  input-sm" required="" name="discount${SNo}" readonly="" id="discount${SNo}" onpaste="return false" onkeyup="validatePrice(this, '${SNo}');" onkeypress="return check_digit(event, this, 2, 2);" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${(quantity*unitPrice)*(discount/100)}"/>"></td> 
                                                                <td style="border-right:   3px solid #686868;" class="lowtotal"><input class="right form-control  input-mini total${supplierCode}" id="total${SNo}" name="total${SNo}" type="text" value="<fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${totalPrice}"/>" readonly="" style="font-weight: bold;border: none"></td>                                                             

                                                                <c:set var="SNo" value="null"/>
                                                                <c:set var="quantity" value="0"/>                                                                                           
                                                                <c:set var="unitPrice" value="0"/>
                                                                <c:set var="discount" value="0"/>
                                                                <c:set var="supplierCode" value=""/>
                                                                <%--<c:set var="itemName" value=""/>--%>
                                                                <c:set var="totalPrice" value="0"/>

                                                            </c:forEach> 





                                                        </tr>
                                                    </c:forEach>

                                                    <tr>
                                                        <td colspan="2" style="border-right:   3px solid #686868;"><b>Selected Total</b></td>

                                                        <c:forEach items="${groupSupList}" var="grpSupList">
                                                            <td  style="border-right:      none;border-left: none"></td>
                                                            <td  style="border-right:     none;border-left: none"></td>
                                                            <td  style="border-right:    none;border-left: none"></td>
                                                            <td  style="border-right:    none;border-left: none"></td>
                                                            <td style="border-left:   none"></td>
                                                            <td colspan="" ><input class="right form-control input-sm" type="text" style="font-weight: bold" id="st${grpSupList[0]}" value="0.0" readonly=""/></td>

                                                        </c:forEach>

                                                        <%--<c:forEach items="${quotList}" var="list">--%>
                                                        <%--<c:if test="${existSup ne list.supplierCode}">--%>
                                                        <!--
                                                                                                                        <td  style="border-right:      none;border-left: none"></td>
                                                                                                                        <td  style="border-right:     none;border-left: none"></td>
                                                                                                                        <td  style="border-right:    none;border-left: none"></td>
                                                                                                                        <td style="border-left:   none"></td>
                                                                                                                        <td colspan="" ><input class="form-control input-sm" type="text" style="width:120px" id="st${list.supplierCode}" value="0.0" readonly=""/></td>-->


                                                        <%--</c:if>--%>

                                                        <%--<c:set var="existSup" value="${list.supplierCode}"/>--%>



                                                        <%--</c:forEach>--%>

                                                    </tr>


                                                    <tr>
                                                        <td colspan="2" style="border-right:   3px solid #686868;"><b>Over All Total</b></td>
                                                        <c:forEach items="${groupSupList}" var="grpSupList">
                                                            <td style="border: none"></td>
                                                            <td style="border: none"></td>
                                                            <td style="border: none"></td>
                                                            <td style="border: none"></td>
                                                            <td style="border: none"></td>


                                                            <td colspan=""><input class="right form-control input-sm" type="text" style="font-weight: bold" id="ot${grpSupList[0]}" value="0.0" readonly=""/></td>


                                                        </c:forEach>

                                                        <%--<c:forEach items="${quotList}" var="list">--%>

                                                        <%--<c:if test="${exissup ne list.supplierCode}">--%> 
                                                        <!--                                                                <td style="border: none"></td>
                                                                                                                        <td style="border: none"></td>
                                                                                                                        <td style="border: none"></td>
                                                                                                                        <td style="border: none"></td>
                                                        
                                                        
                                                                                                                        <td colspan=""><input class="form-control input-sm" type="text" style="width:120px" id="ot${list.supplierCode}" value="0.0" readonly=""/></td>-->


                                                        <%--</c:if>--%>
                                                        <%--<c:set var="exissup" value="${list.supplierCode}"/>--%>
                                                        <%--<c:set var="overalltotal" value="0"/>--%>
                                                        <%--</c:forEach>--%>

                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" style="border-right:   3px solid #686868;"><b>Payment Terms</b></td>                                                        
                                                        <c:forEach items="${groupSupList}" var="grpSupList">

                                                            <td colspan="6"><label style="font-weight: normal;"></label>${grpSupList[2]}</td>

                                                        </c:forEach>


                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" style="border-right:   3px solid #686868;"><b>Delivery Terms</b></td>
                                                        <c:forEach items="${groupSupList}" var="grpSupList">

                                                            <td colspan="6"><label style="font-weight: normal;"></label>${grpSupList[3]}</td>

                                                        </c:forEach>


                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="border-right:   3px solid #686868;"><b>Item Specification Supplier</b></td>
                                                        <c:forEach items="${groupSupList}" var="grpSupList">

                                                            <td colspan="6"><label style="font-weight: normal;"></label>${grpSupList[4]}</td>

                                                        </c:forEach>

                                                        </tbody>
                                                </table>
                                            </div>

                                        </div>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <label class="control-label"><span style="color: red">*</span> Remarks</label>
                                                <input type="hidden" name="action" value="Approve">
                                                <textarea class="form-control validate[required] " rows="5" style="resize: none;width: 200%" id="remarks" name="remarks" type="text" value="" maxlength="1000"></textarea>


                                            </div>

                                            <p>&nbsp;</p> <p>&nbsp;</p> <p>&nbsp;</p>
                                            <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <p>&nbsp;</p>
                                                    <!--<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">-->
                                                    <button type="submit" class="btn btn-primary" style="">Approve</button>
                                                    <button type="button" class="btn btn-warning" onclick="recheck('${ReqNo}', 'Quotation Created');">Recheck</button>
                                                    <!--<a href="../purchReq/comparedQuotForm.htm?reqNo=${ReqNo}&recStatus=Quotation Created"><button type="button" class="btn btn-danger"><i class="fa fa-repeat" style="font-size: 15px"></i> Recheck</button></a>-->
                                                    <a href="../purchase/comparedQuotList.htm"><button type="button" class="btn btn-danger" style="" >Cancel</button></a> 

                                                    <!--</div>-->
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>


                            </div>
                        </form>

                    </div>
                </div>




                <!-- Datatables -->
                <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->

                <script>
                    $(document).ready(function () {
                        $('#compForm').validationEngine();

                        $('tr.lowesttotal').each(function () {
                            var $itemRow = $(this).closest('tr');
                            var lowprice = [];
                            $($itemRow).find('.lowtotal').each(function () {

                                var it = $(this).find("input[id^=total]").val();
                                if (it != 0) {
                                    lowprice.push(it);

                                }


                            });
                            lowprice.sort(function (a, b) {
                                return a - b
                            });
                            $($itemRow).find('.lowtotal').each(function () {

                                var low = $(this).find("input[id^=total]").val();
                                if (lowprice[0] == low) {
                                    $(this).find("input[id^=total]").css('color', '#198C19').css('font-weight', 'bold');
                                }


                            });


                        });
                        $('input.tableflat').iCheck({
                            checkboxClass: 'icheckbox_flat-green',
                            radioClass: 'iradio_flat-green'
                        });

                        setOverAllTotal();
                    });

                    var asInitVals = new Array();
                    $(document).ready(function () {
                        var oTable = $('#example').dataTable({
                            "oLanguage": {
                                "sSearch": "Search all columns:"
                            },
                            "aoColumnDefs": [
                                {
                                    'bSortable': true,
                                    'aTargets': [0]
                                } //disables sorting for column one
                            ],
                            'iDisplayLength': 12,
                            "sPaginationType": "full_numbers",
                            "dom": 'T<"clear">lfrtip',
                            "tableTools": {
                                "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                            }
                        });
                        $("tfoot input").keyup(function () {
                            /* Filter on the column based on the index of this element's parent <th> */
                            oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                        });
                        $("tfoot input").each(function (i) {
                            asInitVals[i] = this.value;
                        });
                        $("tfoot input").focus(function () {
                            if (this.className == "search_init") {
                                this.className = "";
                                this.value = "";
                            }
                        });
                        $("tfoot input").blur(function (i) {
                            if (this.value == "") {
                                this.className = "search_init";
                                this.value = asInitVals[$("tfoot input").index(this)];
                            }
                        });
                    });
                </script>
                <script>

                    function  setOverAllTotal()
                    {

                    <c:forEach items="${quotList}" var="list">
                        var ot = 0;
                        <c:if test="${exspp ne list.supplierCode}">
                        $('.total${list.supplierCode}').each(function () {

                            var $itemRow1UF = $(this).closest('tr');
                            var supTotUF = $itemRow1UF.find('.total${list.supplierCode}').val();

                            ot = parseFloat(ot) + parseFloat(supTotUF);


                        });
                        $('#ot${list.supplierCode}').val(parseFloat(ot).toFixed(3));
                        </c:if>
                        <c:set var="exspp" value="${list.supplierCode}"/>

                    </c:forEach>
                    }

                    function  setSelectedTotal($this, suppcode, itemName, SNo)
                    {
                        if ($($this).is(':checked')) {
                            var $itemRow1UF = $($this).closest('tr');
                            var qty = $itemRow1UF.find('#qty' + SNo).val();
                            if (qty == "0" || qty == "" || qty == "0.0")
                            {
                                alert("You can't select quantity is zero...!!");
                                $($this).prop('checked', false);
                                return false;
                            }
                        }


                    <c:forEach items="${quotList}" var="list">
                        var st = 0;
                        <c:if test="${esupp ne list.supplierCode}">

                        $('#radioCheck${list.supplierCode} input[type=radio]:checked').each(function () {

                            var $itemRow1UF = $(this).closest('tr');
                            var supTotUF = $itemRow1UF.find('.total${list.supplierCode}').val();


                            st = parseFloat(st) + parseFloat(supTotUF);
                            var checked = $itemRow1UF.find('#radioChecked${list.supplierCode}').val();
                            $(this).closest('tr').find('#checkedradio').val(checked);
                        });
                        $('#st${list.supplierCode}').val(parseFloat(st).toFixed(3));

                        </c:if>
                        <c:set var="esupp" value="${list.supplierCode}"/>

                    </c:forEach>
                    }

                    function validatePrice($this, Sno) {
                        var $itemRow = $($this).closest('tr');
                        var z = $itemRow.find('#qty' + Sno).val();
                        var zz = $itemRow.find('#price' + Sno).val();
                        var ccc = $itemRow.find('#discount' + Sno).val();
                        var discount = $itemRow.find('#qty' + Sno).val() * $itemRow.find('#price' + Sno).val() * (1 - $itemRow.find('#discount' + Sno).val() / 100);
                        var discountfinal = roundNumber(discount, 2);
                        isNaN(discount) ? $itemRow.find('#total' + Sno).val("N/A") : $itemRow.find('#total' + Sno).val(discountfinal);
                        setOverAllTotal();
                    }

                    function selectedPrice($this, Sno) {
                        var $itemRow = $($this).closest('tr');
                        var z = $itemRow.find('#qty' + Sno).val();
                        var zz = $itemRow.find('#price' + Sno).val();
                        var ccc = $itemRow.find('#discount' + Sno).val();
                        var discount = $itemRow.find('#qty' + Sno).val() * $itemRow.find('#price' + Sno).val() * (1 - $itemRow.find('#discount' + Sno).val() / 100);
                        var discountfinal = roundNumber(discount, 2);
                        isNaN(discount) ? $itemRow.find('#total' + Sno).val("N/A") : $itemRow.find('#total' + Sno).val(discountfinal);
                    }
                    function roundNumber(number, decimals) {
                        //If it's not already a String
                        var num2 = Math.floor(number * 1000) / 1000;
                        return num2;
                    }
                    function isNumberKey(evt) {
                        debugger;
                        var charCode = (evt.which) ? evt.which : event.keyCode;
                        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                            return false;
                        }
                        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
                            alert("please enter numeric value");
                            return false;
                        }
                        return true;
                    }


                    function calTotal(sno)
                    {
                        var qty = $('#reqQty' + sno).val();
                        var unitPrice = $('#unitPrice' + sno).val();

                        //                if (qty == "")
                        //                {
                        //                    alert("Enter Quantity");
                        //                    return;
                        //                }
                        //                 if (unitPrice == "")
                        //                {
                        //                    alert("Enter Unit Price");
                        //                    return;
                        //                }
                        //                else
                        //                {
                        var price = qty * unitPrice
                        $('#totalPrice' + sno).val(price);
                        //                }
                    }
                    function selectdate(val) {

                        NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
                        //$('#test').attr();
                        //document.getElementById("hiddentr").value=$itemRow.index();

                    }

                    function check_digit(e, obj, intsize, deczize) {
                        var keycode;

                        if (window.event)
                            keycode = window.event.keyCode;
                        else if (e) {
                            keycode = e.which;
                        }
                        else {
                            return true;
                        }

                        var fieldval = (obj.value),
                                dots = fieldval.split(".").length;

                        if (keycode == 46) {
                            return dots <= 1;
                        }
                     if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13||keycode != 46 || keycode != 8) {
                            // back space, tab, delete, enter 
                            return true;
                        }
                        if ((keycode >= 32 && keycode <= 45) || keycode == 47 || (keycode >= 58 && keycode <= 127)) {
                            return false;
                        }
                        if (fieldval == "0" && keycode == 48) {
                            return false;
                        }
                        if (fieldval.indexOf(".") != -1) {
                            if (keycode == 46) {
                                return false;
                            }
                            var splitfield = fieldval.split(".");
                            if (splitfield[1].length >= deczize && keycode != 8 && keycode != 0)
                                return false;
                        } else if (fieldval.length >= intsize && keycode != 46) {
                            return false;
                        } else {
                            return true;
                        }
                    }

                    function recheck(reqNo, status)
                    {
                        var remarks = $('#remarks').val();
                        if (remarks == null || remarks == '') {
                            alert("Please Write Remarks..!!");
                            return  false;
                        } else {
                            window.location.href = "../purchase/comparedQuotForm.htm?reqNo=" + reqNo + "&recStatus=" + status + "&remarks=" + remarks + "";


                        }


                    }

                </script>

                <script>
                    NProgress.done();
                </script>
                </body>

                </html>
