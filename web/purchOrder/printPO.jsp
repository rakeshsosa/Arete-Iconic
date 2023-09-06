<%-- 
    Document   : poPrint
    Created on : May 5, 2016, 10:09:50 AM
    Author     : nataraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>arête Assets Management</title>
        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">             
        <style>hr{
                display: block;
                height: 1px;
                border: 0;
                border-top: 1px dotted #ccc;
                /*margin: 1em 0;*/
                padding: 0;
            }
            @media print {
                #itmtable {font-size:10px}
                thead {display: table-header-group;}      
                #address{
                    position:absolute;
                    left:0;
                    bottom:0;  
                }

                #generate {
                    display: none !important;
                }

            }
        </style> 
        <script>
            function Generate()
            {


                var format = "PDF";
                var poNo = document.getElementById("poNo").value;
                if (format != "null" && format != "")
                {
                    if (format == "HTML")
                    {
                        var url = '../reports/yycReportData.htm?format=' + format + '&poNo=' + poNo;
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "PDF") {
                        var url = '../reports/yycReportData.htm?format=' + format + '&poNo=' + poNo;
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "EXCEL") {
                        var url = '../reports/yycReportData.htm?format=' + format + '&poNo=' + poNo + '';
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "CSV") {
                        var url = '../reports/yycReportData.htm?format=' + format + '&poNo=' + poNo + '';
                        window.open(url, '_blank');
                        window.focus();
                    }

                }
            }
        </script>
    </head>

    <body style="font-size:12px;font-family:'times new roman'">

        <c:set var="m" value="0"/>
        <c:forEach items="${poList}" var="list">

            <c:set var="prCode" value="${list.projectCode}"/>
            <c:set var="poRevNo" value="${list.poRevNo}"/>
            <c:set var="reqno" value="${list.prNo}"/>
            <c:set var="reqDate" value="${list.prDate}"/>                               
            <c:set var="supplierEmail" value="${list.supplierEmail}"/>                                            
            <c:set var="quotationNo" value="${list.quotationNo}"/>
            <c:set var="quotationDate" value="${list.quotationDate}"/>
            <c:set var="deliveryLoc" value="${list.shipToLocation}"/>
            <c:set var="billToLocation" value="${list.billToLocation}"/>
            <c:set var="supcode" value="${list.supplierCode}"/>
            <c:set var="divisionName" value="${list.divisionName}"/>
            <c:set var="projectName" value="${list.projectName}"/>
            <c:set var="department" value="${list.department}"/>
            <c:set var="paymentTerms" value="${list.paymentTerms}"/>
            <c:set var="deliveryTerms" value="${list.deliveryTerms}"/>
            <c:set var="supname" value="${list.supplierName}"/>
            <c:set var="supadd" value="${list.supplierAddress}"/>
            <c:set var="potype" value="${list.importLocal}"/>
            <c:set var="currency" value="${list.currency}"/>
            <c:set var="poNote" value="${list.poNote}"/>
            <c:set var="purchaseOrderNo" value="${list.purchaseOrderNo}"/>
            <c:set var="purchaseOrderDate" value="${list.purchaseOrderDate}"/>
            <c:set var="purchaseType" value="${list.purchaseType}"/>
            <c:set var="warrantyPeriod" value="${list.warrantyPeriod}"/>
            <c:set var="userId" value="${list.userId}"/>
            <c:set var="lumsumDiscount" value="${list.lumsumDiscount}"/>



        </c:forEach>
        <c:forEach items="${supplierList}" var="supp">
            <c:if test="${supp.emailid eq supplierEmail}">
                <%--<c:set var="supname" value="${supp.supplierName}"/>--%>
                <%--<c:set var="supadd" value="${supp.supplierAddress}"/>--%>
                <%--<c:set var="supcode" value="${supp.supplierCode}"/>--%>
                <c:set var="supnumber" value="${supp.contNum}"/>
            </c:if>
        </c:forEach>

        <c:forEach items="${subgrouplist}" var="sublist">
            <c:set var="suborgName" value="${sublist.suborgName}"/>
            <c:set var="suborgAddress" value="${sublist.suborgAddress}"/>
        </c:forEach>


        <div class="container-fluid" style="border:1px solid black;">   
            <div class="col-md-offset-5" style="text-align:left;" id="generate">
                <a  class="btn btn-primary" onclick="Generate();" ><i class="fa-download"></i>Download and print</a>  
            </div> 
            <table style="width:100%;border-color: #808080">
                <thead>  <tr>
                        <td><img style="height: 60px;width: 120px" src="../common/theme/img/5.png"></td>
                        <td style="width:10px;">&nbsp;</td>
                        <td><h3 style="color: #4c5566;">PURCHASE ORDER</h3></td>

                    </tr></thead>
            </table>
            <hr/>
            <table style="border:1px solid black;width:100%">
                <div class="row">
                    <div class="col-xs-6">
                        <b>To:</b> <br/>

                        <!--<strong> Supplier Details </strong><BR/>-->	
                        <div style="padding-left:15px;"> ${supname}	<BR/>	
                            ${supadd}	<BR/>	
                            ${supnumber}	<BR/>	
                            ${supplierEmail}	<BR/>	</div> 

                    </div>

                    <div class="col-xs-6">
                        PO No:  ${purchaseOrderNo}	<BR/>	
                        <input type="hidden" id="poNo" value="${purchaseOrderNo}">
                        PO Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${purchaseOrderDate}"/>	<BR/>	
                        <!--Currency: ${currency}<BR/>-->
                        <!--Requisition No:--> 
                        <%--<c:forEach items="${reqNoList}" var="type">--%> 
                        <%--<c:if test="${not empty type[0]}">--%>
                        <!--${type[0]}-->
                        <%--</c:if>--%>
                        <%--</c:forEach>--%>
                        <!--<BR/>-->
