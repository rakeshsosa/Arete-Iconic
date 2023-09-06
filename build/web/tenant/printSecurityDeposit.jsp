<%-- 
    Document   : printReceipt
    Created on : 27 Mar, 2018, 6:33:17 PM
    Author     : ebs05
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/datepicker/jquery-ui.js" type="text/javascript"></script>
        <link href="../common/datepicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script src="../common/datepicker/CalendarControl.js" type="text/javascript"></script>
        <link href="../common/datepicker/StyleCalender.css" rel="stylesheet" type="text/css"/>
        <title>arête Assets Management</title>
        <style type="text/css">
            .auto-style14 {            
                width: 1%;
            }
            .auto-style15 {
                height: 16px;
            }
            .auto-style16 {
                height: 50px;

            }
            .auto-style17 {
                width: 55px;
            }
            .auto-style18 {
                height: 22px;
                width: 55px;
            }
            .auto-style19 {
                width: 34px;
            }
            .auto-style100 {
                width: 350px;
            }
            .auto-style20 {
                height: 22px;
                width: 34px;
            }
            table, tr, td {
                border: 1px solid black;
                border-collapse: collapse;
                line-height: 20px;
            }
            hr {
                border-top: 1px solid black;
                padding-left:0px;
                padding-right:0px;
                padding-top:0px;
            }
            p {
                margin-left: 47%;
                text-align: center;
                margin-top: -4px;
            }



            #td.divsectwo {
                width:50%;
            }
            .auto-style1 {
                height: 22px;
            }
            .auto-style2 {
            }
            .auto-style4 {
                height: 22px;
            }
            .auto-style5 {
                height: 100px;
            }
            .auto-style6 {
                height: 63px;
                width: 278px;
            }
            .auto-style7 {
                height: 22px;
                width: 278px;
            }

            .auto-style9 {
                height: 24px;}
            .auto-style10 {
                height: 22px;
                width: 26px;
            }
            .auto-style11 {
                height: 21px;
            }
            .auto-style12 {
                width: 600px;
            }
            .auto-style13 {
                height: 63px;
                width: 434px;
            }  .auto-style1 {
            }
            .auto-style4 {
                height: 22px;
            }
            .auto-style5 {
            }
            .auto-style6 {
                height: 63px;
                width: 278px;
            }
            .auto-style7 {
                height: 22px;
                width: 278px;
            }
            .auto-style8 {
                height: 28px;
            }

            .auto-style10 {
                height: 22px;
                width: 26px;
            }
            .auto-style11 {
                height: 21px;
            }
            .auto-style12 {
                width: 400px;
            }
            .auto-style13 {
                height: 63px;
                width: 434px;
            }

            .auto-style101{           
                width: 200px;
            }

            .auto-style70 {            
                width:300px;
            }
            .auto-style80{            
                height:50px;
            }
            table, tr.myref, td.myref1{
                border-right:0px solid black;
            }
            table,tr.myref,td.myref2 ,td.myref3{

                border-left:0px solid black;
            }
            table,tr.myref,td.myref2{

                border-right:0px solid black;
            }
            table,tr.myref,td.myref2,td.myref3,td.myref1{

                border-bottom:0px solid black;
            }

            div.tblclass {

                height:100px;

            }
        </style>

        <script>
            var a = ['', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ', 'Eighteen ', 'Nineteen '];
            var b = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

            function toWords(s) {
                if ((s = s.toString()).length > 9)
                    return 'overflow';
                n = ('000000000' + s).substr(-9).match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
                if (!n)
                    return;
                var str = '';
                str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + 'Crore ' : '';
                str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + 'Lakh ' : '';
                str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + 'Thousand ' : '';
                str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + 'Hundred ' : '';
                str += (n[5] != 0) ? ((str != '') ? ' ' : '') + (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + '' : '';
                return str;
            }
        </script>

    </head>
    <body>
        <div class="tblclass" align="center">

            <c:forEach items="${propertyList}" var="property">
                <c:if test="${receiptDetails.assetName eq property.assetCode}">
                    <c:set var="propertyName" value="${property.assetName}"></c:set>
                </c:if>
            </c:forEach>



            <table>
                <tr>
                    <td colspan="10" style="text-align: center;  font-size:12px;"  width="100%"  ><b>Assets Management System</b>  
                    </td>
                </tr>
                <tr>
                    <td colspan="12" style="text-align: center; font-size:15px"><b>Security Deposit</b></td>

                </tr>

                <tr>
                    <td colspan="6" style=" font-size:14px;">
                        Bill No: ${receiptDetails.receiptNo}<br />
                        Tenant Name: ${receiptDetails.tenantName}<br />
                        Property Name: ${propertyName}<br />
                        From Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${receiptDetails.period}"/><br />
                    </td>
                    <td colspan="6" style=" font-size:14px;">
                        Bill Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${receiptDetails.receiptDate}"/><br />
                        Tenant Code: ${receiptDetails.tenantCode}<br />
                        Flat Name/No: ${receiptDetails.flotNo}<br />
                        To Date: <fmt:formatDate pattern="dd-MMM-yyyy" value="${receiptDetails.period1}"/><br />
                        <br />
                    </td>

                </tr>


                <tr>
                    <td class="auto-style1" colspan="12" style="text-align: center; font-size:13px;">
                        <b> Details  of Payment</b>

                    </td>

                </tr>
                <tr  style="text-align: center; font-size:13px;width:100%">
                    <td colspan="6" class="auto-style100" style="padding-right: 40px"><b>Security Deposit Amount</b></td>
                    <!--                    <td colspan="2" class="auto-style12"><b>Total Amount</b></td>-->
                    <td colspan="6" class="auto-style100"><b>Paid Amount</b></td>
                    <!--                    <td colspan="2" class="auto-style12"><b>Dues Amount</b></td>
                                        <td colspan="4" class="auto-style100"><b>Mode of Payment</b></td>-->


                </tr>





                <tr>
                    <td colspan="6"  style="text-align: right; font-size:13px;"><fmt:formatNumber value="${receiptDetails.rentAmount}" pattern="0.000"/></td>
<!--                    <td colspan="2" style="text-align: right; font-size:13px;"><fmt:formatNumber value="${receiptDetails.totalAmount}" pattern="0.000"/></td>-->
                    <td colspan="6" class="auto-style9" style="text-align: right; font-size:13px;"><fmt:formatNumber value="${receiptDetails.amount}" pattern="0.000"/></td>
<!--                    <td colspan="2" style="text-align: right; font-size:13px;"><fmt:formatNumber value="${receiptDetails.dues}" pattern="0.000"/></td>-->
<!--                    <td colspan="4" class="auto-style18" style="font-size:13px;">${receiptDetails.modeOfPayment}</td>-->

                </tr>
                <c:if test="${receiptDetails.modeOfPayment eq 'Cheque'}">
                    <tr>
                        <td class="auto-style1" colspan="12" style="text-align: center; font-size:13px;">
                            <b> Details  of Cheque</b>

                        </td>

                    </tr>
                    <tr  style="text-align: center; font-size:13px;width:100%">
                        <td colspan="1" class="auto-style14" style="padding-right: 40px"><b>Check No</b></td>
                        <td colspan="2" class="auto-style12"><b>Check Type</b></td>
                        <td colspan="3" class="auto-style100"><b>Dated</b></td>
                        <td colspan="2" class="auto-style12"><b>Bank Name</b></td>
                        <td colspan="4" class="auto-style100"><b>Account No</b></td>


                    </tr>





                    <tr>
                        <td colspan="1"  style="text-align: right; font-size:13px;">${receiptDetails.chequeNo}</td>
                        <td colspan="2" style="text-align: center; font-size:13px;">${receiptDetails.extra1}</td>
                        <td colspan="3" class="auto-style9" style="text-align: right; font-size:13px;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${receiptDetails.dated}"/></td>
                        <td colspan="2" style="text-align: center; font-size:13px;">${receiptDetails.bankName}</td>
                        <td colspan="4" class="auto-style18" style="font-size:13px;">${receiptDetails.accountNo}</td>

                    </tr>



                </c:if>
                <!--            <tr >
                                <td colspan="1" class="auto-style14">&nbsp;</td>
                                                
                                <td colspan="10" style="text-align: center; font-size:13px;"><b>Total</b></td>
                                <td colspan="1" style="text-align: center; font-size:13px;"><b>100000</b></td>
                            </tr>-->
                <tr>
                    <td class="auto-style8" colspan="12">&nbsp;</td>

                </tr>
                <tr style="font-size:13px;">

                <script>
                    var words = toWords(Math.round(${receiptDetails.amount}));
                </script> 
                <td class="auto-style8" colspan="12" style="font-size:13px;"><b>Paid Amount In Words: Rial Omani <% String st = "<script>document.writeln(words)</script>";
                            out.println(st);%> Only.</b></td>

                </tr>

                <tr>
                    <td class="auto-style80" colspan="12" style="font-size:13px;">
                        Date:
                        <p class="auther" style=" text-decoration:overline;">Authorised Signatory</p>

                    </td>

                </tr>
            </table>
        </div>

    </body>

</html>
