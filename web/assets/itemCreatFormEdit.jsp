<%-- 
    Document   : itemCreatFormEdit
    Created on : 23 Feb, 2018, 4:29:48 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>

        <title>arête Assets Management</title>
    </head>


    <script>

        //pop up to select Category
        function selectCategory() {

            myWindow = window.open("../master/itemCatPopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

        function selectUOM() {

            myWindow = window.open("../master/uomMasterPopup.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

        function parent_disable() {
            if (myWindow && !myWindow.closed)
                myWindow.focus();
        }



//method to validate unique category
        function test11() {
            var itemName = document.getElementById("itemName").value;
            //alert(itemName);
            $.ajax
                    ({
                        type: "POST",
                        url: '../master/itemListAvailabilty.htm',
                        data: {
                            itemName: itemName
                        },
                        success: function (data) {

                            if ($.trim(data) == 'Already Exists.Enter another') {
                                alert("This Record Already Exist");
                                document.getElementById("itemName").value = "";
                                return false;
                            }

                            //test12();
                        }


                    });
        }

        //method to validate Mandatory and submit form       
        function test12()
        {
            if (document.getElementById("division").value == "")
            {
                alert("Select Division");
                return false;
            } else if (document.getElementById("itemCategory").value == "") {
                alert("Select Item Category");
                return false;
            } else if (document.getElementById("itemName").value == "") {
                alert("Enter Item Name");
                return false;
            } else if (document.getElementById("itemUom").value == "") {
                alert("Enter Item Uom");
                return false;
            } else if (document.getElementById("storeName").value == "") {
                alert("Select Store Name");
                return false;
            }
            else {

                document.forms["userform"].submit();
            }

        }

        function test()
        {
            var iname = document.getElementById("itemName").value;
            var iname1 = document.getElementById("itemName1").value;
            var desc = document.getElementById("itemDesc").value;
            var desc1 = document.getElementById("itemDesc1").value;
            var sstock = document.getElementById("saftyStock").value;
            var sstock1 = document.getElementById("saftyStock1").value;

            if (document.getElementById("itemName").value == "")
            {
                alert("Enter Item Name");
                return false;
            }
            else {

                if (iname !== iname1 || desc !== desc1 || sstock !== sstock1) {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["userform"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["userform"].submit();
                }
            }

        }


//        function test()
//        {
//            var y =
//                    (document.getElementById('itemCategory').value) &&
//                    (document.getElementById('itemName').value) &&
//                    (document.getElementById('itemUom').value);
//
//            if (y == "" || y == null) {
//                alert('Please fill out the mandatory fields');
//                return false;
//            }
//            else {
//                if (confirm('Do you really want to Save this updated record')) {
//                    document.forms["userform"].submit();
//                    return true;
//                } else {
//                    return false;
//                }
//
//            }
//
//        }
    </script>



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
                                <jsp:include page="../login/headerlink.htm?submodule=Accessory Details&tab=Accessory Master&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Accessory Master</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="userform" class="form-inline" action="../quality/itemCreatFormSubmit.htm" method="post" enctype="multipart/form-data" >
                                        <c:choose>
                                            <c:when test="${fn:length(itemList) > 0}">
                                                <c:forEach items="${itemList}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {

                                                                    var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                                    for (i = 0; i < nFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(nFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(nFields[i]).css("border-color", "red");
                                                                            $(nFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }
                                                                    var textFields = document.getElementsByTagName('textarea')
                                                                    for (i = 0; i < textFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(textFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(textFields[i]).css("border-color", "red");
                                                                            $(textFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }



                                                                });
                                                            </script>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${fn:length(itemStore) > 0}">
                                                <c:forEach items="${itemStore}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {

                                                                    var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                                    for (i = 0; i < nFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(nFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(nFields[i]).css("border-color", "red");
                                                                            $(nFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }
                                                                    var textFields = document.getElementsByTagName('textarea')
                                                                    for (i = 0; i < textFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(textFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(textFields[i]).css("border-color", "red");
                                                                            $(textFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }



                                                                });
                                                            </script>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            <label class="control-label">Division</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemStore) > 0}">
                                                    <c:forEach items="${itemStore}" var="item">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_717} readonly="" name="division" id="division" value="${item.division}" maxlength="50" onkeypress="return isNumberKey4(event)">

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" value="${item.division}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select id="division" name="division" ${mand_status_717} class="form-control" >
                                                        <option value="" disabled="" selected>Select your option</option>
                                                        <c:forEach items="${orglist}" var="list">                                                                
                                                            <option value="${list.orgCode}">${list.orgCode}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div> 

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="color:red;">*</a>
                                            <label class="control-label">Accessory Category</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemList) > 0}">
                                                    <c:forEach items="${itemList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text"  class="form-control" ${mand_status_507} id="itemCategory" readonly="" style="cursor: pointer;resize: none;" name="itemCategory" value="${list.itemCategory}">
                                                                <input type="hidden"  class="form-control"   name="categoryId" id="categoryId"  value="${list.itemCode}">  

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_507} id="itemCategory"  readonly=""  style="cursor: pointer;resize: none;" name="itemCategory" value="${list.itemCategory}">

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text"  class="form-control" ${mand_status_507} id="itemCategory" Placeholder="Select Category" readonly="" onclick="selectCategory();" style="cursor: pointer;resize: none;" name="itemCategory">
                                                    <input type="hidden"  class="form-control" readonly=""  name="categoryId" id="categoryId"  value="">  
                                                    <input name="status" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="color:red;">*</a>
                                            <label class="control-label">Accessory Name</label>                                          
                                            <c:choose>
                                                <c:when test="${fn:length(itemList) > 0}">
                                                    <c:forEach items="${itemList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_508}  name="itemName" readonly="" id="itemName" autocomplete="off" value="${list.itemName}">
                                                                <input type="hidden" class="form-control" ${mand_status_508}  name="itemName1" id="itemName1" autocomplete="off" value="${list.itemName}">
                                                                <input name="itemCode" type="hidden" value="${list.itemCode}">
                                                                <input name="pk" type="hidden" value="${list.sno}">
                                                                <input name="status" type="hidden" value="${list.status}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" ${mand_status_508} readonly="" name="itemName" value="${list.itemName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" autocomplete="off" ${mand_status_508} name="itemName" id="itemName" oninput="test11();">
                                                    <input name="itemCode" type="hidden" value="">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                            <label class="control-label ">Accessory Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemList) > 0}">
                                                    <c:forEach items="${itemList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea name="itemDesc" id="itemDesc" class="form-control" readonly="" rows="1" style="resize: none">${list.itemDesc}</textarea>
                                                                <input id="itemDesc1" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.itemDesc}">

                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea readonly="" class="form-control"  name="itemDesc" rows="1" style="resize: none">${list.itemDesc}</textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <textarea name="itemDesc" class="form-control"  rows="1" style="resize: none"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="color:red;">*</a>
                                            <label class="control-label">Accessory UOM</label>

                                            <c:choose>
                                                <c:when test="${fn:length(itemList) > 0}">
                                                    <c:forEach items="${itemList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text"  class="form-control" ${mand_status_510} id="itemUom" readonly="" style="cursor: pointer;resize: none;" name="itemUom" value="${list.itemUom}">                                                             
                                                                <!--                                                                    <input type="hidden"  class="form-control" readonly=""  name="uomId" id="uomId"  value=" ">  -->
                                                                <!--                                                                    <input type="hidden"  class="form-control" readonly=""  name="uomDesc" id="uomDesc"  value=""> -->
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_510} id="itemUom"  readonly=""  style="cursor: pointer;resize: none;" name="itemUom" value="${list.itemUom}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text"  class="form-control" ${mand_status_510} id="itemUom" name="itemUom" Placeholder="Select UOM" readonly="" onclick="selectUOM();" style="cursor: pointer;resize: none;" >
                                                    <input type="hidden"  class="form-control" readonly=""  name="uomId" id="uomId"  value="">     
                                                    <input type="hidden"  class="form-control" readonly=""  name="uomDesc" id="uomDesc"  value=""> 
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                            <label class="control-label">Store Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(itemStore) > 0}">
                                                    <c:forEach items="${itemStore}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_718} readonly="" name="storeName" id="storeName" value="${list.storeName}" maxlength="50" >

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" value="${list.storeName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select id="storeName" name="storeName" ${mand_status_718} class="form-control" >
                                                        <option value="" disabled="" selected>Select your option</option>
                                                        <c:forEach items="${storeName}" var="list">                                                                
                                                            <option value="${list.storeName}">${list.storeName}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <a style="color:transparent;">*</a>
                                            <label class="control-label">Safety Stock</label>                                          
                                            <c:choose>
                                                <c:when test="${fn:length(itemStore) > 0}">
                                                    <c:forEach items="${itemStore}" var="list1">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_719}  name="saftyStock" id="saftyStock" autocomplete="off" value="${list1.saftyStock}" >
                                                                <input type="hidden" class="form-control" ${mand_status_719}  name="saftyStock1" id="saftyStock1" autocomplete="off" value="${list1.saftyStock}" >

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" ${mand_status_719} readonly="" name="saftyStock" value="${list1.saftyStock}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="" class="form-control" autocomplete="off" ${mand_status_719} name="saftyStock" id="saftyStock" >

                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label"></label>
                                            <c:choose>
                                                <c:when test="${fn:length(categorylst) > 0}">
                                                    <c:forEach items="${categorylst}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="hidden" class="form-control" ${mand_status_3}  name="attribute1" id="attribute1" value="">

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="hidden" class="form-control" ${mand_status_3} readonly=""  name="attribute1" value="">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="hidden" placeholder="" class="form-control"   name="attribute1" id="attribute1" value="">

                                                </c:otherwise>        
                                            </c:choose>

                                        </div>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" class="btn btn-primary" style="" onclick="test12();">Save</button>
                                                <a href="../master/itemMasterList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../master/itemMasterList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>

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
    </body>

</html>

