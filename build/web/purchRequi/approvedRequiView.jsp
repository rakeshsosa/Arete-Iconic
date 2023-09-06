<%-- 
    Document   : approvedRequiView
    Created on : 20 Oct, 2016, 4:36:46 PM
     Author     : shweta s sakri
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="../common/validate/moment.js" type="text/javascript"></script>

        <title>arête Assets Management</title>
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
                                <jsp:include page="../login/headerlink.htm?submodule=Purchase Requisition&tab=Approved Requisition&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Purchase Requisition Approval Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="requiForm" class="form-inline" action="../purchase/RequiApprov3Submit.htm" method="post" enctype="multipart/form-data">

                                        <c:forEach items="${purchase}" var="list">                                       
                                            <c:if test="${list[0] eq '341'}">
                                                <c:set value="${list[1]}" var="field_341"/>
                                                <c:set value="${list[2]}" var="fieldStatus_341"/>
                                                <c:set value="${list[3]}" var="mand_status_341"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '342'}">
                                                <c:set value="${list[1]}" var="field_342"/>
                                                <c:set value="${list[2]}" var="fieldStatus_342"/>
                                                <c:set value="${list[3]}" var="mand_status_342"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '343'}">
                                                <c:set value="${list[1]}" var="field_343"/>
                                                <c:set value="${list[2]}" var="fieldStatus_343"/>
                                                <c:set value="${list[3]}" var="mand_status_343"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '344'}">
                                                <c:set value="${list[1]}" var="field_344"/>
                                                <c:set value="${list[2]}" var="fieldStatus_344"/>
                                                <c:set value="${list[3]}" var="mand_status_344"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '345'}">
                                                <c:set value="${list[1]}" var="field_345"/>
                                                <c:set value="${list[2]}" var="fieldStatus_345"/>
                                                <c:set value="${list[3]}" var="mand_status_345"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '346'}">
                                                <c:set value="${list[1]}" var="field_346"/>
                                                <c:set value="${list[2]}" var="fieldStatus_346"/>
                                                <c:set value="${list[3]}" var="mand_status_346"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '347'}">
                                                <c:set value="${list[1]}" var="field_347"/>
                                                <c:set value="${list[2]}" var="fieldStatus_347"/>
                                                <c:set value="${list[3]}" var="mand_status_347"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '348'}">
                                                <c:set value="${list[1]}" var="field_348"/>
                                                <c:set value="${list[2]}" var="fieldStatus_348"/>
                                                <c:set value="${list[3]}" var="mand_status_348"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '349'}">
                                                <c:set value="${list[1]}" var="field_349"/>
                                                <c:set value="${list[2]}" var="fieldStatus_349"/>
                                                <c:set value="${list[3]}" var="mand_status_349"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '350'}">
                                                <c:set value="${list[1]}" var="field_350"/>
                                                <c:set value="${list[2]}" var="fieldStatus_350"/>
                                                <c:set value="${list[3]}" var="mand_status_350"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '351'}">
                                                <c:set value="${list[1]}" var="field_351"/>
                                                <c:set value="${list[2]}" var="fieldStatus_351"/>
                                                <c:set value="${list[3]}" var="mand_status_351"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '352'}">
                                                <c:set value="${list[1]}" var="field_352"/>
                                                <c:set value="${list[2]}" var="fieldStatus_352"/>
                                                <c:set value="${list[3]}" var="mand_status_352"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '353'}">
                                                <c:set value="${list[1]}" var="field_353"/>
                                                <c:set value="${list[2]}" var="fieldStatus_353"/>
                                                <c:set value="${list[3]}" var="mand_status_353"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '354'}">
                                                <c:set value="${list[1]}" var="field_354"/>
                                                <c:set value="${list[2]}" var="fieldStatus_354"/>
                                                <c:set value="${list[3]}" var="mand_status_354"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '355'}">
                                                <c:set value="${list[1]}" var="field_355"/>
                                                <c:set value="${list[2]}" var="fieldStatus_355"/>
                                                <c:set value="${list[3]}" var="mand_status_355"/>
                                            </c:if>

                                        </c:forEach> 

                                        <c:forEach items="${approvList}" var="type">
                                            <c:forEach items="${assetCode}" var="list">
                                                <c:if test="${list.assetCode eq type.assetCategory}">
                                                    <c:set var="asstNam" value="${list.assetName}"/>  
                                                    <c:set var="asstCod" value="${list.assetCode}"/> 
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${subAssetCode}" var="list1">
                                                <c:if test="${list1.subAssetCode eq type.subAssetCategory}">
                                                    <c:set var="subasstNam" value="${list1.subAssetName}"/>  
                                                    <c:set var="subasstCod" value="${list1.subAssetCode}"/> 
                                                </c:if>
                                            </c:forEach>
                                            <c:set var="requisitionNo" value="${type.requisitionNo}"/>
                                            <c:set var="requiOnDate" value="${type.requiOnDate}"/>                                          
                                            <c:set var="deliveryLocation" value="${type.deliveryLocation}"/>
                                            <c:set var="paymentTerms" value="${type.paymentTerms}"/>
                                            <c:set var="remarks" value="${type.remarks}"/>                                        
                                        </c:forEach>

                                        <c:if test="${fieldStatus_342 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_342 eq 'required'}">
                                                    <a style="color:red;">*</a>                                                  
                                                </c:if>
                                                <label class="control-label">${field_342}</label>                                                                                                                                       
                                                <input class="form-control  input-xlarge" ${mand_status_342} name="requiOnDate" id="requiOnDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${requiOnDate}"/>" >
                                                <input  type="hidden" name="requisitionNo" value="${requisitionNo}">
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_343 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_343 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_343}</label>                                                                                            
                                                <input type="text" class="form-control" ${mand_status_343} readonly="" id="assetCategory" name="assetCategory" value="${asstNam}">                                                                                     
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_344 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_344 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_344}</label>                                                                                            
                                                <input type="text" class="form-control" ${mand_status_344} readonly="" id="subAssetCategory" name="subAssetCategory" value="${subasstNam}">                                                                                      
                                            </div>
                                        </c:if>
                                        <br/><br/><br/>
                                        <c:if test="${fieldStatus_349 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_349 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_349}</label>                                                                                            
                                                <input style="" type="text" class="form-control" ${mand_status_349} readonly="" id="deliveryLocation" name="deliveryLocation" value="${deliveryLocation}">                                                                                    
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_351 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_351 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_351}</label>                                                                                            
                                                <input type="text" style="" class="form-control" readonly="" name="paymentTerms" id="paymentTerms" value="${paymentTerms}">                                                                                   
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_350 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">                                             
                                                <a style="color:transparent;">*</a>                                                
                                                <label style="margin-top:-16px;" class="control-label">${field_350}</label>                                                                                            
                                                <textarea name="remarks" id="remarks" class="form-control" readonly="" rows="1" style="resize: none;">${remarks}</textarea>                                                                                  
                                            </div>
                                        </c:if>

                                        <!--                                         <div class="col-md-4 col-sm-12 col-xs-12 form-inline"> 
                                                                                     <a style="color:transparent;">*</a>
                                                                                        <label class="control-label">Account Manager Remarks</label>                                                                                            
                                                                                        <textarea name="reviewerComments1" id="reviewerComments1" class="form-control" readonly="" rows="1" style="resize: none">${approvar1Remark}</textarea>                                                                                  
                                                                                    </div>-->

                                        <!--                                             <div class="col-md-4 col-sm-12 col-xs-12 form-inline"> 
                                                                                     <a style="color:transparent;">*</a>
                                                                                        <label class="control-label">GFC Remarks</label>                                                                                            
                                                                                        <textarea name="reviewerComments2" id="reviewerComments2" class="form-control" readonly="" rows="1" style="resize: none">${approvar2Remark}</textarea>                                                                                  
                                                                                    </div>-->
                                        <div class="clearfix"></div>

                                        <div id="div1" >                                   
                                            <div class="clearfix"></div>
                                            <p>&nbsp;</p>
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th style="color:#fff;">Action</th>                                                           
                                                            <th style="color:#fff;"><span style="color: red">*</span>Accessory Name</th>       
                                                            <th style="color:#fff;">Accessory Description</th>
                                                            <th style="color:#fff;"><span style="color: red">*</span>Quantity</th>                         
                                                            <th style="color:#fff;"><span style="color: red">*</span>Required Date</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                        <c:forEach items="${approvList}" var="type">                                                          
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id=""><input type="hidden" id="sno"  name="sno" value=""/><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                <td><c:forEach items="${itemCod}" var="list">
                                                                        <c:if test="${list.itemCode eq type.itemCode}">
                                                                            <c:set var="itmNam" value="${list.itemName}"></c:set>
                                                                            <c:set var="itmDesc" value="${list.itemDesc}"></c:set>
                                                                        </c:if>
                                                                    </c:forEach><input type="hidden" id="sno"  name="sno" value="${type.sno}"/>
                                                                    <input class="form-control" style="text-align: left;" name="itemName" id="itemName" readonly="" autocomplete="off" type="text" maxlength="30" value="${itmNam}"></td>
                                                                <td><input class="form-control" style="text-align: left;" name="itemDesc" id="itemDesc" readonly autocomplete="off" type="text" maxlength="500" value="${itmDesc}"></td>
                                                                <td><input class="form-control" style="text-align: right;" name="quantity" id="quantity" readonly autocomplete="off" type="text" maxlength="30" value="${type.quantity}"></td>
                                                                <td><input class="form-control" style="text-align: left;"  name="requiredDate" id="requiredDate" readonly autocomplete="off" type="text" min="8" maxlength="11" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.requiredDate}"/>"> 

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table> 
                                            </div>
                                        </div>
                                        <!--for edit-->    

                                        <p>&nbsp;</p>

                                        <div class="x_panel">
                                            <ul class="nav nav-tabs" >                           
                                                <li class="active"><a href="#">Additional Documents</a></li>

                                            </ul>
                                            <div id="tag3"><jsp:include page="../purchase/additionalDocumentsForm.htm?requisitionNo=${requisitionNo}"></jsp:include></div>
                                            </div>
                                            <p>&nbsp;</p>  
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--                                                        <th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody>   
                                                <c:forEach items="${approvList}" var="list">                                            
                                                    <c:set var="approvar1Remark" value="${list.approvar1Remark}"/>
                                                    <c:set var="approvar2Remark" value="${list.approvar2Remark}"/>  
                                                    <c:set var="approvar3Remark" value="${list.approvar3Remark}"/>
                                                    <c:set var="userId" value="${list.userId}"/> 
                                                    <c:set var="lastmodifiedDate" value="${list.lastmodifiedDate}"/> 
                                                </c:forEach>
                                                <c:if test="${approvar1Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>Account Manager</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar1Remark}</td>
                                                    </tr>
                                                </c:if> 
                                                <c:if test="${approvar2Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>GFC</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar2Remark}</td>
                                                    </tr>
                                                </c:if> 
                                                <c:if test="${approvar3Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>CFO</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar3Remark}</td>
                                                    </tr>
                                                </c:if> 

                                            </tbody>
                                        </table>
                                    </form>
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
        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

    </body>

</html>


