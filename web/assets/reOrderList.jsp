<%-- 
    Document   : reOrderList
    Created on : 16 Feb, 2018, 3:36:49 PM
    Author     : ebs05
--%>

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
    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>

                <div class="right_col" role="main">

                    <br />
                    <div class="">

                        <div class="row top_tiles">

                            <div class="">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="x_panel">
                                        <jsp:include page="../login/headerlink.htm?submodule=Inventory List&tab=Re-Order Items&pagetype=list"/>

                                        <div class="row">

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">
                                                    <form method="post"  id="reqQuotation" onsubmit="return checkb();">
                                                        <div class="x_title">
                                                            <h2>Re-Order List<small></small></h2>
                                                            <input type="reset" class="btnGetAll" value="Reset" style="float: right" />

                                                            <input type="Submit" id="submitreorder" class="btnGetAll" value="Create Requisition" style="float: right" />

                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="x_content">
                                                            <div class="col-md-4 col-sm-6 col-xs-12" style="float:left">
                                                                <!--                                                                <h5>Store Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-->

                                                                <%--                                                                    <select id="storeName" name="storeName" >                                                                       
                                                                                                                                        <c:if test="${empty storeName}">
                                                                                                                                            <c:forEach items="${store1}" var="list">

                                                                                <c:if test="${list.division eq userDiv}">

                                                                                    <option selected="" value="${list.storeName}">${list.storeName}</option>
                                                                                </c:if>

                                                                            </c:forEach>
                                                                        </c:if>  
                                                                        <c:if test="${not empty storeName}">


                                                                            <option selected="" value="${storeName}">${storeName}</option>

                                                                        </c:if>
                                                                    </select></h5>--%>

                                                            </div>
                                                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                                                <thead>
                                                                    <tr class="headings">
                                                                        <th style="text-align:left;"> 

                                                                            <input  type="checkbox" id="selectall" onclick="checkAll();"/>

                                                                        </th>  
                                                                        <th>Store</th>
                                                                        <th>Item Code</th>
                                                                        <th>Item Name</th>
                                                                        <th>Safety Stock</th>
                                                                        <th>Available Stock</th>
                                                                        <th>Action</th>

                                                                    </tr>
                                                                </thead>

                                                                <tbody>

                                                                    <%-- <c:forEach items="${saftyList}" var="list">
                                                                        <tr>
                                                                            <td  style="width:4%;">
                                                                                <input type="checkbox"  value="${list[0]}" id="selectedvalues"  name="selectedvalues">
                                                                            </td>
                                                                            <td class="center" style="width:10%;">${list[4]}</td>
                                                                            <td class="center" style="width:13%;">${list[0]}</td>
                                                                            <td class="center" style="width:20%;">${list[2]}</td>
                                                                            <td class="center" style="width:9%;">${list[3]}</td>
                                                                            <td class="center" style="width:9%;">${list[1]}</td>
                                                                        </tr>

</c:forEach> --%>

                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>

                                            <br />
                                            <br />
                                            <br />

                                        </div>
                                    </div>


                                </div>
                                <!-- /page content -->
                            </div>

                        </div>


                        <!-- Datatables -->
                        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

                        <script>


                                                                                $(document).ready(function () {
                                                                                    var storeName = $('#storeName').val()
                                                                                    paginationlist(storeName);
                                                                                });
                                                                                function paginationlist(storeName) {


                                                                                    $('#example').dataTable({
                                                                                        oLanguage: {
                                                                                            'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                                                                        },
                                                                                        "sPaginationType": "full_numbers",
                                                                                        "iDisplayLength": 10,
                                                                                        "bProcessing": true,
                                                                                        "bServerSide": true,
                                                                                        "aaSorting": [[0, 'desc']],
                                                                                        "sAjaxSource": "../quality/reorderpaginationList.htm?storeName=",
                                                                                        "aoColumnDefs": [
                                                                                            {
                                                                                                "aTargets": [0],
                                                                                                "bSortable": false,
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<input type="checkbox"  value="' + full[0] + '" id="selectedvalues"  name="selectedvalues">';
                                                                                                }

                                                                                            },
                                                                                            {
                                                                                                "aTargets": [1],
                                                                                                "sWidth": "200px",
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align:left">' + full[4] + '</div>';
                                                                                                }

                                                                                            },
                                                                                            {
                                                                                                "aTargets": [2],
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align:left">' + full[0] + '</div>';
                                                                                                }

                                                                                            },
                                                                                            {
                                                                                                "aTargets": [3],
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align:left">' + full[2] + '</div>';
                                                                                                }
                                                                                            },
                                                                                            {
                                                                                                "aTargets": [4],
                                                                                                "sWidth": "150px",
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align:right">' + full[3] + '</div>';
                                                                                                }

                                                                                            },
                                                                                            {
                                                                                                "aTargets": [5],
                                                                                                "sWidth": "150px",
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align:right">' + full[1] + '</div>';


                                                                                                }

                                                                                            },
                                                                                            {
                                                                                                "aTargets": [6],
                                                                                                "sWidth": "150px",
                                                                                                "mRender": function (data, type, full) {
                                                                                                    return '<div style="text-align: left;"><a style="text-align: left;" class="fa fa-pencil fa-lg" href="../quality/itemCreatFormEdit.htm?itemCode=' + full[0] + '&snoitem=null&action=edit" title="Edit Item"> \n\
                                                                                                          <i class="" ></i> </a> </div>';
                                                                                                }

                                                                                            },
                                                                                        ],
                                                                                    });
                                                                                }

                        </script>	
                        <script>


                            function checkb() {

                                var x = $('#selectedvalues:checked').length;
                                var y = $('#storeName').val();
                                if (y === null || y === '') {
                                    alert("Please Select Store Name");
                                    return false;
                                } else if (parseInt(x) === 0)
                                {
                                    alert("Please select atleast one checkbox");
                                    return false;
                                } else {
                                    $('#reqQuotation').attr('action', "../quality/reqForm.htm");
                                    $('#reqQuotation').submit();

                                }
                                return false;
                            }
                            checked = false;
                            function checkAll() {
                                var aa = document.getElementById('reqQuotation');
                                // alert('test');
                                if (checked == false) {
                                    checked = true;
                                } else {
                                    checked = false;
                                }
                                for (var i = 0; i < aa.elements.length; i++) {
                                    aa.elements[i].checked = checked;
                                }
                            }

//                            $(document).ready(function () {
//                                $("#storeName").change(function () {
//
//                                    var x = document.getElementById('storeName').value;
//
////                                    $('#example').dataTable().fnClearTable();
//                                    $('#example').dataTable().fnDestroy();
//                                    paginationlist(x);
//
////                                    window.location.href = "../inventory/reorderList.htm?storeName=" + x;
//
//                                });
//
//
//
//                            });
                        </script>


                    </div>

                </div>
            </div>

        </div>


        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>
        <script>
            NProgress.done();
        </script>
    </body>

</html>
