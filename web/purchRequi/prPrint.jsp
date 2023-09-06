<%-- 
    Document   : prPrint
    Created on : May 5, 2016, 10:09:50 AM
    Author     : nataraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">
    <head>
        <title>asset management</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../menu/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../common/theme/js/jquery.min.js"></script>



        <style>
            table,tr,td{
                border:1px  solid black;
            }

            .table-bordered
            {
                border:1px solid black;  
            }
            td p.tb1 {
                background-color: #66b3ff !important;




            }
            @page {margin: 0.2in;}
            @media print and (color){
                table,tr,td
                {
                    border:1px  solid black;
                }
                td p.tb1 {
                    background-color: #66b3ff !important;
                    color:white;
                    -webkit-print-color-adjust: exact; 
                    print-color-adjust: exact;



                }


                th.tb2,td.tb2{
                    background-color:#ccccff  !important;
                    -webkit-print-color-adjust: exact; 
                    print-color-adjust: exact;
                }
                th#tb2
                {
                    color:red;
                }
                td.tb3{
                    background-color:#d9d9d9  !important;
                    -webkit-print-color-adjust: exact; 

                    print-color-adjust: exact;
                }
                td.tb4
                {
                    background-color:yellow  !important;
                    -webkit-print-color-adjust: exact; 
                    print-color-adjust: exact;
                }
                td.tb5
                {
                    background-color:#ffd11a !important;
                    -webkit-print-color-adjust: exact; 
                    print-color-adjust: exact;
                }
                #generate {
                    display: none !important;
                }

            }td.td6
            {
                border:1px solid balck;
            }
            td.tb7
            {
                border:1px solid white;
                border-right:1px solid black;

            }
            td.tb14
            {
                border:1px solid white;
                border-right:1px solid black;
                border-bottom:1px solid black;
            }

            td#tb8{
                border:1px solid white;
            }
            td#tb9
            {
                border:1px solid white;
                border-left:1px solid black;
                border-right:1px solid black;
                border-top:1px solid black;
            }
            td#tb10
            {
                border-right:1px solid black;
            }
            td#tb11
            {
                border:1px solid white;
                border-right:1px solid black;

            }
            td#tb12
            {
                border:1px solid white;
                border-right:1px solid black;
                border-top:1px solid black;
            }
            td#tb13
            {
                border:1px solid white;
                border-right:1px solid black;
                border-bottom:1px solid black;
            }           

        </style>
        <script>
            function Generate()
            {
                window.print();
            }

        </script>

    </head>
    <body style="font-size:12px;font-family:'times new roman'">

        <c:forEach items="${purchReqList}" var="type">
            <c:set var="division" value="${type.division}"/>
            <c:set var="potype" value="${type.purchaseType}"/>
            <c:set var="department" value="${type.department}"/>
            <c:set var="ReqNo" value="${type.prNo}"/>
            <c:set var="reqDate" value="${type.prDate}"/>
            <c:set var="prCode" value="${type.projectCode}"/>
            <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
            <c:set var="requiredDate" value="${type.requiredDate}"/>
            <c:set var="priority" value="${type.priority}"/>
            <c:set var="remarks" value="${type.remarks}"/>
            <c:set var="userId" value="${type.userId}"/>                                           
            <c:set var="lastmodifiedDate" value="${type.lastmodifiedDate}"/>
            <c:set var="fileName" value="${type.fileName}"/>
            <c:set var="SNo" value="${type.SNo}"/>
            <c:set var="reviewerName" value="${type.reviewerName}"/>
            <c:set var="approverName" value="${type.approverName}"/>
            <c:set var="approverDate" value="${type.approverDate}"/>
            <c:set var="approverRemarks" value="${type.approverRemarks}"/>
            <c:set var="reviewerName" value="${type.reviewerName}"/>
            <c:set var="reviewerDate" value="${type.reviewerDate}"/>
            <c:set var="reviewerRemarks" value="${type.reviewerRemarks}"/>

        </c:forEach>

        <c:forEach items="${subgrouplist}" var="sublist">
            <c:set var="suborgName" value="${sublist.suborgName}"/>
            <c:set var="suborgAddress" value="${sublist.suborgAddress}"/>
        </c:forEach>

        <div class="container" style="">           
            <div style="text-align: center;" id="generate">
                <a  class="btn btn-primary" onclick="Generate();"><i class="fa-print"></i>Print</a>  
            </div>

            <!--            <p>&nbsp;</p>-->


            <table class=" " style="width:100%;">
                <tr>
                    <td>
                        <table class="" style="width:99.5%; font-family: times new roman;margin-top:2px;margin-left:2px;">


                            <tr>

                                <td style="width:18%;border-right:1px solid white;">

                                    <img style="height: 60px;width: 120px; margin-top: 10px;" src="../common/theme/img/5.png">

                                </td>

                                <td colspan=4 style="padding-left:100px;">
                                    <p class="tb1" style="background:#66b3ff;width:60%;float:center;padding:10px;font-size:15px;margin-top:15px;border:1px solid black;text-align:center"><b>PURCHASE REQUISITION</b>
                                </td>

                            <tr>

                        </table>


                        <table border="1" class=" " style="width:99.5%;font-family:'times new roman';font-size:12px;margin-top:2px;margin-left:2px;">
