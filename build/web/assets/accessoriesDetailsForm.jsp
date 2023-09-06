
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html lang="en">

                        <head>
                            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                            <!-- Meta, title, CSS, favicons, etc. -->
                            <meta charset="utf-8">
                            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                            <meta name="viewport" content="width=device-width, initial-scale=1">
                            </head>

                        
                    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=Property Area Management&tab=Accessories Tagging&pagetype=form"/>
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
                                                <form class="form-inline row" id="accessory" action="../assets/accessoriesDetailsFormSubmit.htm"  method="post" onsubmit="return checkGrid();" enctype="multipart/form-data">
                                                    <c:forEach items="${test}" var="list">
                                                        <c:if test="${list[0] eq '273'}">
                                                            <c:set value="${list[1]}" var="field_1"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '274'}">
                                                            <c:set value="${list[1]}" var="field_2"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '275'}">
                                                            <c:set value="${list[1]}" var="field_3"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '276'}">
                                                            <c:set value="${list[1]}" var="field_4"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '277'}">
                                                            <c:set value="${list[1]}" var="field_5"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '278'}">
                                                            <c:set value="${list[1]}" var="field_6"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '279'}">
                                                            <c:set value="${list[1]}" var="field_7"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '280'}">
                                                            <c:set value="${list[1]}" var="field_8"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '281'}">
                                                            <c:set value="${list[1]}" var="field_9"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                                        </c:if>
                                                        <c:if test="${list[0] eq '612'}">
                                                            <c:set value="${list[1]}" var="field_10"/>
                                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                                        </c:if>
            
            
                                                    </c:forEach> 
                                                    <c:forEach items="${accessoryDetails}" var="list">
                                                        <c:set value="${list.assetCode}" var="assetCode"/>
                                                        <c:set value="${list.SNo}" var="sno"/>
                                                        <c:set value="${list.subAssetCode}" var="subAssetCode"/>
                                                    </c:forEach>
                                                    <c:forEach items="${accessoryDetails2}" var="list1">
                                                        <c:set value="${list1.assetName}" var="assetName"/>
                                                    </c:forEach>
                                                    <c:forEach items="${accessoryDetails1}" var="list2">
                                                        <c:set value="${list2.subAssetName}" var="subAssetName"/>
                                                    </c:forEach>
            
                                                    <c:if test="${fieldStatus_1 eq 'y'}">
                                                        <div class="col-md-4 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(accessoryDetails) > 0}">
            
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" ${mand_status_1} readonly="" name="assetCode1" id="assetCode" value="${assetCode}">
                                                                            <input type="hidden" name="pk" value="${sno}">
                                                                            <input type="hidden" name="status" value="${list.status}">
                                                                            <input type="hidden" id="sSavesnoedu" name="sSavesnoedu" value="">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" id="assetCode" readonly="" value="${assetCode}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Select Property Code" class="form-control" ${mand_status_1} id="assetCode" readonly="" name="assetCode" maxlength="40" value="" onclick="return selectAccAssetDetails();">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">${field_1}
                                                            <c:if test="${mand_status_1 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if>
                                                            </label>
                                                        </div>
                                                    </c:if>
            
                                                    <c:if test="${fieldStatus_2 eq 'y'}">
                                                        <div class="col-md-4 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(accessoryDetails) > 0}">
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">
                                                                            <input type="text" class="form-control" ${mand_status_2} readonly="" id="assetName" name="assetName" value="${assetName}">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <input type="text" class="form-control" readonly="" id="assetName" value="${assetName}">
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" placeholder="Fill"  class="form-control" ${mand_status_2} id="assetName" readonly="" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" onfocus="return changeFloor();">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">${field_2}
                                                            <c:if test="${mand_status_2 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if>
                                                            </label>
                                                        </div>
                                                    </c:if>
            
                                                    <c:if test="${fieldStatus_3 eq 'y'}">
                                                        <div class="col-md-4 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(accessoryDetails) > 0}">
                                                                    <input type="text" class="form-control" readonly="" id="subAssetCode" name="subAssetCode" value="${subAssetCode}">
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Select Flat Code" class="form-control" ${mand_status_3} id="subAssetCode" readonly="" name="subAssetCode"  maxlength="40" value="" onclick="return selectSubAssetDetails();">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">${field_3}
                                                            <c:if test="${mand_status_3 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if>
                                                            </label>
                                                        </div>
                                                    </c:if>
            
                                                    <c:if test="${fieldStatus_4 eq 'y'}">
                                                        <div class="col-md-4 form-floating mb-3">
                                                            <c:choose>
                                                                <c:when test="${fn:length(accessoryDetails) > 0}">
                                                                    <input type="text" class="form-control" readonly="" name="subAssetName" value="${subAssetName}">
                                                                </c:when>
                                                                <c:otherwise>                                                    
                                                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_4} id="subAssetName" name="subAssetName" readonly="" maxlength="40" value="">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <label class="control-label">${field_4}
                                                            <c:if test="${mand_status_4 eq 'required'}">
                                                                <a style="color:red;">*</a>
                                                            </c:if>
                                                            </label>
                                                        </div>
                                                        </c:if>
                                                        
                                                    <c:if test="${action ne 'view' && action ne 'edit'}" >
                                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                                            <div class="col-md-4 form-floating mb-3">
                                                                
                                                                <input type="text" placeholder="Select Accessory Code" readonly="" class="form-control" ${mand_status_9} id="accessoryCode"  maxlength="40" value="" onclick="return selectAccessoryDetails();" onblur="return checkAccessory();">
                                                                <label class="control-label">${field_9}
                                                                <c:if test="${mand_status_9 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if>
                                                                </label>
                                                            </div>
                                                        </c:if>
            
                                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                                            <div class="col-md-4 form-floating mb-3">                                                    
                                                                <input type="text" placeholder="Fill" readonly="" class="form-control" ${mand_status_5} id="accessoryCategory" maxlength="40" value="">
                                                                <label class="control-label">${field_5}
                                                                <c:if test="${mand_status_5 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if>
                                                                </label>
                                                            </div>
                                                        </c:if>
            
                                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                                            <div class="col-md-4 form-floating mb-3">
                                                                <input type="text" placeholder="Fill" readonly="" class="form-control" ${mand_status_6} id="accessoryName" maxlength="40" value="">
                                                                <label class="control-label">${field_6}
                                                                <c:if test="${mand_status_6 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                        
                                                        <c:if test="${fieldStatus_10 eq 'y'}">
                                                            <div class="col-md-4 form-floating mb-3">
                                                                <input type="text" placeholder="Fill" class="form-control" id="quantity"  maxlength="40" value="" onkeypress="return checkdigit(event, this, 10, 0);">
                                                                <label class="control-label">${field_10}
                                                                <c:if test="${mand_status_10 eq 'required'}">
                                                                    <a style="color:red;">*</a>
                                                                </c:if>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                        
                                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                                            <div class="col-md-4 form-floating mb-3">                                                    
                                                                <textarea  class="form-control" placeholder="Fill" ${mand_status_7} id="remarks" rows="1" style="resize: none" value="" type="text"></textarea>
                                                                <label style="margin-top:-21px;" class="control-label">${field_7}
                                                                <c:if test="${mand_status_7 eq 'required'}">
                                                                    <a style="font-size: 15px;color:red;margin-top:-21px;font-weight: bold;">*</a>
                                                                </c:if>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                    </c:if>
            
                                                    <br>
            
                                                    <div class="col-md-12 col-sm-12">                                 
                                                        <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                                        <input type="hidden" name="count" value="1" />
                                                        <c:choose>
                                                            <c:when test="${fn:length(accessoryDetails2) > 0}">
                                                                <c:forEach items="${accessoryDetails2}" var="list">
            
                                                                    <c:choose>
                                                                        <c:when test="${action eq 'edit'}">   
                                                                            <c:set var="i" value="1"/> 
                                                                            <c:forEach items="${accessoryAttach}" var="list">
            
            
                                                                                <div class="removeattach" id="del${i}">
                                                                                    <div id="field" class="col-md-12 col-sm-12">
                                                                                        <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                                        <a href="../assets/subAssetAttachDownload.htm?SNo=${list.SNo}"  >
                                                                                            <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > <span> </span>
                                                                                        </a>                                                                        
                                                                                        <input type="hidden" id="attsno${i}" name="attsno" value="${list.SNo}">
                                                                                    </div>
                                                                                </div>
            
                                                                            </c:forEach>
                                                                            <c:set var="i" value="${i+1}"/>
                                                                            <input type="hidden" id="tobedel" name="tobedel" value="">
                                                                            <input type="hidden" name="count" value="1" />
                                                                            <div >
                                                                                <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                                    <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                                    <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                                    <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                                    <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                            setAttachName(1);"> 
                                                                                    <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                                    <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->
            
                                                                                </div>
                                                                                <button id="b1" class="btn add-more btn-primary btn-sm" type="button">+</button>
                                                                                <span class="nowrap">(Click press + to add another attachment)</span>
                                                                            </div> 
            
            
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:forEach items="${accessoryAttach}" var="list">
                                                                                <div>
                                                                                    <div id="field" class="col-md-12 col-sm-12">
            
                                                                                        <a href="../assets/subAssetAttachDownload.htm?SNo=${list.SNo}"  >
                                                                                            <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > 
                                                                                        </a><br><br/>
                                                                                    </div>
                                                                                </div>
                                                                            </c:forEach>
            
                                                                        </c:otherwise> 
                                                                    </c:choose>
                                                                </c:forEach>
                                                            </c:when>
                                                            <c:otherwise> 
                                                                <div >
                                                                    <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                        <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                        <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                        <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                        <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                setAttachName(1);"> 
                                                                        <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                        <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->
            
                                                                    </div>
                                                                    <button id="b1" class="btn add-more btn-primary mt-2 btn-sm" type="button">+</button>
                                                                    <span class="nowrap">(Click press + to add another attachment)</span>
                                                                </div>                                                </c:otherwise>        
                                                        </c:choose>
                                                    </div>
            
                                                    <c:if test="${action ne 'view'}" >
                                                        <p>&nbsp;</p>
                                                        <c:if test="${sno eq null}">
            
                                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                    <button type="button" class="btn btn-primary mb-3" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>
            
                                                                </div>
                                                            </div>
            
                                                            <div class="clearfix"></div>
            
            
            
                                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
            
                                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                                            <th><span style="color:red">*</span> Accessory Code</th>
                                                                            <th><span style="color:red">*</span> Accessory Category</th>
                                                                            <th><span style="color:red">*</span> Accessory Name</th>
                                                                            <th><span style="color:red">*</span> Quantity</th>
                                                                            <th>Remarks</th>
                                                                        </tr>
            
                                                                    </thead>
                                                                    <tbody id="resourcetable">
            
                                                                    </tbody>
                                                                    <script>
                                                                        var count = 0;
                                                                        function addOrderRow_test() {
            
            
                                                                            var valid1 = true;
                                                                            var x = document.getElementById('accessoryCode').value &&
                                                                                    document.getElementById('accessoryCategory').value &&
                                                                                    document.getElementById('accessoryName').value &&
                                                                                    document.getElementById('subAssetCode').value &&
                                                                                    document.getElementById('quantity').value &&
                                                                                    document.getElementById('assetCode').value;
            
                                                                            if (x == "" || x == null)
                                                                            {
                                                                                alert("Please Select Mandatory Fields");
                                                                                valid1 = false;
                                                                            }
            
            
            
                                                                            if (valid1 == true) {
                                                                                var assetCode1 = document.getElementById('assetCode').value;
                                                                                var subAssetCode1 = document.getElementById('subAssetCode').value;
                                                                                var accessoryCode1 = document.getElementById('accessoryCode').value;
                                                                                var accessoryCategory1 = document.getElementById('accessoryCategory').value;
                                                                                var accessoryName1 = document.getElementById('accessoryName').value;
                                                                                var quantity1 = document.getElementById('quantity').value;
            
                                                                                var remarks = document.getElementById('remarks').value;
                                                                                var table = document.getElementById("resourcetable");
            
                                                                                $('#resourcetable tr').each(function () {
                                                                                    var a = $(this).find('#accessoryCode11').val();
                                                                                    if (a == accessoryCode1) {
                                                                                        alert('Accessory Is Already Added');
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
                                                                                tr.innerHTML = '<td align="center" width:190px; class="tinput"><button type="button"  class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                                        + slNo + ')" ></button> </td>' +
                                                                                        '<td ><input class="form-control " style="text-align: left; width: 280px;" type="text" readonly id="accessoryCode11" name="accessoryCode1" value="' + accessoryCode1 +
                                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align: left; width: 280px;" type="text" readonly name="accessoryCategory1" value="' + accessoryCategory1 +
                                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align: left; width: 280px;" type="text" readonly name="accessoryName1" value="' + accessoryName1 +
                                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align: right; width: 280px;" type="text" readonly name="quantity1" value="' + quantity1 +
                                                                                        '" style="border: none"></td><td><input class="form-control " style="text-align: left; width: 280px;" type="text" readonly name="remarks1" value="' + remarks +
                                                                                        '" style="border: none"></td><input class="form-control " style="text-align:center;" type="hidden" readonly name="assetCode1"  value="' + assetCode1 +
                                                                                        '" style="border: none"><input class="form-control " style="text-align:center;" type="hidden" readonly name="subAssetCode1"  value="' + subAssetCode1 +
                                                                                        '" style="border: none">';
                                                                                count++;
                                                                                document.getElementById('accessoryCode').value = "";
                                                                                document.getElementById('accessoryCategory').value = "";
                                                                                document.getElementById('accessoryName').value = "";
                                                                                document.getElementById('quantity').value = "";
                                                                                document.getElementById('remarks').value = "";
            
                                                                            } else {
                                                                                return;
                                                                            }
            
                                                                            document.getElementById('assetCode').disabled = true;
                                                                            document.getElementById('subAssetCode').disabled = true;
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
                                                                                calc();
                                                                                return true;
                                                                            }
                                                                        }
            
                                                                    </script>
            
                                                                </table>                        
                                                            </div> 
                                                        </c:if>
                                                    </c:if>
            
                                                    <c:if test="${action eq 'view' || action eq 'edit'}" >                                            
                                                        <p>&nbsp;</p>
                                                        <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
            
                                                            <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                                <thead>
                                                                    <tr>
                                                                        <c:choose>
                                                                            <c:when test="${action eq 'edit'}">
                                                                                <th><i class="fa fa-trash fa-lg"style="width: 80px;"></i></th>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        <th><span style="color:red">*</span> Accessory Code</th>
                                                                        <th><span style="color:red">*</span> Accessory Category</th>
                                                                        <th><span style="color:red">*</span>Accessory Name</th>
                                                                        <th><span style="color:red">*</span>Quantity</th>
                                                                        <th>Remarks</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody id="currencytablemed">
                                                                    <c:forEach items="${accessoryDetails3}" var="list">
                                                                        <tr class="item-row"> 
                                                                            <c:choose>
                                                                                <c:when test="${action eq 'edit'}">
                                                                                    <td><img src="../common/cross.png" id="deleteRowedu"><input type="hidden" id="eduSNo"  name="eduSNo" value="${list[3]}"/> </td>
                                                                                    </c:when>
                                                                                </c:choose>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly="" name="accessoryCode1" autocomplete="off" type="text" maxlength="30" value="${list[0]}">
            
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly="" autocomplete="off" type="text" maxlength="30" value="${list[0]}">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly="" name="accessoryDesc1" autocomplete="off" type="text" maxlength="30" value="${list[2]}">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input class="form-control" style="text-align: left; width: 264px;"  readonly autocomplete="off" type="text" maxlength="30" value="${list[2]}">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly="" name="accessoryName1" autocomplete="off" type="text" maxlength="30" value="${list[1]}">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input class="form-control" style="text-align: left; width: 264px;"  readonly autocomplete="off" type="text" maxlength="30" value="${list[1]}">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </td>
            
            
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input class="form-control" style="text-align: right; width: 264px;" readonly="" name="quantity1" autocomplete="off" type="text" maxlength="30" value="${list[5]}">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input class="form-control" style="text-align: right; width: 264px;"  readonly autocomplete="off" type="text" maxlength="30" value="${list[5]}">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </td>
                                                                            <td>
                                                                                <c:choose>
                                                                                    <c:when test="${action eq 'edit'}">
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly="" name="remarks1" autocomplete="off" type="text" maxlength="100" value="${list[4]}">
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <input class="form-control" style="text-align: left; width: 264px;" readonly autocomplete="off" type="text" maxlength="100" value="${list[4]}">
                                                                                    </c:otherwise> 
                                                                                </c:choose>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
            
                                                            </table>
            
                                                        </div>
                                                    </c:if>
                                                    <p>&nbsp;</p>
            
                                                    <div>
                                                        <c:if test="${action ne 'view'}">
            
                                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                                <a href="../assets/accessoriesDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                            </div>
            
                                                        </c:if>
                                                        <c:if test="${action eq 'view'}">
                                                                                                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                                
                                                                <a href="../assets/accessoriesDetailsList.htm" class="btn btn-danger">Cancel</a>
                                                            </div>
                                                        </c:if>
                                                    </div>
            
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('#accessory').validationEngine();
                            });
                            $(document).ready(function () {
                                $("input").on("keypress", function (e) {
                
                                    if (e.which === 32 && !this.value.length)
                                        e.preventDefault();
                                });
                
                                $(document).on('click', '#deleteRowedu', function () {
                
                                    var $itemRow = $(this).closest('tr');
                                    var discount = $itemRow.find('#eduSNo').val();
                
                                    var s = $('#sSavesnoedu').val();
                                    //alert(s);
                                    if (s == "") {
                                        // alert("gggg");
                                        //  alert(discount);
                                        //$('#sSavesnoedu').val(discount);
                                        document.getElementById("sSavesnoedu").value = discount;
                                    } else {
                                        //  alert("fff");
                                        $('#sSavesnoedu').val(s + '//' + discount);
                                    }
                
                                    deleteRowedu(this);
                                });
                
                                function deleteRowedu(row) {
                                    var rowCount = $('#currencytablemed tr').length;
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
                
                
                            });
                
                            function isNumberKey3(evt) {
                                debugger;
                                var charCode = (evt.which) ? evt.which : event.keyCode;
                                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
                                {
                //                    alert("Please Enter Only Alphanumerics");
                                    return false;
                                }
                                return true;
                            }
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
                            function isNumberKey4(evt) {
                                debugger;
                                var charCode = (evt.which) ? evt.which : event.keyCode;
                                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                                {
                //                    alert("Please Enter Only Alphabets");
                                    return false;
                                }
                                return true;
                            }
                
                            //function to delete the attachment   
                            function deleteFile(data1) {
                                var attach = data1;
                                var x = confirm("Do you really want to delete this attachment?");
                                if (x)
                                {
                                    var attchSNo = attach;
                                    $.ajax
                                            ({
                                                type: "POST",
                                                url: '../insurance/contractAttachDel.htm',
                                                data: {
                                                    attchSNo: attchSNo
                                                },
                                                success: function (data) {
                                                    if ($.trim(data) === 'Already Exists.Enter another') {
                                                        //alert("This File is deleted");
                                                        return false;
                                                    }
                
                                                }
                
                
                                            });
                                    alert("This File is deleted");
                                    return false;
                                }
                                else
                                {
                                    return false;
                                }
                
                            }
                
                            function selectAccAssetDetails()
                            {
                                document.getElementById("subAssetCode").value = "";
                                document.getElementById("subAssetName").value = "";
                                myWindow = window.open("../assets/selectAccAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            function selectSubAssetDetails()
                            {
                                var assetCode = document.getElementById("assetCode").value;
                
                                myWindow = window.open("../assets/selectSubAssetDetails.htm?assetCode=" + assetCode + "", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                            function selectAccessoryDetails()
                            {
                                myWindow = window.open("../assets/selectAccessoryDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                            }
                
                            function checkAccessory()
                            {
                                var accessoryCode = document.getElementById('accessoryCode').value;
                                var subAssetCode = document.getElementById('subAssetCode').value;
                
                
                                $.ajax({
                                    type: "POST",
                                    url: "../assets/accessories.htm",
                                    data: {accessoryCode: accessoryCode, subAssetCode: subAssetCode},
                                    dataType: "text",
                                    success: function (data)
                                    {
                                        if ($.trim(data) !== 'Data  available')
                                        {
                                            alert("This Accessory  is already Tagged for the Flat.!");
                                            document.getElementById("accessoryCode").value = "";
                                            document.getElementById("accessoryCategory").value = "";
                                            document.getElementById("accessoryName").value = "";
                                            document.getElementById("accessoryDesc").value = "";
                                            return false;
                                        }
                                    },
                                    error: function (error) {
                                        alert(error);
                                    }
                                });
                            }
                
                            function calc() {
                                var s = $('#sSavesnoedu').val();
                                // alert(s);
                            }
                
                            function checkdigit(e, obj, intsize, deczize) {
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
                
                            function readURL1(input) {
                                $('#blah1').show();
                                var imageId = input.id;
                                checkImageSize1(input, imageId);
                                if (input.files && input.files[0]) {
                                    var reader = new FileReader();
                
                                    reader.onload = function (e) {
                                        $('#blah1')
                                                .attr('src', e.target.result)
                                                .width(120)
                                                .height(120);
                                    };
                
                                    reader.readAsDataURL(input.files[0]);
                                }
                            }
                
                
                            function checkImageSize1(obj, id1)
                            {
                                var size = ($("#" + id1)[0].files[0].size) / (200 * 230);
                                if (parseFloat(size) > 45)
                                {
                                    alert("Exceeding File Size");
                                    $("#" + id1).val("");
                                } else {
                                    Validate(obj, id1);
                                }
                            }
                
                            function Validate(obj, id1)
                            {
                                var image = document.
                                        getElementById(id1).value;
                                if (image != '') {
                                    var checkimg = image.toLowerCase();
                                    if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                                        alert("Please enter Image File Extensions .jpg,.png,.jpeg");
                                        $("#" + id1).focus();
                                        $("#" + id1).val("");
                                        return false;
                                    }
                                }
                                return true;
                            }
                
                            function browseFile(slno) {
                                document.getElementById('field' + slno).click();
                            }
                            function setAttachName(slno) {
                                var filenm = document.getElementById('field' + slno).value;
                                var filenmArr = filenm.split(".");
                                document.getElementById('attachname' + slno).value = filenmArr[0];
                            }
                
                            function browseImage(image) {
                                document.getElementById(image).click();
                            }
                            function imageUpload(image, imageLbl) {
                                var imgText = document.getElementById(image).value;
                                var imgTextArr = imgText.split(".");
                                document.getElementById(imageLbl).value = imgTextArr[0];
                            }
                
                            var next = 1;
                            $(document).on("click", ".add-more", function (e) {
                                e.preventDefault();
                                var addto = "#adiv" + next;
                                next = next + 1;
                                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 col-sm-12 "><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div>';
                                var newInput = $(newIn);
                                $(addto).after(newInput);
                //                $("#field" + next).attr('data-source', $(addto).attr('data-source'));
                                $("#count").val(next);
                
                            });
                
                            $(document).on("click", '.remove-me', function (e) {
                                var rmvId = '' + this.id;
                                var fieldNum = rmvId.substring(6);
                                var fieldID = "#field" + (fieldNum);
                                var nameFieldID = "#attachname" + (fieldNum);
                                var btnb = "#btnb" + (fieldNum);
                                var errpgh = "#field" + (fieldNum) + "Error";
                                var adiv = "#adiv" + (fieldNum);
                                $(this).remove();
                                $(fieldID).remove();
                                $(nameFieldID).remove();
                                $(btnb).remove();
                                $(errpgh).remove();
                                $(adiv).remove();
                                next = next - 1;
                            });
                
                            $(document).on("click", '.r1', function (e) {
                                var rmvId = '' + this.id;
                
                                var num = rmvId.substring(2);
                
                                var divid = "#del" + (num);
                                var sno1 = "#attsno" + (num);
                
                                var a = $(sno1).val();
                                var b = $("#tobedel").val();
                
                                var c = a + "," + b;
                
                                document.getElementById("tobedel").value = c;
                
                                $(divid).remove();
                            });
                        </script>
                        <script>
                            window.onload = minRentGen();
                        </script>
                        
                    </body>

                    </html>