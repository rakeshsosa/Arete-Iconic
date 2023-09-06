<%-- 
    Document   : selectItemMaster
    Created on : 12 Oct, 2016, 5:36:45 PM
    Author     : Shweta S
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

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">

        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">
        <link href="../common/theme/css/popupcustom.css" rel="stylesheet">
        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>        
        <script src="../common/theme/js/bootstrap.min.js"></script>       

        <!-- icheck -->
        <script src="../common/theme/js/icheck/icheck.min.js"></script>

        <!--[if lt IE 9]>
            <script src="../assets/js/ie8-responsive-file-warning.js"></script>
            <![endif]-->

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
              <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
    </head>


    <body>


        <script>
            checked = false;
            function checkAll() {
                var aa = document.getElementById('contDetForm');
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
                    alert("Please select the Item..!!");
                    return  false;
                }
                for (var i = 0; i < aa.length; i++) {
                    if (aa[i].checked) {

                        split1 = aa[i].value.split("//");

                        opener.addToGrid(split1[0], split1[1], split1[2], split1[3], split1[4], "", "");
                    }
                }
                window.close();
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
                var chkVal = document.getElementById("chk1" + rowCount).value.split("//");
                opener.addToGrid(chkVal[0], chkVal[1], chkVal[2], chkVal[3], chkVal[4], "", "");
            }

        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Accessory Master</h2>


                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="contDetForm">                            
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">
                                        <th>
                                            <input type="checkbox" id="selectall" onclick="checkAll();"/>
                                        </th>
                                        <th>Accessory Category</th>
                                        <th>Accessory Code</th>
                                        <th>Accessory Name</th>
                                        <th>Accessory Description</th> 
                                        <th>Accessory UOM</th>
                                        <!--                                        <th>Quantity</th>
                                                                                <th>Price</th>-->
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${itemMaster}" var="type">
                                        <c:forEach items="${uom}" var="list1">
                                            <c:if test="${list1.uomId eq type.itemUom}">
                                                <c:set var="itmuom" value="${list1.uomName}"></c:set>
                                                <c:set var="uomId" value="${list1.uomId}"></c:set> 
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${cat}" var="list">
                                            <c:if test="${list.categoryId eq type.itemCategory}">
                                                <c:set var="itmCat" value="${list.itemCategory}"></c:set>
                                                <c:set var="categoryId" value="${list.categoryId}"></c:set> 
                                            </c:if>
                                        </c:forEach>
                                        <tr >
                                            <td><input class="center" type="checkbox" id="chk1" onclick="getVal(this);" name="chk1" value="${type.itemCode}//${type.itemName}//${type.itemDesc}//${itmCat}//${itmuom}">
                                            <td class="center" style="text-align: left;width: 250px;"onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}', '${itmCat}', '${itmuom}');">${itmCat}</td>
                                            <td class="center"style="text-align: left;width: 250px;" onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}', '${itmCat}', '${itmuom}');">${type.itemCode}</td>
                                            <td class="center" style="text-align: left;width: 250px;"onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}', '${itmCat}', '${itmuom}');">${type.itemName}</td>
                                            <td class="center" style="text-align: left;width: 250px;"onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}', '${itmCat}', '${itmuom}');">${type.itemDesc}</td>
                                            <td class="center" style="text-align: left;width: 250px;"onclick="test('${type.itemCode}', '${type.itemName}', '${type.itemDesc}', '${itmCat}', '${itmuom}');">${itmuom}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>

                            </table>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <!-- Datatables -->
        <script src="../common/theme/js/datatables/js/jquery.dataTables.js"></script>

        <script>
                                                $(document).ready(function () {
                                                    $('input.tableflat').iCheck({
                                                        checkboxClass: 'icheckbox_flat-green',
                                                        radioClass: 'iradio_flat-green'
                                                    });
                                                });
                                                var asInitVals = new Array();
                                                $(document).ready(function () {
                                                    var oTable = $('#example').dataTable({
                                                        "oLanguage": {
                                                            "sSearch": "Search all columns:"
                                                        },
                                                        "aoColumnDefs": [
                                                            {
                                                                'bSortable': false,
                                                                'aTargets': [0]
                                                            } //disables sorting for column one
                                                        ],
                                                        'iDisplayLength': 10,
                                                        "sPaginationType": "full_numbers",
                                                        "dom": 'T<"clear">lfrtip',
                                                        "tableTools": {
                                                            "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                                        }
                                                    });
                                                    $("tfoot input").keyup(function () {
                                                        /* Filter on the column based on the index of this element's parent <th> */
                                                        oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                                    });
                                                    $("tfoot input").each(function (i) {
                                                        asInitVals[i] = this.value;
                                                    });
                                                    $("tfoot input").focus(function () {
                                                        if (this.className == "search_init") {
                                                            this.className = "";
                                                            this.value = "";
                                                        }
                                                    });
                                                    $("tfoot input").blur(function (i) {
                                                        if (this.value == "") {
                                                            this.className = "search_init";
                                                            this.value = asInitVals[$("tfoot input").index(this)];
                                                        }
                                                    });
                                                });</script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>