<!--                            <tr>
                                <td class="tb3" style="width:16%;background:#d9d9d9;"><b>Division</b></td>
                                <td style="width:16%;">${division}</td>
                                <td class="tb7" style="width:34%;"></td>
                                <td class="tb3" style="width:18%;background:#d9d9d9;"><b>Project Code</b></td>
                                <td style="width:18%;">${prCode}</td>


                            </tr>-->
                            <tr>
                                <td class="tb3" style="width:16%;background:#d9d9d9;"><b>PO Type</b></td>
                                <td style="width:16%;">${potype}</td>
                                <td class="tb7" style="width:34%;border:1px solid white;border-right:1px solid black;"></td>
                                <td class="tb3" style="width:18%;background:#d9d9d9;"><b>Required Date</b></td>
                                <td style="width:18%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/></td>

                            </tr>

                            <tr>
                                <td class="tb3" style="width:16%;background:#d9d9d9;"><b>Department</b></td>

                                <td class="tb6" style="width:16%;">${department}</td>
                                <td class="tb7" style="width:34%;"></td>
                                <td class="tb3" style="width:18%;background:#d9d9d9;"><b>Priority</b></td>
                                <td class="tb4" style="width:18%;">${priority}</td>

                            </tr>


                            <tr>
                                <td class="tb3" style="width:16%;background:#d9d9d9;"><b>Requisition No</b></td>

                                <td class="tb6" style="width:16%;">${ReqNo}</td>
                                <td class="tb7" style="width:34%;"></td>
                                <td class="tb3" style="width:18%;background:#d9d9d9;"><b>Delivery Location</b></td>
                                <td class="tb4" style="width:18%; ">${deliveryLocation}</td>

                            </tr>
                            <tr>
                                <td class="tb3" style="background:#d9d9d9;width:16%; "><b>Requisition Date</b></td>
                                <td style="width:16%;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${reqDate}"/></td>
                                <td class="tb14" colspan=3 style=""></td>

                        </table>

                        <br/>

                        <table class=" " border=1 id="addItem" style="width:99.5%;font-family:'times new roman';font-size:12px;margin-left:2px;margin-top:2px;">
                            <thead>
                                <tr>
                                    <th class="tb2" id="tb2" style="background-color:#ccccff;text-align:center;">
                                        Sl No.
                                    </th>
                                    <th class="tb2"  style="background-color:#ccccff;text-align:center;">
                                        Item Code
                                    </th>
                                    <th class="tb2" style="background-color:#ccccff;text-align:center;">
                                        Item Sub Category
                                    </th>

                                    <th class="tb2" style="background-color:#ccccff;text-align:center;">
                                        Item Name
                                    </th>
                                     <th class="tb2" style="background-color:#ccccff;text-align:center;">
                                        Item Desc
                                    </th>
                                    <th class="tb2" style="background-color:#ccccff;text-align: center">
                                        Reqiured Qty
                                    </th>
                                    <th class="tb2" style="background-color:#ccccff;text-align: center;">
                                        Available Qty
                                    </th>
                                    <th class="tb2" style="background-color:#ccccff;text-align: center">
                                        Unit
                                    </th>

                                </tr>
                            </thead>
                            <tbody class="xyz">
                                <c:set var="lineNo" value="1"/>
                                <c:forEach items="${purchReqList}" var="list">
                                    <tr id="reqedit">
                                        <td style="width:1%;">${lineNo}</td>
                                        <td style="width:2%;">
                                            ${list.itemCode}
                                            <input type="hidden" id="itemCode" value="${list.itemCode}">
                                        </td>
                                        <td style="width:5%;">
                                            ${list.itemSubCategory}
                                        </td>                                    
                                        <td style="width:20%;text-transform: capitalize">&nbsp;${list.itemName}</td> 
                                        <td style="width:10%;text-transform: capitalize">&nbsp;${list.description}</td> 
                                        <td style="width:2%;text-align:right">${list.quantity}&nbsp;</td>
                                        <td style="width:2%;text-align:right" id="availStock"></td> 
                                        <td style="width:2%;text-align:left">&nbsp;${list.unit}                                           
                                        </td>                                   
                                    </tr>
                                    <c:set var="lineNo" value="${lineNo+1}"/>
                                </c:forEach> 

                            </tbody>





                        </table>
                        <br/>
                        <h4 style="text-align:center;">APPROVER DETAILS</h4>

                        <table class=" " border=1 id="addItem" style="width:99.5%;font-family:'times new roman';font-size:12px;margin-left:2px;margin-top:2px;">
                            <tr>
                                <th class="tb2" id="tb2" style="background-color:#ccccff;text-align:center;">
                                    ROLE
                                </th>
                                <th class="tb2" style="background-color:#ccccff;text-align:center;">
                                    NAME
                                </th>
                                <th class="tb2"  style="background-color:#ccccff;text-align:center;">
                                    DATE
                                </th>
                                <th class="tb2" style="background-color:#ccccff;text-align:center;">
                                    REMARKS
                                </th>

                            </tr>
                            <tr>
                                <td class="center" ><b>Requestor</b></td>
                                <td class="center">${userId}</td>
                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                <td class="center">${remarks}</td>

                            </tr>
                            <tr>
                                <td class="center" ><b>Reviewer</b></td>
                                <td class="center">${reviewerName}</td>
                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${reviewerDate}" /></td>
                                <td class="center">${reviewerRemarks}</td>

                            </tr>

                            <tr>
                                <td class="center" ><b>Store Reviewer</b></td>
                                <td class="center">${approverName}</td>
                                <td class="center"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${approverDate}" /></td>
                                <td class="center">${approverRemarks}</td>

                            </tr>







                        </table>







                        <table class=""  style="width:99.5%;margin-left:2px;font-family:'times new roman';font-size:12px;margin-bottom:2px;">
                            <tr>
                                <td style="font-size:15px;text-align:left">
                                    ${suborgName}</br>
                                    ${suborgAddress}
                                </td>
                            </tr>
                        </table>




                    </td>
                </tr>
            </table>
        </div>
        <script>
            var storeName = '${deliveryLocation}';
            $(window).load(function () {
                $('tr#reqedit').each(function () {
                    var $itemRow = $(this).closest('tr');
                    var itemCode = $itemRow.find('#itemCode').val();
                    $.ajax
                            ({
                                type: "POST",
                                url: '../purchReq/chkInvenStock.htm',
                                data: {
                                    itemCode: itemCode,
                                    storeName: storeName
                                },
                                success: function (data) {

                                    $itemRow.find('#availStock').html(data);
                                }


                            });
                });
            });
        </script>
    </body>
</html>