<!--Requisition Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/><BR/>-->
<!--                        Division Name: ${divisionName}  <BR/>                        -->

                        <!--Purchase Type: ${purchaseType}  <BR/>-->
                        Prepared By: ${userId}<BR/>              


                    </div>
                </div>
                <!--<hr/>-->
                <!--                <div class="row">
                
                                    <div class="col-xs-6">
                                        PO No:  ${purchaseOrderNo}	<BR/>	
                                        <input type="hidden" id="poNo" value="${purchaseOrderNo}">
                                        PO Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${purchaseOrderDate}"/>	<BR/>	
                                        Currency: ${currency}<BR/>
                                        Requisition No: ${reqno}<BR/>
                                        Requisition Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/><BR/>
                
                
                
                                    </div>
                
                                    <div class="col-xs-6">                               
                
                                        Division Name: ${divisionName}  <BR/>                        
                
                                        Purchase Type: ${purchaseType}  <BR/>
                                        Prepared By: ${userId}<BR/>                               
                
                                    </div>
                
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-2"></div>
                                </div>-->
                <hr/>
                <div class="row">
                    <!--                    <div class="col-xs-4">
                                            <strong><div id="enduser">Supplier Details </div></strong>
                    ${supname}	<BR/>	
                    ${supadd}	<BR/>	
                    ${supnumber}	<BR/>	
                    ${supplierEmail}	<BR/>	 

                </div>-->

                    <div class="col-xs-6">
                        <b>  Bill To:</b> 
                    </div>

                    <div class="col-xs-5">
                        <b>Ship To / Delivery Location:</b> 
                    </div>

                </div>
                <div class="col-xs-6">

                    <div style="word-wrap: break-word; width: 150px;">  ${billToLocation}	</div><BR/>	                                 
                </div> 
                <div class="col-xs-5">

                    <div style="word-wrap: break-word; width: 150px;">  ${deliveryLoc} <BR/>${storeAddress}</div>	<BR/>	                                 
                </div> 
                <!--                        <table style="border:2px solid black;width:100%">
                                            <tr>
                                                <td>Please supply</td>
                                            </tr>
                                        </table>-->
                <br/><br/>

                <table id="itmtable" class="table" style="border:1px solid black;width:100%;border-color: #808080;">
                    <thead>
                        <tr style="border-bottom:1px solid black;width:100%;">
                            <th>Sl No.</th>    
                            <th>Item Code</th>
                            <th>Item Name</th>
                            <th>Item Desc</th>
                            <th>Del Date</th>                           
                            <th>Qty</th>
                            <th>Unit</th>
                            <th>Unit Price</th>
                            <th>Total Amount</th>
                            <th>Discount(%)</th>
                            <th>Discount Amount</th> 
                            <th>Total Amount After Discount</th>

                        </tr>
                    </thead>


                    <c:set var="SNo" value="1"/>
                    <c:set var="gtotal" value="0.0"/>
                    <c:forEach items="${poList}" var="type"> 
                        <!--<tbody>-->
                        <c:if test="${type.recordStatus ne 'Cancelled'}">
                            <tr style="border-top: 1px solid black;border-bottom:1px solid black;;width:100%;border-color: #808080">
                                <td>${SNo}</td>    
                                <td>${type.itemCode}</td>  
                                <td style="text-align: left;width:250px;">${type.itemName}</td>  
                                <td style="text-align: left;width:150px;">${type.description}</td>   
                                <td><fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/></td>                                
                                <td style="text-align: right;">${type.qty}</td>  
                                <td>${type.uom}</td>
                                <td style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.unitPrice}"/></td>
                                <td style="text-align: right"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.qty*type.unitPrice}"/></td>
                                <td style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${type.discount}"/></td>
                                <td style="text-align: right;width:180px;"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${(type.qty*type.unitPrice)*(type.discount/100)}"/></td>

                                <td style="text-align: right;width:150px;">
                                    <fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${type.totalValue}"/>
                                </td>

                                <c:set value="${totalbefdisAmt + type.qty*type.unitPrice}" var="totalbefdisAmt"/> 
                                <c:set value="${totaldisAmt + (type.qty*type.unitPrice)*(type.discount/100)}" var="totaldisAmt"/> 
                                <c:set value="${gtotal + type.totalValue}" var="totalAmt"/> 
                                <c:set value="${gtotal + type.totalValue}" var="gtotal"/> 
                                <c:set var="SNo" value="${SNo+1}"/>
                            </tr>
                        </c:if>
                        <!--</tbody>-->
                    </c:forEach> 
                    <c:set value="${gtotal * (1-lumsumDiscount/100)}" var="grandtotal"/> 
                    <c:set  var="lumsumamt"  value="${totalAmt-grandtotal}"/>
                    <tbody>
                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td> 
                            <td></td> 
                            <td></td>                                         
                            <td></td>   
                            <td></td>   
                            <td></td>   
                            <td></td>    
                            <td></td> 
                            <td></td> 
                            <th>Total Amount Before Discount:</th>                                
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${totalbefdisAmt}"/><BR/></th>
                        </tr>


                    </tbody>
                    <tbody>
                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td>   
                            <td></td> 
                            <td></td> 
                            <td></td>   
                            <td></td>   
                            <td></td>   
                            <td></td>    
                            <td></td> 
                            <td></td> 
                            <th>Total Discount Amount:</th>                                
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${totaldisAmt}"/><BR/></th>
                        </tr>


                    </tbody>
                    <tbody>
                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td>   
                            <td></td>  
                            <td></td> 
                            <td></td>   
                            <td></td>   
                            <td></td>   
                            <td></td>    
                            <td></td> 
                            <td></td> 
                            <th>Total Amount:</th>                                
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${totalAmt}"/><BR/></th>
                        </tr>


                    </tbody>
                    <tbody>
