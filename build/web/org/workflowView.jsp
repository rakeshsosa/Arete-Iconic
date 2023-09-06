<%-- 
    Document   : workflowView
    Created on : 18 Jan, 2018, 12:19:37 PM
    Author     : ebs05
--%>

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

  <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <script>


            function test12()
            {
                if (document.getElementById("submodulename").value == "")
                {
                    alert("Enter Submodule Name");
                    return false;
                }
                else if (document.getElementById("tabname").value == "")
                {
                    alert("Enter Tab Name");
                    return false;
                } else if (document.getElementById("Role").value == "")
                {
                    alert("Enter Role Name");
                    return false;
                } else if (document.getElementById("user").value == "")
                {
                    alert("Enter User Name");
                    return false;
                } else {

                    document.forms["paymentform"].submit();
                }

            }

        </script>
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
                                <jsp:include page="../login/headerlink.htm?submodule=Work Flow&tab=Work Flow Details&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Work Flow Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <c:forEach items="${wrklist}" var="list">

                                        <c:set var="txn" value="${list.txn}"></c:set>
                                        <c:set var="submodulename" value="${list.submodulename}"></c:set>
                                        <c:set var="tabname" value="${list.tabname}"></c:set> 
                                        <c:set var="rolename" value="${list.role}"></c:set> 
                                        <c:set var="username" value="${list.createdId}"></c:set> 

                                    </c:forEach>
                                    <br />
                                    <form id="paymentform" class="form-inline" action="../login/workflowSubmit.htm">
                                        <div class="col-md-4 col-sm-6 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Sub Module Name</label>
                                            <input type="text" class="form-control" readonly="" name="submodulename" data-placement="right" title="Sub Module Name" value="${submodulename}">
                                        </div>

                                        <div class="col-md-4 col-sm-6 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Tab Name</label>
                                            <input type="text" class="form-control" readonly="" name="tabname" data-placement="right" title="Tab Name" value="${tabname}">
                                        </div>

                                        <div class="col-md-4 col-sm-6 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>Role Name</label>                                            
                                            <input type="text" class="form-control" readonly="" name="Role" data-placement="right" title="Role Name" value="${rolename}">
                                        </div>

                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-6 col-xs-12 form-inline">
                                            <label class="control-label"><span style="color:red">*</span>User Name</label>                                            
                                            <input type="text" class="form-control" readonly="" name="user" data-placement="right" title="User Name" value="${username}">
                                        </div>

                                        <div>
                                            <p>&nbsp;</p>
                                            <p>&nbsp;</p>
                                            <div class="clearfix"></div>
                                        </div> 

                                        <c:if test="${SNo eq null}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" style="margin-top:15px;">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">

                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fa fa-trash"></i></th>   
                                                            <th>Sub Module Name</th>
                                                            <th>Tab Name</th>
                                                            <th>Role Name</th>
                                                            <!--                                                            <th>District Name</th>-->
                                                            <th>User Name</th>
                                                            <th>Approver Level</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">
                                                    <input id="txno" name="txno" type="hidden" value="${txn}" >
                                                    <c:forEach items="${wrklist}" var="list">
                                                        <tr class="wrk">
                                                        <input name="SNo" type="hidden" value="${list.sno}" >

                                                        <td align="center" onclick="">
                                                            <c:if test="${action ne 'view'}">
                                                                <button type="button" id="deleteWrk"><i class="fa fa-trash-o"></i></button>
                                                                </c:if>
                                                        </td>

                                                        <td>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="submodulename" id="submodulename1" type="text" value="${list.submodulename}" >
                                                        </td>                                            
                                                        <td><input class="form-control validate[required]" style="width: 100%;text-align: center" maxlength="100" readonly=""  autocomplete="off" name="tabname" id="tabname1" type="text" value="${list.tabname}" ></td>
                                                        <td><input class="form-control validate[required]" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="Role" id="Role1"  type="text" value="${list.role}" ></td>

                                                        <td>
                                                            <c:forEach items="${userlist}" var="ul">
                                                                <c:if test="${list.userId eq ul.userId}">
                                                                    <c:set var="uId" value="${list.userId }"/>
                                                                    <c:set var="uFName" value="${ul.userFName}"/>
                                                                    <c:set var="uLName" value="${ul.userLName}"/>

                                                                </c:if>

                                                            </c:forEach>
                                                            <input class="form-control validate[required]" style="width: 100%;text-align: center"  type="text" readonly name="user" id="user1"  value="${uFName}${uLName}" style="border: none">
                                                            <input class="form-control validate[required]"  readonly="" autocomplete="off" name="userId" id="userId1" type="hidden" value="${uId}" ></td> 

                                                        <td><input class="form-control" style="width: 100%;text-align: center"  readonly="" autocomplete="off" name="level" id="level1" type="text" value="${list.level}" ></td>

                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    <script>
                                                        var count = 0;
                                                        var aplevel = 1;
                                                        function addOrderRow_test() {

                                                            var valid1 = true;

                                                            var x = document.getElementById('submodulename').value &&
                                                                    document.getElementById('tabname').value &&
//                                                                    document.getElementById('districtName').value &&
                                                                    document.getElementById('user').value &&
                                                                    document.getElementById('Role').value;

                                                            if (x == "" || x == null)
                                                            {
                                                                alert("Please select mandatory fields...!!!");
                                                                valid1 = false;
                                                            }



                                                            if (valid1 == true) {



                                                                var submodulename = document.getElementById('submodulename').value;
//                                                                var itemCode = document.getElementById('itemCode').value;
//                                                                var itemName = document.getElementById('itemName').value;
//                                                                var itemDesc = document.getElementById('itemDesc').value;
                                                                var tabname = document.getElementById('tabname').value;
//                                                                var requiredByDate = document.getElementById('requiredByDate').value;
                                                                var Role = document.getElementById('Role').value;
//                                                                var actionRemarks = document.getElementById('actionRemarks').value;
//                                                                var districtlist = document.getElementById('districtName').value.split("$$");

//                                                                var distName = districtlist[0];
//                                                                var distCode = districtlist[1];
                                                                var userList = document.getElementById('user').value.split("$$");
                                                                var userFName = userList[0];
                                                                var userLName = userList[1];
                                                                var userId = userList[2];




                                                                var table = document.getElementById("resourcetable");

                                                                //                                                                    for (var i = 0; i < reno.length; i++) {
                                                                $('#resourcetable tr').each(function () {
                                                                    var s1 = $(this).find('#submodulename1').val();
                                                                    var t1 = $(this).find('#tabname1').val();
                                                                    var r1 = $(this).find('#Role1').val();
//                                                                    var d1 = $(this).find('#districtName1').val();
                                                                    var u1 = $(this).find('#userId1').val();
                                                                    var l1 = $(this).find('#level1').val();
                                                                    //                                                                                var b = $(this).find('#storage1').val();



                                                                    if (s1 !== submodulename || t1 !== tabname)
                                                                    {
                                                                        alert('Sub module Name, Tab Name or District Name not matched with the grid data...!!!');
                                                                        document.getElementById('td').value = "";
                                                                        return false;
                                                                    }

                                                                    if (s1 == submodulename && t1 == tabname
                                                                            && r1 == Role && u1 == userId) {
                                                                        alert('Record already added to grid...!!!');
                                                                        document.getElementById('td').value = "";
                                                                        return false;
                                                                    } else {
                                                                        return true;
                                                                    }

                                                                });

                                                                var slNo = table.rows.length - 1;
                                                                var slNo1 = table.rows.length;
                                                                var id1 = slNo1;
                                                                var tr = table.insertRow(slNo + 1);
                                                                tr.id = 'list_tr_' + slNo;
                                                                tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash-o" onclick="removeRow('
                                                                        + slNo + ')" ></button> </td>' +
                                                                        '<input type="hidden"  name="SNo" id="SNo" value="">\
                                                                         <input class="form-control"  type="hidden" readonly name="userId" id="userId1" value="' + userId + '" style="border: none">\n\
                                                                        <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="submodulename" id="submodulename1" value="' + submodulename + '" style="border: none">\n\
                                                                        <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text" readonly name="tabname" id="tabname1" value="' + tabname + '" style="border: none"></td>\n\
                                                                          <td><input class="form-control capitalize  validate[required]" readonly style="width: 100%;text-align: center" type="text" name="Role" id="Role1" value="' + Role + '"  style="border: none"></td>\n\
                                                                             <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="user" id="user1" value=" " style="border: none">\n\
                                                                    <td><input class="form-control capitalize  " style="width: 100%;text-align: center" type="text"readonly name="level" id="level1" value="' + aplevel + '" style="border: none">';
                                                                count++;
                                                                aplevel++;
                                                            }

                                                            else {
                                                                return;
                                                            }
                                                        }

                                                        function removeRow(id) {
                                                            count--;
                                                            aplevel--;
                                                            var table = document.getElementById("resourcetable");
                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                                    table.deleteRow(i);
                                                                    var lvl = 1;
                                                                    $('#resourcetable tr').each(function () {

                                                                        $(this).find('#level1').val(lvl);
                                                                        lvl++;
                                                                    });
                                                                    return;
                                                                }
                                                            }
                                                        }
                                                        function checkGrid() {
                                                            var table = document.getElementById("resourcetable");
                                                            var slNo = table.rows.length - 1;
                                                            if (slNo < 0) {
                                                                alert("Please add data in grid...!!!");
                                                                return false;
                                                            } else {
                                                                return true;
                                                            }
                                                        }

                                                        function validCapacity($this) {
                                                            var $itemRow = $($this).closest('tr');
                                                            var availCapacity1 = $itemRow.find('#availCapacity').val();
                                                            var loadcap = $itemRow.find('#loadcap').val();
                                                            if (parseFloat(loadcap) > parseFloat(availCapacity1)) {
                                                                alert("Qlts cannot be greater than Available Capacity");
                                                                $itemRow.find('#loadcap').val("");
                                                                return false;
                                                            } else {
                                                                var total = 0;
                                                                $('input#loadcap').each(function (i) {
                                                                    var total1 = $(this).val();
                                                                    if (!isNaN(total1))
                                                                        total += Number(total1);
                                                                });
                                                                if (parseFloat(total) > parseFloat(document.getElementById('todayProd').value)) {
                                                                    alert("Total Qlts cannot be greater than Total Production");
                                                                    $('input#loadcap').val(0);
                                                                    $('input#loadcap').focus();
                                                                }
                                                                //                                                            validBulkLtrs($this, loadcap);
                                                                // var inputs = $('input', $itemRow);
                                                                //inputs.prop('readonly', true);
                                                                return true;
                                                            }
                                                        }

                                                    </script>

                                                </table>  
                                            </div>                     



                                        </c:if>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="test12();">Save</button>
                                                <a href="../login/workflowlist.htm" class="btn btn-danger">Cancel</a>
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
            $(document).ready(function () {
                //                $('#roleMast').validationEngine();
            });

            $("#submodulename").change(function () {
                $("#tabname").empty();
                var submodname = document.getElementById("submodulename").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../login/gettab.htm',
                            data: {
                                submodname: submodname
                            },
                            success: function (data) {
                                $("#tabname").append('<option value="" disabled selected>Select your option</option>');
                                if (data != '') {
                                    var tab = data.split("$$");
                                    for (var i = 0; i < tab.length - 1; i++) {

                                        $("#tabname").append("<option value='" + tab[i] + "'>" + tab[i] + "</option>");


                                    }
                                }
                            }
                        });


            });

            $(document).on('change', '#Role', function ()
//            $("#districtName").change(function ()
            {
                $("#user").empty();
                var roleName = document.getElementById("Role").value

                $.ajax
                        ({
                            type: "POST",
                            url: '../login/getuser.htm',
                            data: {
                                roleName: roleName
                            },
                            success: function (data) {
                                $("#user").append('<option value="" disabled selected>Select your option</option>');
                                if (data != '') {
                                    var st = data.split("##");
                                    for (var i = 0; i < st.length - 1; i++) {
                                        var userlis = st[i].split("$$");

                                        $("#user").append("<option value='" + userlis[0] + "$$" + userlis[1] + "$$" + userlis[2] + "'>" + userlis[0] + userlis[1] + "</option>");


                                    }
                                }
                            }
                        });


            });

            NProgress.done();
        </script>
    </body>

</html>