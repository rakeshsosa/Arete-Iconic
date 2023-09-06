<%-- 
    Document   : selectSuppPopup
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

        <title>arête Assets Management</title>

        <!-- Bootstrap core CSS -->

        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
        <link href="../common/theme/fonts/css/font-awesome.css" rel="stylesheet">
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
            function test(val1, val2, val3, val4) {
                window.opener.document.getElementById('${id}').value = val4;
//                window.opener.document.getElementById('${suppcode}').value = val1;
//                window.opener.document.getElementById('${suppname}').value = val2;
//                
// Used in PO LIST Page
                if (document.getElementById('suppcode').value == 'sendEmail') {
                    window.close();
                    window.opener.sendEmail($('#poNo').val());

                }
                window.close();
            }

            checked = false;
            function checkAll() {
                var aa = document.getElementById('supmail');

                if (checked == false) {
                    checked = true;
                } else {
                    checked = false;
                }
                for (var i = 0; i < aa.elements.length; i++) {
                    aa.elements[i].checked = checked;
                }
            }

            function typelist(supmail) {
                var val4 = '';
                var val1 = '';
                var val2 = '';
                var split1 = '';
                var aa = document.getElementsByName('chk1');
                for (var i = 0; i < aa.length; i++) {
                    if (aa[i].checked) {
                        split1 = aa[i].value.split("$$");
                        val4 = val4 + split1[3] + ",";
//                        val1 = val1 + split1[0] + ",";
//                        val2 = val2 + split1[1] + ",";
                    }
                }
                window.opener.document.getElementById('${id}').value = val4;
            <%--  window.opener.document.getElementById('${suppcode}').value = val1;
window.opener.document.getElementById('${suppname}'.value = val2;--%>

                // Used in PO LIST Page
                if (document.getElementById('suppcode').value == 'sendEmail') {
                    window.close();
                    window.opener.sendEmail($('#poNo').val());

                }
                window.close();
            }


        </script>

        <div class="clearfix"></div>

        <div class="row">

            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">

                    <div class="x_title">
                        <h2>Supplier List</h2>

                        <div class="clearfix">

                        </div>                       
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal" id="supmail">
                            <!--suppCode and PoNo for sending email in polist and approved poList-->
                            <input type="hidden" id="suppcode" value="${suppcode}">
                            <input type="hidden" id="poNo" value="${id}">

                            <button type="button" class="btn btn-primary" style="font-size: 15px" onclick="typelist(supmail);">Add</button>
                            <table id="example" class="table table-striped responsive-utilities jambo_table" style="overflow-y:scroll;">
                                <thead>
                                    <tr class="headings">  
                                        <%--<c:if test="${action ne 'reqPOform'}">--%>
                                        <th>
                                            <input type="checkbox" id="selectall" onclick="checkAll();"/>

                                        </th>  
                                        <%--</c:if>--%>
                                        <th>Supplier Name</th>
                                        <th>Supplier Code</th>
                                        <th>Contact Number</th>
                                        <th>E-mail</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${supplierList}" var="type">
                                        <c:set var="search" value="'"/>
                                        <c:set var="replace" value="\\'"/>
                                        <c:set var="supplierName" value="${fn:replace(type.supplierName,search,replace)}"/>
                                        <tr class="even pointer" >
                                            <%--<c:if test="${action ne 'reqPOform'}">--%>
                                            <td><input type="checkbox" id="chk1" name="chk1" value="${type.supplierCode}$$${supplierName}$$${type.contNum}$$${type.mailId}"/></td>
                                                <%--</c:if>--%>
                                            <td onclick="test('${type.supplierCode}', '${supplierName}', '${type.contNum}', '${type.mailId}');">${type.supplierName}</td>
                                            <td onclick="test('${type.supplierCode}', '${supplierName}', '${type.contNum}', '${type.mailId}');">${type.supplierCode}</td>
                                            <td onclick="test('${type.supplierCode}', '${supplierName}', '${type.contNum}', '${type.mailId}');">${type.contNum}</td>
                                            <td onclick="test('${type.supplierCode}', '${supplierName}', '${type.contNum}', '${type.mailId}');">${type.mailId}</td> 
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
                                                });
        </script>

        <script>
            NProgress.done();
        </script>
    </body>

</html>
