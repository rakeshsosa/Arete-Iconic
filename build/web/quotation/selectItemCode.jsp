<%-- 
    Document   : SelecetItem
    Created on : Feb 19, 2016, 5:44:26 PM
    Author     : Nataraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>


    </head>


    <body>
        <script>
            checked = false;
            function checkAll() {
                var aa = document.getElementById('contDetForms');
                if (checked == false) {
                    checked = true;
                } else {
                    checked = false;
                }
                for (var i = 0; i < aa.elements.length; i++) {
                    aa.elements[i].checked = checked;
                }
                typelist(aa);
            }
            function test1(itemCode, itemName, itemUom) {
                window.opener.document.getElementById('serviceItems').value = itemCode;
                window.opener.document.getElementById('Itemname').value = itemName;
                window.opener.document.getElementById('itemUom').value = itemUom;
                window.close();
            }

            function typelist(contDetForms) {
                var split1 = '';
                var aa = document.getElementsByName('chk1');
                var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
                if (atLeastOneIsChecked <= 0) {
                    alert("Please select the items..!!");
                    return  false;
                }
                for (var i = 0; i < aa.length; i++) {
                    if (aa[i].checked) {

                        split1 = aa[i].value.split("$$");

                        opener.addToGrid(split1[0], split1[1], split1[2], split1[3]);
                    }
                }
                window.close();
            }


            function getVal($this) {
                var x = document.getElementById("example").rows.length;
                var $itemRow = $($this).closest('tr');
                var rowCount = ($($this).closest("tr")[0].rowIndex);
                $itemRow.find('#chk1').attr('id', "chk1" + rowCount);
                var chkVal = document.getElementById("chk1" + rowCount).value.split("$$");
                opener.addToGrid(chkVal[0], chkVal[1], chkVal[2], chkVal[3]);
            }

        </script>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Item List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForms">

                            <div class="col-md-4 col-sm-12 col-xs-12 col-md-offset-2" style="margin-bottom:-20px;">
                                <div class="col-md-9 col-sm-9 col-xs-12">

                                </div>

                            </div>
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">  
                                        <th style="text-align:left;width:2%;"><input type="checkbox" id="selectall" onclick="checkAll();" /></th>
                                        <th>Item Code</th>
                                        <th>Item Name</th>
                                        <th>Uom</th> 
                                        <th>Stock</th> 

                                    </tr>
                                </thead>

                                <tbody>
                                    <%--<c:forEach items="${itemmaster}" var="list">
                                        <tr>

                                            <td><input type="checkbox" id="chk1" name="chk1" onclick="getVal(this);" value="${list.itemCode}/${list.itemName}/${list.itemUom}/"/></td>
                                            <td class="center" onclick="test('${list.itemCode}', '${list.itemName}','${list.itemUom}');">${list.itemCode}</td>
                                            <td class="center" onclick="test('${list.itemCode}', '${list.itemName}','${list.itemUom}');">${list.itemName}</td>
                                            <td class="center" onclick="test('${list.itemCode}', '${list.itemName}','${list.itemUom}');">${list.itemUom}</td>

                                        </tr>


                                    </c:forEach>--%>

                                </tbody>

                            </table>
                        </form>
                    </div>
                </div>
            </div>

        </div>



        <!-- Datatables -->
        <script src="../common/theme/pagination/jquery.dataTables.min.js"></script> 
        <script>
                                            $(document).ready(function () {


                                                $('#example').dataTable({
                                                    oLanguage: {
                                                        'sProcessing': "<p style='margin: -10px 0px 15px 20px;'>Loading data, please wait... <img width='20px'  height='20px' src='../common/theme/images/loading-gif.gif'></p>",
                                                    },
                                                    "sPaginationType": "full_numbers",
                                                    "iDisplayLength": 10,
                                                    "bProcessing": true,
                                                    "bServerSide": true,
                                                    "sAjaxSource": "../serviceReq/itemPaginationList.htm?listPage=selectItems&itemCate=" + '${itemCate}',
                                                    "aoColumnDefs": [
                                                        {
                                                            'bSortable': false,
                                                            "aTargets": [0],
                                                            "mRender": function (data, type, full) {
                                                                return '<input type="checkbox" class="checkbox11"  id="chk1"  value="' + full[0] + '$$' + full[1].replace(/"/g, '&quot;') + '$$' + full[2] + '$$' + full[3] + '" name="chk1" onclick="getVal(this);">';
                                                            },
                                                        },
                                                        {
                                                            "aTargets": [1],
                                                            "mRender": function (data, type, full) {
                                                                return full[0];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [2],
                                                            "mRender": function (data, type, full) {
                                                                return full[1];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [3],
                                                            "mRender": function (data, type, full) {
                                                                return full[2];
                                                            }

                                                        },
                                                        {
                                                            "aTargets": [4],
                                                            "mRender": function (data, type, full) {
                                                                return full[3];
                                                            }

                                                        },
                                                    ],
                                                });


                                            }
                                            );
        </script>
        <script>
            NProgress.done();
        </script>
    </body>

</html>