<!--                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td>   
                            <td></td>                                         
                            <td></td>  
                            <td></td> 
                            <td></td>   
                            <td></td>   
                            <td></td>    
                            <td></td> 
                            <td></td> 
                            <th>Lumsum Discount(%):</th>                                
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" minFractionDigits="3"  maxFractionDigits="3" value="${lumsumDiscount}"/><BR/></th>
                        </tr>-->


                    </tbody>
                    <tbody>
<!--                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td>   
                            <td></td>                                         
                            <td></td>   
                            <td></td>   
                            <td></td> 
                            <td></td>   
                            <td></td>    
                            <td></td> 
                            <td></td> 
                            <th>Lumsum Discount Amount:</th>                                
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false"  maxFractionDigits="3" pattern="0.000" value="${lumsumamt}"/><BR/></th>
                        </tr>-->


                    </tbody>
                    <tbody>
                        <tr style="border-bottom:1px solid black;width: 100%;border-color: #808080">
                            <td></td>                                
                            <td></td>   
                            <td></td>                                         
                            <td></td>   
                            <td></td>   
                            <td></td>   
                            <td></td> 
                            <td></td>  
                            <td></td> 
                            <td></td> 
                            <c:set value="${gtotal * (1-lumsumDiscount/100)}" var="grandtotal"/> 
                            <th>Total PO Value:</th>
                            <th style="text-align: right;"><fmt:formatNumber type="number" groupingUsed="false" pattern="0.000" maxFractionDigits="3" value="${grandtotal}"/>&nbsp;${currency}<BR/></th>
                        </tr>


                    </tbody>
                </table>


                <div class="container-fluid">
                    <div class="row">

                        <div class="col-xs-6">


                        </div>

                        <div style="float: right;padding-right: 132px" class="">
                            <!--<b>Total PO Value:</b> <fmt:formatNumber type="number" groupingUsed="false" pattern="0.000"  maxFractionDigits="3" value="${gtotal}"/>	<BR/>-->


                        </div>
                    </div>
                </div>
                <hr/>

                <div class="container-fluid">	
                    <div class="row">

                        <div class="col-xs-6">
                            <!--AMOUNT:INDIAN RUPEE	<BR/>-->


                        </div>

                        <div class="col-xs-6">
                            <!--Total PO Value:	<BR/>-->


                        </div>
                    </div>
                </div>                
                <!--                <div class="container-fluid">
                                    <div class="row" style="border:1px solid black;border-color: #808080">
                
                                        <div class="col-xs-6">
                
                
                                        </div>
                                        <div class="col-xs-2">
                
                                        </div>
                
                                        <div class="col-xs-2">
                                            Signature:	<BR/>
                
                
                                        </div>
                                    </div>
                                </div>-->
                <table style="border:1px solid black;width:100%;border-color: #808080">
                    <tr>
                        <td>PO Note: ${poNote} </td>
                    </tr>
                </table>
                </td>
                </tr>

            </table> 
            <table style="border:1px solid black;width:100%;border-color: #808080">
                <tr>
                    <td>
                        1.Payment Terms: ${paymentTerms}<br/>
                        2.Delivery Terms: ${deliveryTerms}<br/></td>
                </tr>
            </table>
            <div style="text-align: center">Special terms and Conditions</div>
            <%--<div class="col-xs-6">
                1. Category- Food<br/>
                &nbsp;&nbsp;&nbsp;a. Chilled / Frozen items/Dry items- Food<br/>
                &nbsp;&nbsp;&nbsp;b. Product temperature ( 2-8 Deg C)- Chilled<br/>
                &nbsp;&nbsp;&nbsp;c. Product temperature -( -12 to -18 Deg C) -Frozen<br/>
                &nbsp;&nbsp;&nbsp;d. To be accompanied with microbiological and chemical test reports ( Certificate of Analysis)-<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Laboratory reports<br/>
                &nbsp;&nbsp;&nbsp;e. Health and Halal certificate - import certifications for Food<br/>
                2. Packing Material Supplier- Certificate of conformity that the material is Food Grade<br/>
                3. Suppliers (Loaders) to wear safety shoes in AJH premises<br/>
                4. Category : Contractors (Third Party)<br/>
                &nbsp;&nbsp;&nbsp;a. Wear Safety shoes/Helmets<br/>
                &nbsp;&nbsp;&nbsp;c. Follow work permit<br/>
                5. Chemical- Efficacy and test report<br/>
                <BR/>	                                 
            </div> 
            <div class="col-xs-5">
                1. All goods to be delivered as per expected date mentioned in PO. Goods/material ordered to be<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;delivered at the delivery location specified in the PO<br/>
                2. We reserve the right to reject goods that are not in good order or condition as determined by our<br/>
                &nbsp;&nbsp;&nbsp;&nbsp;quality control<br/>
                3. Please send two copies of your Invoice with delivery<br/>
                4. Please notify us immediately if you are unable to ship as specified<br/>
                5. If you have any queries related to this Purchase Order please contact Duminda Ariyaratne <br/>
                &nbsp;&nbsp;&nbsp;&nbsp;(Mobile: 96447674, Email:Duminda@aljarwanihospitality.com)
               	<BR/>	                                 
            </div> --%>

            <table class="" id="address" style="width:100%;font-family:'times new roman';font-size:13px;margin-bottom:2px;">
                <tr>
                    <td style="font-size:10px;text-align:center">
                        <!--<b>${suborgName}</b></br>-->
                        This is a computer generated document and no signature is required<br/>

                        <b>${suborgAddress}</b>
                    </td>
                </tr>
            </table>
            <br/>


        </div>






    </body>
</html>
