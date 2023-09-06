<%-- 
    Document   : directPOEdit
    Created on : 7 Nov, 2016, 5:37:31 PM
    Author     : ebs-sdd10
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

        <!--<script type="text/javascript" src="../common/datepicker/datetimereq_css.js"></script>-->

        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
    </head>
    <script>
        //pop up to select Item Master
        function selectItemMaster() {

            var supp = document.getElementById("supplierCode").value;

            var a = document.getElementById("SuppType").value;

            if (a == 'Final Quotation')
            {
//            alert(supp);
                myWindow = window.open("../purchase/selectItemMaster1.htm?supp=" + supp + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            else
            {
                myWindow = window.open("../purchase/selectItemMaster.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

            }
        }
        function Caltotal($this, sno)
        {
            //alert("jhjg");

            var $itemRow = $($this).closest('tr');
            var qty = $itemRow.find('#qty' + sno).val();
            //alert(qty);
            var price = $itemRow.find('#price' + sno).val();
            //alert(price);
            // var convFact = $('#requisitionUom' + sno).val();
            // var conVal = convFact.split("-");
            if (price == '0')
            {
                alert("Invalid Price...!!");
                $('#price' + sno).val('');
                return false;

            }
            if (qty == '0')
            {
                alert("Invalid Quantity...!!");
                $('#qty' + sno).val('');

                return false;
            }
            if (price != '' && price != null)
            {
                var total = parseFloat(qty) * parseFloat(price);

                if (isNaN(total) == true)
                {
                    $('#totalPrice' + sno).val = '0';
                }
                else
                {
                    $('#totalPrice' + sno).val(parseFloat(total).toFixed(3));
                }
                //alert(total);
                //$('#total' + sno).val(parseFloat(total).toFixed(3));
            }
        }

    </script>

    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="clearfix"></div>
                        <form id="reqForm" class="form-inline" method="post" action="../purchase/purchaseOrderSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">

                            <c:forEach items="${purchase}" var="list">                                       
                                <c:if test="${list[0] eq '554'}">
                                    <c:set value="${list[1]}" var="field_554"/>
                                    <c:set value="${list[2]}" var="fieldStatus_554"/>
                                    <c:set value="${list[3]}" var="mand_status_554"/>
                                    <c:set value="${list[4]}" var="max_length_554"/>
                                </c:if>
                                <c:if test="${list[0] eq '555'}">
                                    <c:set value="${list[1]}" var="field_555"/>
                                    <c:set value="${list[2]}" var="fieldStatus_555"/>
                                    <c:set value="${list[3]}" var="mand_status_555"/>
                                    <c:set value="${list[4]}" var="max_length_555"/>
                                </c:if>
                                <c:if test="${list[0] eq '556'}">
                                    <c:set value="${list[1]}" var="field_556"/>
                                    <c:set value="${list[2]}" var="fieldStatus_556"/>
                                    <c:set value="${list[3]}" var="mand_status_556"/>
                                    <c:set value="${list[4]}" var="max_length_556"/>
                                </c:if>
                                <c:if test="${list[0] eq '557'}">
                                    <c:set value="${list[1]}" var="field_557"/>
                                    <c:set value="${list[2]}" var="fieldStatus_557"/>
                                    <c:set value="${list[3]}" var="mand_status_557"/>
                                    <c:set value="${list[4]}" var="max_length_557"/>
                                </c:if>
                                <c:if test="${list[0] eq '558'}">
                                    <c:set value="${list[1]}" var="field_558"/>
                                    <c:set value="${list[2]}" var="fieldStatus_558"/>
                                    <c:set value="${list[3]}" var="mand_status_558"/>
                                    <c:set value="${list[4]}" var="max_length_558"/>
                                </c:if>
                                <c:if test="${list[0] eq '560'}">
                                    <c:set value="${list[1]}" var="field_560"/>
                                    <c:set value="${list[2]}" var="fieldStatus_560"/>
                                    <c:set value="${list[3]}" var="mand_status_560"/>
                                    <c:set value="${list[4]}" var="max_length_560"/>
                                </c:if>
                                <c:if test="${list[0] eq '561'}">
                                    <c:set value="${list[1]}" var="field_561"/>
                                    <c:set value="${list[2]}" var="fieldStatus_561"/>
                                    <c:set value="${list[3]}" var="mand_status_561"/>
                                    <c:set value="${list[4]}" var="max_length_561"/>
                                </c:if>
                                <c:if test="${list[0] eq '562'}">
                                    <c:set value="${list[1]}" var="field_562"/>
                                    <c:set value="${list[2]}" var="fieldStatus_562"/>
                                    <c:set value="${list[3]}" var="mand_status_562"/>
                                    <c:set value="${list[4]}" var="max_length_562"/>
                                </c:if>
                                <c:if test="${list[0] eq '563'}">
                                    <c:set value="${list[1]}" var="field_563"/>
                                    <c:set value="${list[2]}" var="fieldStatus_563"/>
                                    <c:set value="${list[3]}" var="mand_status_563"/>
                                    <c:set value="${list[4]}" var="max_length_563"/>
                                </c:if>
                                <c:if test="${list[0] eq '564'}">
                                    <c:set value="${list[1]}" var="field_564"/>
                                    <c:set value="${list[2]}" var="fieldStatus_564"/>
                                    <c:set value="${list[3]}" var="mand_status_564"/>
                                    <c:set value="${list[4]}" var="max_length_564"/>
                                </c:if>
                                <c:if test="${list[0] eq '565'}">
                                    <c:set value="${list[1]}" var="field_565"/>
                                    <c:set value="${list[2]}" var="fieldStatus_565"/>
                                    <c:set value="${list[3]}" var="mand_status_565"/>
                                    <c:set value="${list[4]}" var="max_length_565"/>
                                </c:if>
                                <c:if test="${list[0] eq '566'}">
                                    <c:set value="${list[1]}" var="field_566"/>
                                    <c:set value="${list[2]}" var="fieldStatus_566"/>
                                    <c:set value="${list[3]}" var="mand_status_566"/>
                                    <c:set value="${list[4]}" var="max_length_566"/>
                                </c:if>
                                <c:if test="${list[0] eq '567'}">
                                    <c:set value="${list[1]}" var="field_567"/>
                                    <c:set value="${list[2]}" var="fieldStatus_567"/>
                                    <c:set value="${list[3]}" var="mand_status_567"/>
                                    <c:set value="${list[4]}" var="max_length_567"/>
                                </c:if>
                                <c:if test="${list[0] eq '570'}">
                                    <c:set value="${list[1]}" var="field_570"/>
                                    <c:set value="${list[2]}" var="fieldStatus_570"/>
                                    <c:set value="${list[3]}" var="mand_status_570"/>
                                    <c:set value="${list[4]}" var="max_length_570"/>
                                </c:if>
                                <c:if test="${list[0] eq '571'}">
                                    <c:set value="${list[1]}" var="field_571"/>
                                    <c:set value="${list[2]}" var="fieldStatus_571"/>
                                    <c:set value="${list[3]}" var="mand_status_571"/>
                                    <c:set value="${list[4]}" var="max_length_571"/>
                                </c:if>
                                <c:if test="${list[0] eq '572'}">
                                    <c:set value="${list[1]}" var="field_572"/>
                                    <c:set value="${list[2]}" var="fieldStatus_572"/>
                                    <c:set value="${list[3]}" var="mand_status_572"/>
                                    <c:set value="${list[4]}" var="max_length_572"/>
                                </c:if>

                                <c:if test="${list[0] eq '573'}">
                                    <c:set value="${list[1]}" var="field_573"/>
                                    <c:set value="${list[2]}" var="fieldStatus_573"/>
                                    <c:set value="${list[3]}" var="mand_status_573"/>
                                    <c:set value="${list[4]}" var="max_length_573"/>
                                </c:if>
                                <c:if test="${list[0] eq '574'}">
                                    <c:set value="${list[1]}" var="field_574"/>
                                    <c:set value="${list[2]}" var="fieldStatus_574"/>
                                    <c:set value="${list[3]}" var="mand_status_574"/>
                                    <c:set value="${list[4]}" var="max_length_574"/>
                                </c:if>
                                <c:if test="${list[0] eq '575'}">
                                    <c:set value="${list[1]}" var="field_575"/>
                                    <c:set value="${list[2]}" var="fieldStatus_575"/>
                                    <c:set value="${list[3]}" var="mand_status_575"/>
                                    <c:set value="${list[4]}" var="max_length_575"/>
                                </c:if>
                                <c:if test="${list[0] eq '576'}">
                                    <c:set value="${list[1]}" var="field_576"/>
                                    <c:set value="${list[2]}" var="fieldStatus_576"/>
                                    <c:set value="${list[3]}" var="mand_status_576"/>
                                    <c:set value="${list[4]}" var="max_length_576"/>
                                </c:if>
                                <c:if test="${list[0] eq '577'}">
                                    <c:set value="${list[1]}" var="field_577"/>
                                    <c:set value="${list[2]}" var="fieldStatus_577"/>
                                    <c:set value="${list[3]}" var="mand_status_577"/>
                                    <c:set value="${list[4]}" var="max_length_577"/>
                                </c:if>
                                <c:if test="${list[0] eq '578'}">
                                    <c:set value="${list[1]}" var="field_578"/>
                                    <c:set value="${list[2]}" var="fieldStatus_578"/>
                                    <c:set value="${list[3]}" var="mand_status_578"/>
                                    <c:set value="${list[4]}" var="max_length_578"/>
                                </c:if>
                                <c:if test="${list[0] eq '579'}">
                                    <c:set value="${list[1]}" var="field_579"/>
                                    <c:set value="${list[2]}" var="fieldStatus_579"/>
                                    <c:set value="${list[3]}" var="mand_status_579"/>
                                    <c:set value="${list[4]}" var="max_length_579"/>
                                </c:if>
                                <c:if test="${list[0] eq '580'}">
                                    <c:set value="${list[1]}" var="field_580"/>
                                    <c:set value="${list[2]}" var="fieldStatus_580"/>
                                    <c:set value="${list[3]}" var="mand_status_580"/>
                                    <c:set value="${list[4]}" var="max_length_580"/>
                                </c:if>
                                <c:if test="${list[0] eq '585'}">
                                    <c:set value="${list[1]}" var="field_585"/>
                                    <c:set value="${list[2]}" var="fieldStatus_585"/>
                                    <c:set value="${list[3]}" var="mand_status_585"/>
                                    <c:set value="${list[4]}" var="max_length_585"/>
                                </c:if>
                                <c:if test="${list[0] eq '590'}">
                                    <c:set value="${list[1]}" var="field_590"/>
                                    <c:set value="${list[2]}" var="fieldStatus_590"/>
                                    <c:set value="${list[3]}" var="mand_status_590"/>
                                    <c:set value="${list[4]}" var="max_length_590"/>
                                </c:if>
                                <c:if test="${list[0] eq '591'}">
                                    <c:set value="${list[1]}" var="field_591"/>
                                    <c:set value="${list[2]}" var="fieldStatus_591"/>
                                    <c:set value="${list[3]}" var="mand_status_591"/>
                                    <c:set value="${list[4]}" var="max_length_591"/>
                                </c:if>

                            </c:forEach> 


                            <c:forEach items="${approvList}" var="type">
                                <c:forEach items="${supp}" var="list1">
                                    <c:if test="${list1.supplierCode eq type.supplierName}">
                                        <c:set var="suppName" value="${list1.supplierName}"/>
                                        <c:set var="supAddrs" value="${list1.supplierAddress}"/> 
                                        <c:set var="supcontnum" value="${list1.supplierContNum}"/>
                                        <c:set var="mail" value="${list1.mailId}"/>
                                        <c:set var="supplierCode" value="${list1.supplierCode}"/>
                                    </c:if>                                                                 
                                </c:forEach>
                                <c:forEach items="${asset}" var="list2">
                                    <c:if test="${list2.assetCode eq type.assetName}">
                                        <c:set var="assetName" value="${list2.assetName}"/> 
                                        <c:set var="assetCode" value="${list2.assetCode}"/> 
                                    </c:if>                                    
                                </c:forEach>
                                <c:forEach items="${subasset}" var="list3">
                                    <c:if test="${list3.subAssetCode eq type.subAssetName}">
                                        <c:set var="subAssetName" value="${list3.subAssetName}"/> 
                                        <c:set var="subAssetCode" value="${list3.subAssetCode}"/> 
                                    </c:if>                                    
                                </c:forEach>
                                <c:set var="poNo" value="${type.poNo}"/>                               
                                <c:set var="poDate" value="${type.poDate}"/>
                                <c:set var="requiredDate" value="${type.requiredDate}"/>
                                <c:set var="deliveryLoc" value="${type.deliveryLoc}"/>
                                <c:set var="billToLoc" value="${type.billToLoc}"/>                         
                                <c:set var="paymentTerms" value="${type.paymentTerms}"/>
                                <c:set var="delvryTerms" value="${type.delvryTerms}"/>
                                <c:set var="remarks" value="${type.remarks}"/>
                                <c:set var="status" value="${type.status}"/>
                                <c:set var="SuppType" value="${type.suppType}"/>
                            </c:forEach>
                            <div class="col-md-6 col-xs-12">
                                <div class="x_panel">                             
                                    <jsp:include page="../login/headerlink.htm?submodule=Purchase Order&tab=Purchase Order&pagetype=form"/>
                                    <div class="x_title">
                                        <h2>
                                            Direct Purchase Order
                                        </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">                                      
                                        <c:if test="${fieldStatus_555 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_555 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_555}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="hidden" value="${action}" id="action" name="action"/>
                                                                <input name="status" type="hidden" value="${status}">
                                                                <input type="hidden" id="deleteRows" name="deleteRows" value="">
                                                                <input type="hidden" id="SuppType" name="SuppType" value="${SuppType}">
                                                                <input type="hidden" class="form-control"  readonly="" id="poNo" name="poNo" value="${poNo}">
                                                                <input class="form-control  input-xlarge" ${mand_status_555} readonly type="text" name="poDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${poDate}"/>">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" ${mand_status_555} readonly type="text" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_555} id="poDate" name="poDate" placeholder="Select Date" readonly="" type="text"  onclick="NewCssCal('poDate', 'ddMMMyyyy', '', '', '', '', 'future');">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_565 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_565 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_565}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input class="form-control  input-xlarge" ${mand_status_565} name="requiredDate" id="requiredDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiredDate}"/>"  onclick="NewCssCal('requiredDate', 'ddMMMyyyy', '', '', '', '', 'future');" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" ${mand_status_565} readonly type="text" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_565} id="requiredDate" name="requiredDate" placeholder="Select Date" readonly="" type="text"  onclick="NewCssCal('requiredDate', 'ddMMMyyyy', '', '', '', '', 'future');">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_590 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_590 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_590}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">                                                       
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text" class="form-control" ${mand_status_590} readonly="" id="assetCategory" name="assetCategory" value="${assetName}">
                                                                <input type="hidden"  class="form-control" readonly=""   id="categoryId"  value=""> 
                                                            </c:when>
                                                            <c:otherwise>                                                                   
                                                                <input type="text" class="form-control" ${mand_status_590} readonly="" name="assetCategory" value="${assetName}">
                                                            </c:otherwise> 
                                                        </c:choose>                                                      
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Property" class="form-control" ${mand_status_590}  id="assetCategory" name="assetCategory"  readonly="" onclick="SelectAsset();"> 
                                                        <input type="hidden"  class="form-control" readonly=""   id="assetCode"  value=""> 
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_591 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_591 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_591}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text" class="form-control" ${mand_status_591} readonly="" id="subAssetCategory" name="subAssetCategory" value="${subAssetName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" ${mand_status_591} readonly="" name="subAssetCategory" value="${subAssetName}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_591}  id="subAssetCategory" name="subAssetCategory" readonly="">
                                                        <input type="hidden"  class="form-control" readonly=""   id="subAssetCode"  value=""> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_558 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_558 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_558}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text"  class="form-control" ${mand_status_558} id="supplierName" Placeholder="Select Supplier" readonly="" onclick="selectSupplier();" style="cursor: pointer;resize: none;" name="supplierName" value="${suppName}">
                                                                <input id="supplierCode" name="supplierCode" type="hidden" value="${supplierCode}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_558} id="supplierName"  readonly=""  style="cursor: pointer;resize: none;" name="supplierName" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_558} id="supplierName" Placeholder="Select Supplier" readonly="" onclick="selectSupplier();" style="cursor: pointer;resize: none;" name="supplierName">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_560 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_560 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_560}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">                                                                    
                                                                <textarea   class="form-control" rows="1" readonly=""  style="resize: none;" name="supplierAddress">${supAddrs}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control" rows="1" style="resize: none;" readonly></textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1"  Placeholder="Autofetch"  style="resize: none;" readonly=""  id="supplierAddress" name="supplierAddress" type="text" value="${supplierAddress}" ></textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if><p>&nbsp;</p>
                                        <c:if test="${fieldStatus_561 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_561 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_561}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo"  readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo" value="${supcontnum}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo"  readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_561} id="supplierContactNo" Placeholder="Autofetch" readonly=""  style="cursor: pointer;resize: none;" name="supplierContactNo">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_562 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_561 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_562}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId"  readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId" value="${mail}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId"  readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId" value="">

                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control" ${mand_status_561} id="supplierMailId" Placeholder="Autofetch" readonly=""  style="cursor: pointer;resize: none;" name="supplierMailId">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>
                                        <c:if test="${fieldStatus_563 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_563 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_563}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(purchRequi) > 0}">
                                                        <c:forEach items="${purchRequi}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input type="hidden" class="form-control" ${mand_status_563} readonly="" id="itemName" name="itemName" value="" onclick="selectItemMaster();">
                                                                    <!--<input type="hidden"  class="form-control" readonly=""   id="itemCode"  value="">--> 
                                                                    <input type="hidden"  class="form-control" readonly=""   id="itemUom"  value=""> 
                                                                    <input type="hidden"  class="form-control" readonly=""   id="itemCategory"  value=""> 
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="hidden" class="form-control" ${mand_status_563} readonly="" name="itemName" value="">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Item Name" class="form-control" ${mand_status_563}  id="itemName" readonly="" onclick="selectItemMaster();" >  
                                                        <input type="hidden"  class="form-control" readonly=""   id="itemCode"  value=""> 
                                                        <input type="hidden"  class="form-control" readonly=""   id="itemUom"  value=""> 
                                                        <input type="hidden"  class="form-control" readonly=""   id="itemCategory"  value=""> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_564 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>

                                                <label class="control-label" style="margin-top:-16px;" for="selectError">${field_564}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(purchRequi) > 0}">
                                                        <c:forEach items="${purchRequi}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">  
                                                                    <input name="pk" type="hidden" value="${list.sno}"> 

                                                                    <textarea  id="itemDesc" type="hidden" class="form-control"  rows="1" style="resize: none"></textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" class="form-control" type="hidden" name="itemDesc" rows="1" ></textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>

                                                        <textarea  class="form-control" id="itemDesc" readonly="" placeholder="" rows="1" style="resize: none"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_556 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_556 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_556}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">                                                                    
                                                                <textarea   class="form-control" rows="1" ${mand_status_556} maxlength="${max_length_556}" style="resize: none;" required="" name="deliveryLoc">${deliveryLoc}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control" rows="1" ${mand_status_556} maxlength="${max_length_556}" style="resize: none;" readonly>${deliveryLocation}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1" ${mand_status_556} maxlength="${max_length_556}"   style="resize: none;" readonly=""  id="deliveryLoc" name="deliveryLoc" type="text" value="" >${deliveryLocation}</textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_557 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_557 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_557}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">                                                                    
                                                                <textarea   class="form-control" rows="1" style="resize: none;" required="" maxlength="300" name="billToLoc">${billToLoc}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea  class="form-control" rows="1" style="resize: none;" readonly></textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea class="form-control  input-xlarge" rows="1" required   style="resize: none;" maxlength="300"  id="billToLoc" name="billToLoc" type="text" value="" ></textarea>                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>



                                        <p>&nbsp;<p>
                                            <c:if test="${fieldStatus_578 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_578 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_578}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text"  class="form-control"  id="paymentTerms"  readonly="" maxlength="100" name="paymentTerms" value="${paymentTerms}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control"  id="paymentTerms"  readonly=""  name="paymentTerms" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control"  id="paymentTerms" maxlength="100"  name="paymentTerms">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>

                                        </c:if>
                                        <c:if test="${fieldStatus_579 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_579 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_579}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <input type="text"  class="form-control"  id="delvryTerms"   maxlength="100" name="delvryTerms" value="${delvryTerms}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control"  id="delvryTerms"  readonly=""   name="delvryTerms" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text"  class="form-control"  id="delvryTerms" maxlength="100" name="delvryTerms">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_580 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_580 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>                                          
                                                <label class="control-label ">${field_580}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                <textarea name="remarks" class="form-control"  rows="1" style="resize: none">${remarks}</textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  name="remarks" rows="1" style="resize: none"></textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea name="remarks" class="form-control"  rows="1" style="resize: none"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp;<p>

                                        <div class="clearfix"></div>
                                        <p>&nbsp;</p>                       
                                        <c:if test="${SNo eq null}">
                                            <div class="clearfix"></div>
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                    <thead>
                                                        <tr>
                                                            <th style=" ">Action</th>
                                                            <th style=" "><span style="color: red">*</span>Accessory Category</th>                                                            
                                                            <th style=" "><span style="color: red">*</span>Accessory Name</th>
                                                            <th style=" "><span style="color: red">*</span>Uom</th> 
                                                            <th style=" "><span style="color: red">*</span>Quantity</th>                                                                                                                      
                                                            <th style=" "><span style="color: red">*</span>Unit Price</th>
                                                            <th style=" "><span style="color: red">*</span>Total Price</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody id="resourcetable">
                                                        <c:set var="sno1" value="1"></c:set>
                                                        <c:forEach items="${approvList}" var="type">                                                          
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick="removeRow(${type.sno})"><button type="button" id="deleteRowcert" ><i class="fa fa-trash fa-lg-o"></i></button></td> 

                                                                <c:forEach items="${item}" var="list">
                                                                    <c:if test="${list.itemCode eq type.itemCode}">
                                                                        <c:set var="itmNam" value="${list.itemName}"></c:set>
                                                                        <c:set var="itmDesc" value="${list.itemDesc}"></c:set>
                                                                        <c:forEach items="${itemCat}" var="cat">
                                                                            <c:if test="${cat.categoryId eq list.itemCategory}">
                                                                                <c:set var="itmCat" value="${cat.itemCategory}"></c:set>  
                                                                            </c:if>
                                                                        </c:forEach>                                                                                                                                                           

                                                                        <c:forEach items="${uom}" var="uom">
                                                                            <c:if test="${uom.uomId eq list.itemUom}">
                                                                                <c:set var="itmuom" value="${uom.uomName}"></c:set> 
                                                                            </c:if>
                                                                        </c:forEach>                                                                                
                                                                    </c:if>
                                                                </c:forEach>
                                                                <td><input class="form-control" style="text-align: left;" name="itemCategory" id="itemCategory" readonly autocomplete="off" type="text" maxlength="30" value="${itmCat}"></td>
                                                                <td><input type="hidden" id="sno"  name="sno" value="${type.sno}"/>
                                                                    <input type="hidden" id="itemCode"  name="itemCode" value="${type.itemCode}"/>                                                              
                                                                    <input class="form-control" style="text-align: left;" name="itemName" id="itemName1" readonly="" autocomplete="off" type="text" maxlength="30" value="${itmNam}"></td>
                                                                <td><input class="form-control" style="text-align: left;" name="uom" id="uom" readonly autocomplete="off" type="text" maxlength="30" value="${itmuom}"></td>
                                                                <td><input class="form-control" style="text-align: right;" required="" name="qty" id="qty${sno1}"  autocomplete="off" type="text" maxlength="30" value="${type.qty}" onkeyup="Caltotal(this,${sno1});" onkeypress="return check_digit(event, this, 10, 2);"></td>                                                              
                                                                <td><input class="form-control" style="text-align: right;"  required="" name="price" id="price${sno1}"  autocomplete="off" type="text" min="8" maxlength="11" value="${type.price}"  onkeyup="Caltotal(this,${sno1});" onkeypress="return check_digit(event, this, 10, 2);"> 
                                                                <td><input class="form-control" style="text-align: right;"  name="totalPrice" id="totalPrice${sno1}" readonly="" autocomplete="off" type="text" value="${type.totalPrice}"> 
                                                            </tr>
                                                            <c:set var="sno1" value="${sno1+1}"></c:set>
                                                        </c:forEach>
                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        function addToGrid(val1, val2, val3, val4, val5, val6, val7, val8) {
                                                            var valid1 = true;
                                                            if (valid1 === true) {

                                                                $('#resourcetable tr').each(function () {
                                                                    $(this).find('td').each(function () {
                                                                        var a = $(this).find('#itemCode').val();

                                                                        if (a === val1) {
                                                                            alert('Record already added to grid');
                                                                            document.getElementById('td').value = "";
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }
                                                                    });
                                                                });
                                                                if (val1 != "")
                                                                {
                                                                    var total;
                                                                    if (val6 != "" && val7 != "") {
                                                                        total = val8;
                                                                    } else {
                                                                        total = 0.0;
                                                                    }
                                                                    var table = document.getElementById("resourcetable");
                                                                    var slNo1 = table.rows.length;
                                                                    var slNo = count;
                                                                    var tr = table.insertRow(slNo1);
                                                                    tr.id = 'list_tr_' + slNo;
                                                                    tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow(' + slNo + ')" style=""></button><input name="sno" type="hidden" value=""> </td>' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="itemCategory" id="itemCategory" value="' + val4 + '" style="border: none"></td>' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="itemName" id="itemName1" value="' + val2 + '" style="border: none"></td>' +
                                                                            '<input style="width: 100%; text-align:left;" class="form-control" type="hidden" readonly name="itemCode" id="itemCode" value="' + val1 + '" style="border: none">' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="uom" id="itemUom" value="' + val5 + '" style="border: none"></td>' +
                                                                            '<input style="width: 100%; text-align:left;" class="form-control" type="hidden" readonly name="itemDesc" id="itemDesc" value="' + val3 + '" style="border: none">' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" required name="qty" id="qty' + slNo + '" maxlength="10" value="' + val6 + '" style="border: none" onkeypress="return isNumberKey(event)"></td>' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" required name="price" id="price' + slNo + '" value="' + val7 + '" maxlength="10" style="border: none" onchange="Caltotal(this,' + slNo + ');" onkeypress="return isNumberKey(event)"></td>' +
                                                                            '<td class="tinput"><input style="width: 100%; text-align:right;" class="form-control" type="text" readonly name="totalPrice" id="totalPrice' + slNo + '" value="' + total + '" style="border: none" ></td>';
                                                                }

                                                                count++;
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
                                                    <script>
                                                        function uom(id) {
                                                            var uom1;
                                                            var uom2;
                                                            var priority = document.getElementById('priority').value;
                                                            if (priority == 'LOW') {
                                                                uom1 = 'MEDIUM';
                                                                uom2 = 'HIGH';
                                                            } else if (priority == 'MEDIUM') {
                                                                uom1 = 'LOW';
                                                                uom2 = 'HIGH';
                                                            } else {
                                                                uom1 = 'LOW';
                                                                uom2 = 'MEDIUM';
                                                            }
                                                            ('#' + id + '').val($(('#' + id + '')).append(new Option(uom1, uom1), new Option(uom2, uom2)));

                                                        }

                                                        function uomdisplay(c, slNo)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchReq/uomlist.htm",
                                                                data: {code: c},
                                                                success: function (data) {
//                                                                    alert(data);
                                                                    //                        
                                                                    $('#requisitionUom' + slNo).html("");

                                                                    var nameArray = data.split(",");
                                                                    var toAppend = '';

                                                                    // toAppend += '<option value="">Select an Option</option>';                                                                   
//                                                                    for (var i = 0; i < nameArray.length; i++) {
                                                                    if (nameArray[0] != "") {
                                                                        toAppend += '<option value=' + '1' + '-' + nameArray[0] + '>' + nameArray[0] + '</option>';
                                                                    }
                                                                    if (nameArray[1] != "" && nameArray[1] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[4] + '-' + nameArray[1] + '>' + nameArray[1] + '</option>';

                                                                    }
                                                                    if (nameArray[2] != "" && nameArray[2] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[5] + '-' + nameArray[2] + '>' + nameArray[2] + '</option>';
                                                                    }
                                                                    if (nameArray[3] != "" && nameArray[3] !== 'null') {
                                                                        toAppend += '<option value=' + nameArray[6] + '-' + nameArray[3] + '>' + nameArray[3] + '</option>';
                                                                    }

//                                                                    }
                                                                    $('#requisitionUom' + slNo).append(toAppend);
                                                                },
                                                                error: function (error) {
                                                                    alert(error);
                                                                }

                                                            });
                                                        }

                                                        function unitPrice(c, slNo, suppCode)
                                                        {
                                                            $.ajax({
                                                                type: "POST",
                                                                url: "../purchReq/unitPrice.htm",
                                                                data: {
                                                                    code: c,
                                                                    suppCode: suppCode
                                                                },
                                                                success: function (data) {
                                                                    //                                                                    alert(data);   
                                                                    $('#unitPrice' + slNo).val(parseFloat(data));

                                                                },
                                                                error: function (error) {
                                                                    alert(error);
                                                                }

                                                            });
                                                        }


                                                        function checkGrid() {
                                                            var table = document.getElementById("resourcetable");
                                                            var slNo = table.rows.length - 1;
                                                            if (slNo < 0) {
                                                                alert("Please add data in grid");
                                                                return false;
                                                            } else {
                                                                return true;
                                                            }
                                                        }
                                                        $(document).on('click', '#deleteRowcert', function () {

                                                            var $itemRow = $(this).closest('tr');
                                                            var discount = $itemRow.find('#sno').val();

                                                            var s = $('#deleteRows').val();
                                                            if (s == "") {
                                                                //$('#sSavesnoedu').val(discount);
                                                                document.getElementById("deleteRows").value = discount;
                                                            } else {
                                                                $('#deleteRows').val(s + '//' + discount);
                                                            }

                                                            deleteRowedu(this);
                                                        });

                                                        function deleteRowedu(row) {
                                                            var rowCount = $('#resourcetable tr').length;
                                                            // alert(rowCount);
                                                            if (rowCount > 1) {

                                                                $(row).parents('.item-row').remove();
                                                                return true;
                                                            }
                                                            else {
                                                                alert("You cannot delete this row");
                                                            }
                                                            return false;
                                                        }
                                                    </script>
                                                </table>                        
                                            </c:if>
                                        </div>
                                        <br/>
                                        <div class="x_panel">
                                            <ul class="nav nav-tabs" >                           
                                                <li class="active"><a href="#">Additional Documents</a></li>
                                            </ul>
                                            <div id="tag3"><jsp:include page="../purchase/additionalDocumentsForm1.htm?poNo=${poNo}"></jsp:include></div>
                                            </div>
                                            <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../purchase/poList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 
                                            </div>
                                        </c:if>
                                        <br/>
                                    </div> 
                                </div>
                            </div>
                        </form>
                    </div>


                </div>

            </div>
        </div>

        <script>
            $(document).ready(function () {
            });
            function  getItemSubCat() {

                var itemCat = document.getElementById("itemCat").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../itemmaster/getItemSubCat.htm',
                            data: {
                                itemCat: itemCat
                            },
                            success: function (data) {
                                //alert(data);
                                displayitmSubCat(data);
                                $('#itemsubCat').val(data);
                            }
                        });

            }


            function displayitmSubCat(data)
            {
                if (data != null)
                {

                    $('#itemsubCat').html("");

                    var nameArray = data.split(",");
                    var toAppend = '';

                    toAppend += '<option value="">Select an Option</option>';
                    for (var i = 0; i < nameArray.length; i++) {
                        toAppend += '<option>' + nameArray[i] + '</option>';
                    }
                    $('#itemsubCat').append(toAppend);

                }
                else {
                    alert("error");
                }

            }

            function isNumberKey(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                    return false;
                }
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }

            var grandTotal = 0.0;
            function calTotal(sno)
            {
                var qty = $('#qty' + sno).val();
                var unitPrice = $('#unitPrice' + sno).val();
                var convFact = $('#requisitionUom' + sno).val();
                var conVal = convFact.split("-");
                if (qty == "0")
                {
                    alert("Invalid Quantity...!!");
                    $('#qty' + sno).val('');
                    $('#totalPrice' + sno).val('');
                    return false;

                }
                if (qty != '' && qty != null)
                {
                    var price = parseFloat(qty) * parseFloat(unitPrice) / parseFloat(conVal[0]);
                    $('#totalPrice' + sno).val(parseFloat(price).toFixed(3));
                }

            }

        </script>
        <script type="text/javascript">


            var myWindow = null;
            function openWindow() {

                myWindow = window.open("../purchReq/deliveryLocPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectSupplier() {
                var a = document.getElementById("SuppType").value;
                alert(a);

                if (a == 'Supplier Master')
                {

                    myWindow = window.open("../purchase/selectSupplier.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");

                }
                else if (a == 'Final Quotation')
                {
                    myWindow = window.open("../purchase/selectSupplier1.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }



            function parent_disable() {
                if (myWindow && !myWindow.closed)
                    myWindow.focus();
            }


            jQuery(document).ready(function () {
                //jQuery("#schDetForm").validationEngine();
            });

            function selectdate(val) {

                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
                //$('#test').attr();
                //document.getElementById("hiddentr").value=$itemRow.index();

            }

            function test() {
                var table = document.getElementById("resourcetable");
                var slNo = table.rows.length - 1;
                if (slNo < 0) {
                    alert("Please add data in grid");
                    return false;
                } else {
                    return true;
                }
                //alert(slNo);
            }

            function myFunction1(val) {

                var div3 = document.getElementById('editable2');
                var div4 = document.getElementById('noneditable2');
                if (val == 'yes') {
                    $("#editable2 :input").attr("disabled", false);
                    $("#noneditable2 :input").attr("disabled", true);
                    div4.style.display = "none";
                    div3.style.display = "block";
                    return false;

                }

            }

            function myFunction2(val) {
                var div5 = document.getElementById('editable2');
                var div6 = document.getElementById('noneditable2');
                if (val == 'No') {
                    $("#editable2 :input").attr("disabled", true);
                    $("#noneditable2 :input").attr("disabled", false);
                    div5.style.display = "none";
                    div6.style.display = "block";
                    return false;

                }

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
                if (keycode == 8 || keycode == 9 || keycode == 46 || keycode == 13) {
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

        </script>
        <script>
            NProgress.done();
        </script>

        <script src="../CRM/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>
    </body>

</html>
