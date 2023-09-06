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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Arete</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
        <!--<link href="../common/theme/fonts/css/font-awesome.css" rel="stylesheet">-->
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
            function test(val2, val3, val5) {
//                window.opener.document.getElementById('Class').value = val1;
                window.opener.document.getElementById('itemCode').value = val2;
                window.opener.document.getElementById('itemName').value = val3;
//                window.opener.document.getElementById('mtid').value = val4;
                window.opener.document.getElementById('itemDesc').value = val5;
                window.close();
            }

            checked = false;
            function checkAll() {
                var flag = false;
                var aa = document.getElementById('contDetForm');
                // alert('test');
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

            function typelist(contDetForm) {
                var split1 = '';
                var aa = document.getElementsByName('chk1');
                var atLeastOneIsChecked = $('input[name="chk1"]:checked').length > 0;
                if (atLeastOneIsChecked <= 0) {
//                    alert("Please select the items..!!");
                    return  false;
                }

                for (var i = 0; i < aa.length; i++) {
                    if (aa[i].checked) {

                        split1 = aa[i].value.split("$$");
//                       
                        opener.addOrderRow_test(split1[0], split1[1], split1[2], split1[3]);
                    }
                }

//                window.opener.document.getElementById('itemCode').value = val2;
//                window.opener.document.getElementById('itemName').value = val3;
//                window.opener.document.getElementById('itemDesc').value = val4;
//                window.opener.document.getElementById('itemsubCat').value = val5;
//                window.opener.addOrderRow_test(val2,val3,val4,val5);
//                $('input[name="chk1"]:checked').removeAttr('checked');
//                $('input[id="selectall"]:checked').removeAttr('checked');
//                window.close();

            }
            function getVal($this) {
                if (!$($this).is(':checked'))
                {
                    return false;
                }

                var x = document.getElementById("example").rows.length;
                var $itemRow = $($this).closest('tr');
                var rowCount = ($($this).closest("tr")[0].rowIndex);
                $itemRow.find('#chk1').attr('id', "chk1" + rowCount);

                var chkVal = document.getElementById("chk1" + rowCount).value.split("$$");
                opener.addOrderRow_test(chkVal[0], chkVal[1], chkVal[2], chkVal[3]);
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


                        <form class="form-horizontal" id="contDetForm">
                            <div class="col-md-4 col-sm-12 col-xs-12 col-md-offset-2" style="margin-bottom:-20px;">
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <!--<button type="button" class="btn btn-succ" onclick="typelist(contDetForm);" style=""><i class="fa fa-plus-circle"> ADD</i></button>-->
                                </div></div>
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">                                                    
                                        <th>

                                            <input type="checkbox" id="selectall" onclick="checkAll();"/>

                                        </th>        
                                        <th>Item Category</th>
                                        <th>Item Code</th>
                                        <th>Item Name</th>
                                        <th>Item Description</th>
                                        <!--                                                                  <th>Spec Drawing No</th>-->
                                        <!--<th class=" no-link last"><span class="nobr">Action</span>-->

                                    </tr>
                                </thead>

                                <tbody>
                                <%--    <c:forEach items="${itemList}" var="type">

                                        <tr>
                                            <td><input type="checkbox" id="chk1" name="chk1" value="${type.itemCode}/${type.itemName}/${type.itemDesc}/"/></td>
                                            <td class="center" onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}');">${type.itemCode}</td>
                                            <td class="center" onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}');">${type.itemName}</td>
                                            <td class="center" onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}');"><c:set var="desc" value="${fn:substring(type.itemDesc, 0, 100)}"/>${desc}</td>


                                        </tr>
                                    </c:forEach> --%>

                                </tbody>

                            </table>
                        </form>
                    </div>
                </div>
            </div>

        </div>



        <!-- Datatables -->
        <!--<script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>-->

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
                                                        "sAjaxSource": "../purchase/paginationList.htm?listPage=selectItems&itemCat=" + '${itemCat}',
                                                        "aoColumnDefs": [
                                                            {
                                                                "aTargets": [0],
                                                                "bSortable": false,
                                                                "bServerSide": false,
                                                                "mRender": function (data, type, full) {
                                                                    var itemDesc = "";
                                                                    if (full[2] != null) {
                                                                        itemDesc = full[2].replace(/"/g, '&quot;');
                                                                    }
                                                                    return '<input type="checkbox" id="chk1" name="chk1"  value="' + full[0] + '$$' + full[1].replace(/"/g, '&quot;') + '$$' + itemDesc + '$$' + full[3] + '$$" onclick="getVal(this);"/>';
                                                                }

                                                            },
                                                            {
                                                                "aTargets": [1],
                                                                "mRender": function (data, type, full) {
                                                                    return full[3];
                                                                }

                                                            },
                                                            {
                                                                "aTargets": [2],
                                                                "mRender": function (data, type, full) {
                                                                    return full[0];
                                                                }

                                                            },
                                                            {
                                                                "aTargets": [3],
                                                                "sWidth": "400px",
                                                                "mRender": function (data, type, full) {
                                                                    return full[1];
                                                                }

                                                            },
                                                            {
                                                                "aTargets": [4],
                                                                "sWidth": "250px",
                                                                "mRender": function (data, type, full) {

                                                                    return full[2];
                                                                }

                                                            },
                                                        ],
                                                    });
                                                });

        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
