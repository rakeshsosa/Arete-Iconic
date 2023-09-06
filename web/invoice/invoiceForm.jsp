<%-- 
    Document   : invoiceForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
--%>

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
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
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
                                <jsp:include page="../login/headerlink.htm?submodule=GRN&tab=Invoice Screen&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Property Details</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="poformdetails" class="form-inline" action="../invoice/saveInvoiceDetails.htm" method="post">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label"><span style="color: red">*</span> Supplier Code</label>
                                            <select class="form-control"  id="supplierName" data-rel="chosen" required name="supplierName">
                                                <option></option>
                                                <c:forEach items="${supplierDetails}" var="sd">
                                                    <option>${sd}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label" style="padding-right: 20px;"> PO No</label>
                                            <select class="form-control" data-rel="chosen" id="pono" required name="pono" multiple="" onchange="selectPONO();">
                                                <option></option>
                                            </select>
                                            <span style="padding-left: 19px; color: blue;">
                                                (OR)
                                            </span>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label" style="padding-right: 20px;"> GRN</label>
                                            <select class="form-control" data-rel="chosen" id="grn" required name="grn" multiple="" onchange="selectGRN();">
                                                <option></option>
                                            </select>
                                        </div>
                                        <!--<p>&nbsp;</p><p>&nbsp;</p>-->
                                        <input type="hidden" id="stype" name="stype" value=""/>
                                        <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;padding-top: 10px;">

                                            <table  class="table table-striped responsive-utilities jambo_table" id="invoicetbl">
                                                <thead>
                                                    <tr>
                                                        <th><span style="color:red">*</span></th>
                                                        <th> S.No</th>
                                                        <th> PO No</th>
                                                        <th> GRN No</th>
                                                        <th><span style="color:red">*</span> Document Type</th>
                                                        <th> Document Ref</th>
                                                        <th> Document Date</th>
                                                        <th> Payment Terms</th>
                                                    </tr>

                                                </thead>
                                                <tbody id="invoicetblbody">
                                                    <tr class="invtbl"></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="clearfix"></div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 ">
                                                <!--<p>&nbsp;</p>-->
                                                <button type="button" class="btn btn-primary" onclick="saveDetails();">Save</button>
                                                <a href="../invoice/invoiceList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </div>
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

            function uniqueUomCode() {
                var categoryName = document.getElementById("uomCode").value;
                $.ajax({
                    type: "POST",
                    url: '../mastercodes/getUomCode.htm',
                    data: {
                        uomCode: categoryName,
                    },
                    success: function (data) {
                        if ($.trim(data) == 'Already Exists.') {
                            alert("Uom Code Already Exist");
                            document.getElementById("uomCode").value = "";
                            return false;
                        }
                    }
                });
            }

        </script>
        <script>
            $(document).ready(function () {
                $("#supplierName").change(function () {
                    var supplierNo = $('#supplierName').val();
                    $.ajax({
                        type: "POST",
                        url: '../invoice/getPONo.htm',
                        data: {
                            supplierNo: supplierNo,
                        },
                        success: function (data) {
                            var poNoArr = data.split("_");
                            document.getElementById("pono").options.length = 0;
                            var dropdown1 = document.getElementById("pono");
                            if (!supplierNo == null || !supplierNo == "") {
                                var option1 = document.createElement("option");
                                option1.text = '';
                                dropdown1.add(option1);
                            }
                            var i;
                            for (i = 0; i < poNoArr.length; i++) {
                                var dropdown = document.getElementById("pono");
                                var option = document.createElement("option");
                                option.text = poNoArr[i];
                                dropdown.add(option);
                            }
                        }
                    });


                    var supplierNo = $('#supplierName').val();
                    $.ajax({
                        type: "POST",
                        url: '../invoice/getGRNNo.htm',
                        data: {
                            supplierNo: supplierNo,
                        },
                        success: function (data) {
                            var poNoArr = data.split("_");
                            document.getElementById("grn").options.length = 0;
                            var dropdown1 = document.getElementById("grn");
                            if (!supplierNo == null || !supplierNo == "") {
                                var option1 = document.createElement("option");
                                option1.text = '';
                                dropdown1.add(option1);
                            }
                            var i;
                            for (i = 0; i < poNoArr.length; i++) {
                                var dropdown = document.getElementById("grn");
                                var option = document.createElement("option");
                                option.text = poNoArr[i];
                                dropdown.add(option);
                            }
                        }
                    });
                });


            });
            function getPODetails(obj, no) {
                var pono = obj.id;
                var grnval = document.getElementById("grn" + no).innerHTML;
                document.getElementById("selectpo" + no).checked = false;
                myWindow = window.open("../invoice/getItemDetailsByPO.htm?pono=" + pono + "&no=" + no + "&grnno=" + grnval, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function getPODetailsByGRN(obj, no) {
                var grn1 = $('#grn').val();
                var grn;
                for (l = 0; l < grn1.length; l++) {
                    if (grn == null || grn == "") {
                        grn = grn1[l];
                    }
                    else {
                        grn = grn + "_" + grn1[l];
                    }
                }
                var pono = obj.id;

                document.getElementById("selectpo" + no).checked = false;
                myWindow = window.open("../invoice/getItemDetailsByPOWithGRN.htm?pono=" + pono + "&no=" + no + "&grnno=" + grn, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function selectPONO() {
                $('.invtbl').html("");
                document.getElementById("stype").value = "po";
                var pono1 = $('#pono').val();
                var l;
                var pono;
                for (l = 0; l < pono1.length; l++) {
                    if (pono == null || pono == "") {
                        pono = pono1[l];
                    }
                    else {
                        pono = pono + "_" + pono1[l];
                    }
                }
//                            var pono=document.getElementById('pono').value;
//                                alert(pono);
                var supplierNo = $('#supplierName').val();
                if (!pono == null || !pono == "") {
                    document.getElementById('grn').selectedIndex = 0;
                    $.ajax({
                        type: "POST",
                        url: '../invoice/getGRNDetailsBySupNoAndPONo.htm',
                        data: {
                            supplierNo: supplierNo,
                            pono: pono
                        },
                        success: function (data) {
                            var rowArr = data.split("_");
                            var today = new Date();
                            var dd = today.getDate();
                            var mm = today.getMonth() + 1;
                            var yyyy = today.getFullYear();
                            var cDate = dd + '-' + mm + '-' + yyyy;

                            var alltbl;
                            var i;
                            for (i = 0; i < rowArr.length; i++) {
                                var j = parseInt(i) + 1;
                                var valArr = rowArr[i].split(",");

                                var rowStart = '<tr class="invtbl" id="invtbl' + j + '">'
                                var invChkBox = '<td align="center"><input type="checkbox" class="pocbox" id="selectpo' + j + '" name="selectpo" value="' + j + '"></td>';
                                var sno = '<td align="center"><span>' + j + '</span></td>';
                                var pono = '<td align="center"><span style="cursor:pointer;text-decoration: underline;color: rgb(40, 40, 149);" id="' + valArr[0] + '" onclick="getPODetails(this,' + j + ')">' + valArr[0] + '</span></td>';
                                var grnno = '<td align="center"><span id="grn' + j + '">' + valArr[4] + '</span></td>';
                                var docType = '<td align="center"><select class="form-control" data-rel="chosen" id="doctype' + j + '" required name="doctype' + j + '"><option></option><option>Invoice</option><option>Delivery Note</option></select></td>';
                                var docRef = '<td align="center"><span>' + valArr[3] + '</span></td>';
                                var docDate = '<td align="center"><span>' + valArr[2] + '</span></td>';
                                var payTerms = '<td align="center"><span>' + valArr[1] + '</span><input type="hidden" value="' + valArr[4] + '" id="grno' + j + '" name="grno' + j + '"/><input type="hidden" value="' + valArr[0] + '" id="hpono' + j + '" name="hpono' + j + '"/><input type="hidden" value="" id="unitp' + j + '" name="unitp' + j + '"/><input type="hidden" value="" id="grnq' + j + '" name="grnq' + j + '"/></td>';
                                var rowEnd = '</tr>';
                                alltbl = [rowStart + invChkBox + sno + pono + grnno + docType + docRef + docDate + payTerms + rowEnd].join('');
                                var $row4 = $(alltbl);

                                // Add row after the first row in table
                                $('#invoicetblbody').after($row4);
                            }
//                                           tr.innerHTML
                        }
                    });


                }
            }
            function selectGRN() {
                $('.invtbl').html("");
                document.getElementById("stype").value = "grn";
                var supplierNo = $('#supplierName').val();
                var grn1 = $('#grn').val();
                var l;
                var grn;
                for (l = 0; l < grn1.length; l++) {
                    if (grn == null || grn == "") {
                        grn = grn1[l];
                    }
                    else {
                        grn = grn + "_" + grn1[l];
                    }
                }
                if (!grn == null || !grn == "") {
                    document.getElementById('pono').selectedIndex = 0;
                    $.ajax({
                        type: "POST",
                        url: '../invoice/getGRNDetailsBySupNoAndGRN.htm',
                        data: {
                            supplierNo: supplierNo,
                            grn: grn,
                        },
                        success: function (data) {
                            var rowArr = data.split("_");

                            var alltbl;
                            var i;
                            for (i = 0; i < rowArr.length; i++) {
                                var abc = grn;
                                var j = parseInt(i) + 1;
                                var valArr = rowArr[i].split(",");

                                var rowStart = '<tr class="invtbl">'
                                var invChkBox = '<td align="center"><input type="checkbox" class="pocbox" id="selectpo' + j + '" name="selectpo" value="' + j + '"></td>';
                                var sno = '<td align="center"><span>' + j + '</span></td>';
                                var pono = '<td align="center"><span style="cursor:pointer;text-decoration: underline;color: rgb(40, 40, 149);" id="' + valArr[0] + '" onclick="getPODetailsByGRN(this,' + j + ')">' + valArr[0] + '</span></td>';
                                var grnno = '<td align="center"><span>' + valArr[4] + '</span></td>';
                                var docType = '<td align="center"><select class="form-control" data-rel="chosen" id="doctype' + j + '" required name="doctype' + j + '"><option></option><option>Invoice</option><option>Delivery Note</option></select></td>';
                                var docRef = '<td align="center"><span>' + valArr[3] + '</span></td>';
                                var docDate = '<td align="center"><span>' + valArr[2] + '</span></td>';
                                var payTerms = '<td align="center"><span>' + valArr[1] + '</span><input type="hidden" value="' + valArr[4] + '" id="grno' + j + '" name="grno' + j + '"/><input type="hidden" value="' + valArr[0] + '" id="hpono' + j + '" name="hpono' + j + '"/><input type="hidden" value="" id="unitp' + j + '" name="unitp' + j + '"/><input type="hidden" value="" id="grnq' + j + '" name="grnq' + j + '"/></td>';
                                var rowEnd = '</tr>';
                                alltbl = [rowStart + invChkBox + sno + pono + grnno + docType + docRef + docDate + payTerms + rowEnd].join('');
                                var $row4 = $(alltbl);

                                // Add row after the first row in table
                                $('#invoicetblbody').after($row4);
                            }
//                                           tr.innerHTML
                        }
                    });
                }
            }

            function saveDetails() {
                var checkedValues = $('input:checkbox:checked').map(function () {
                    return this.value;
                }).get();
                var iCnt = 0;
                var i;
                for (i = 0; i < checkedValues.length; i++) {
                    var sno = checkedValues[i];
                    var ddID = "doctype" + sno;
                    var e = document.getElementById(ddID);
                    var docType = e.options[e.selectedIndex].value;
                    if ((docType == null || docType == "")) {
                        //no-op
                    }
                    else {
                        iCnt = parseInt(iCnt) + 1;
                    }
                }
                if ((parseInt(checkedValues.length) == parseInt(iCnt)) && ((parseInt(checkedValues.length) > 0))) {
                    var r = confirm("Do you really want to save this record.");
                    if (r == true) {
                        document.getElementById("poformdetails").submit();
                    }
                }
                else {
                    alert("Mandatory field should not be empty...");
                }
            }
        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>
    </body>

</html>
