<%-- 
    Document   : complaintApprovalForm1
    Created on : 18 Oct, 2016, 11:06:17 AM
    Author     : ebs-sdd27
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>arête Assets Management</title>
        <script type="text/javascript">
            function Validate($this)
            {
                var fl = document.getElementById("attachmentName").value;
                var fileSize = $this.files[0];
                var sizeInMb = fileSize.size / 1024;
                var sizeLimit = 1024 * 2;
                if (sizeInMb > sizeLimit) {
                    alert("File Size Exceeded(Only 2MB Allowed)");
                    $($this).val('');
                    return;
                }
                var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
                if (!fl.match(fmt))
                {
                    alert('Invalid File');
                    $($this).val('');
                    return false;
                }

                else {
                    return true;
                }

            }


            function selectcust()
            {
                var x = document.getElementById("division").value;


                if (x === '')
                {
                    alert("Please Select Division");
                    return false;
                }
                else {

                    myWindow = window.open("../CRM/selectCustomer.htm?division=" + x, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                }

            }

            function selectTenantDetails()
            {
                myWindow = window.open("../CRM/tenantDetailsForComplaint.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }



        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-sm">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">

                        <div class="page-title">

                        </div>
                        <div class="clearfix"></div>





                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Complaints&tab=Approval 2&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Complaint Details  </h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <c:forEach items="${complaintFormData}" var="list">
                                        <c:if test="${list[0] eq '297'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '298'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '299'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '300'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '301'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '302'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${complaintList}" var="type">
                                        <c:forEach items="${assetDetails}" var="asset">
                                            <c:if test="${asset.assetCode eq type.assetName}">
                                                <c:set var="assetName1" value="${asset.assetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                        <c:forEach items="${subAssetDetails}" var="subasset">
                                            <c:if test="${subasset.subAssetCode eq type.assetNo}">
                                                <c:set var="subAssetName1" value="${subasset.subAssetName}"/>

                                            </c:if> 
                                        </c:forEach>
                                    </c:forEach>


                                    <form class="form-inline" id="complaintForm" accept-charset="UTF-8" method="post" action="../CRM/approveComplaintFormSubmit1.htm" enctype="multipart/form-data" >

                                        <div>

                                            <c:if test="${fieldStatus_1 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_1 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_1}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input name="tenantName" id="tenantName" readonly="" ${mand_status_1} type="text" maxlength="30" class="form-control" value="${type.tenantName}" >
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="tenantName"  name="tenantName" readonly class="form-control" value="${type.tenantName}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <input name="tenantName" id="tenantName"  maxlength="30" ${mand_status_1} type="text" readonly="" class="form-control validate[required]"placeholder="Select Tenant Name"  value="" onclick="selectTenantDetails();"> 
                                                            <input name="complaintCode" type="hidden" value="">

                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>
                                            <c:if test="${fieldStatus_2 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_2 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_2}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" id="firstName" name="propertyName" ${mand_status_2} class="form-control validate[required]"  readonly value="${assetName1}">

                                                                        <input name="sno" type="hidden" value="${type.sno}">
                                                                        <input name="complaintCode" type="hidden" value="${type.complaintCode}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="propertyName"  name="propertyName" readonly class="form-control" value="${type.assetName}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="propertyName" name="propertyName"  readonly="" ${mand_status_2} class="form-control " placeholder="" onclick="selectcust();" value="${customerName}">

                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>
                                            <c:if test="${fieldStatus_3 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_3 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_3}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" id="propertyNo" name="propertyNo" ${mand_status_3} class="form-control validate[required]"  readonly value="${subAssetName1}">

                                                                        <input name="sno" type="hidden" value="${type.sno}">
                                                                        <input name="status" type="hidden" value="${type.status}">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="propertyNo"  name="propertyNo" readonly class="form-control" value="${type.assetNo}">
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="propertyNo" name="propertyNo"  readonly="" ${mand_status_3}  class="form-control " placeholder="" onclick="selectcust();" value="${customerName}">

                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>

                                            <p>&nbsp;</p>

                                            <c:if test="${fieldStatus_4 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_4 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <label class="control-label">${field_4}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <input type="text" id="date" name="date" readonly="" onmouseover="" ${mand_status_4} style="cursor: pointer;"  placeholder="Select Date" class="form-control validate[required]"   value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.date}"/>">

                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <input type="text" id="date" name="date" readonly="" onmouseover="" style="cursor: pointer;"  value="<fmt:formatDate pattern="dd-MMM-yyyy"  value="${type.date}"/>" class="form-control"  >
                                                                    </c:otherwise> 
                                                                </c:choose>

                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" id="date" name="date" readonly="" onmouseover="" ${mand_status_4} style="cursor: pointer;" value="" placeholder="Select Date" class="form-control validate[required]" onclick="javascript:NewCssCal('date', 'ddMMMyyyy')" >

                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>

                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a style="font-size: 15px; margin-top: 0px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label" style="margin-top: 0px;">${field_5}</label>

                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea class="form-control " style="resize: none" readonly="" maxlength="200" rows="1" ${mand_status_5} name="remarks"  id="remarks" type="text" value="${type.remarks}" >${type.remarks} </textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea class="form-control" style="resize: none"  maxlength="200" readonly rows="1" type="text" value="${type.remarks}">${type.remarks}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <textarea class="form-control " style="resize: none" maxlength="200" rows="1" value="" ${mand_status_5} name="remarks" id="remarks" type="text"></textarea>



                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                            <c:if test="${fieldStatus_6 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_6 eq 'required'}">
                                                        <a class="control-label-required" style="color:red;">*</a>
                                                    </c:if>
                                                    <a style="font-size: 15px;margin-top:-21px;color:transparent;font-weight: bold;">*</a>
                                                    <label class="control-label">${field_6}</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(complaintList) > 0}">
                                                            <c:forEach items="${complaintList}" var="type">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea class="form-control" readonly="" rows="1" ${mand_status_6} style="resize: none" maxlength="200" name="compensation"  id="compensation" type="text" >${type.compensationExpected} </textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea class="form-control" style="resize: none"  maxlength="200" readonly rows="1" type="text" >${type.compensationExpected}</textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <textarea class="form-control" style="resize: none" ${mand_status_6} value="" rows="1"  maxlength="200" name="compensation" id="compensation" type="text"></textarea>

                                                        </c:otherwise>        
                                                    </c:choose>
                                                </div>
                                            </c:if>
                                            <p>&nbsp;</p>
                                            <c:if test="${fieldStatus_5 eq 'y'}">
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                    <c:if test="${mand_status_5 eq 'required'}">
                                                        <a style="font-size: 15px; margin-top: 0px;color:red;font-weight: bold;">*</a>
                                                    </c:if>
                                                    <label class="control-label" style="margin-top: 0px;">Approver Remarks</label>
                                                    <c:choose>
                                                        <c:when test="${fn:length(quoteList) > 0}">
                                                            <c:forEach items="${quoteList}" var="list">
                                                                <c:choose>
                                                                    <c:when test="${action eq 'edit'}">
                                                                        <textarea style="resize: none" type="text" maxlength="200" rows="1" required class="form-control"  id="approverRemarks" name="approverRemarks" value=""></textarea>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <textarea style="resize: none" type="text" maxlength="200" rows="1" class="form-control"  id="approverRemarks" value=""></textarea>
                                                                    </c:otherwise> 
                                                                </c:choose>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>                                                    
                                                            <textarea style="resize: none" type="text" placeholder="Enter Approver Remarks" maxlength="200" rows="1" required class="form-control" required="" id="approverRemarks" name="approverRemarks" value=""></textarea>
                                                        </c:otherwise>        
                                                    </c:choose>

                                                </div>
                                            </c:if>





                                        </div>    
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <p>&nbsp;</p>
                                        <div>
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--<th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody> 
                                                    <c:forEach items="${complaintList}" var="list">
                                                        <c:set var="gfcremarks" value="${list.attribute1}" /> 
                                                        <c:if test="${gfcremarks ne null}">
                                                            <tr>
                                                                <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                                <!--<td class="center" style="text-align: left;">${list.userId}</td>-->
                                                                <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${list.lastmodefiedDate}" /></td>
                                                                <td class="center" style="text-align: left;">${gfcremarks}</td>
                                                            </tr>
                                                        </c:if>

                                                    </c:forEach> 
                                                </tbody>
                                            </table>
                                        </div>
                                        <p>&nbsp;</p> 
                                        <!--                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                                                            <button type="submit" class="btn btn-primary" style="padding-right: 30px;padding-left: 30px;" > Save </button>
                                                                            <a href="../CRM/complaintList.jsp"  class="btn btn-primary"  style="padding-right: 30px;padding-left: 30px;">Cancel</a>
                                                                        </div>
                                                                    </div>-->
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <!--<button type="submit" class="btn btn-primary" style=""> Resolving Authority </button>-->
                                                <button type="submit" class="btn btn-primary" style=""> Approve </button>
                                                <a href="../CRM/complaintApprovalList1.htm"  class="btn btn-danger"  style="">Cancel</a>
                                            </div>
                                        </c:if>

                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <br/>


                        <div class="clearfix"></div>

                        <div class="clearfix"></div>                

                        <!-- /page content -->

                    </div>

                </div>
            </div>

            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-inline">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-inline" class="tabbed_notifications"></div>
            </div>
            <script>
                $(document).ready(function () {
                    $("#complaintForm").validationEngine();

                });
                NProgress.done();
            </script>

    </body>

</html>
