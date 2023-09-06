<%-- 
    Document   : rentInvoiceList
    Created on : 12 Mar, 2019, 5:13:28 PM
    Author     : Lakshmi
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../common/theme/css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
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

        <!-- Bootstrap core CSS -->
        <script>
            setTimeout(function () {
                $('#successMessage').fadeOut('fast');
            }, 5000);
        </script>
        <script>
            function Generate(val,val1,val2)
            
             /// var invoice = document.getElementById("invoice").value;
            
            //  alert("Invoice Date:"+invoice);
            {
                
                 
              //  alert("Invoice Date:"+val);
                //  alert("Invoice Date:"+val1);  
                  // alert("tenaId:"+val2);  
                  
                var format = "PDF";

                if (format != "null" && format != "") {


                    if (format == "PDF") {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + 'rentInvoicePrint' + '&SNo=' + val + '&invoice=' + val1 +'&tenantId=' + val2 +'';
                        window.open(url, '_blank');
                        window.focus();
                    }


                }
            }
            function voidRecord(SNo)
            {
                if (confirm('Do you really want to Void this record')) {
                    //alert("Hiii");
                    window.location.href ='../tenant/rentInvoiceFormVoid.htm?sno='+SNo+'';
                }
            }
            function fetchVal()
            {
                //alert("Hi Generate");
                var propertyName = document.getElementById("propertyName").value;
                //alert(propertyName);
                var flatNo = document.getElementById("flatNo").value;
                //alert(flatNo);
                var tenantId = document.getElementById("tenantId").value;
                //alert(tenantId);
                var dated = document.getElementById("dated").value;
                //alert(dated);
                //var propertyName=document.getElementById("propertyName").value;
                window.location.href = '../finance/rentInvoiceList.htm?propertyName=' + propertyName + '&flatNo=' + flatNo + '&tenantId=' + tenantId + '&dated=' + dated + '';
            }
            function resetVal()
            {
                $('#propertyName').val('');
                $('#flatNo').val('');
                $('#tenantId').val('');
                $('#date').val('');
            }

            //for flatNo

            $(document).ready(function () {
                //alert("Tabname");
                $("#propertyName").change(function () {
                    //alert("Tabname");
                    var propertyName = document.getElementById("propertyName").value;
                    //alert("submodulename" + submodulename);
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../tenant/getFlatNo.htm?propertyName=' + propertyName + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            //alert("result" + result);
                            var items = "<option value=''>" + "Select your option" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                //alert("result" + result[i]);
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#flatNo").empty();
                            $("#flatNo").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            //for Tenant ID

            $(document).ready(function () {
                //alert("Tabname");
                $("#flatNo").change(function () {
                    //alert("Tabname");
                    var flatNo = document.getElementById("flatNo").value;
                    //alert("submodulename" + submodulename);
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../tenant/getTenantId.htm?flatNo=' + flatNo + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            //alert("result" + result);
                            var items = "<option value=''>" + "Select your option" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                //alert("result" + result[i]);
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantId").empty();
                            $("#tenantId").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
        </script>
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
                                        <jsp:include page="../login/headerlink.htm?submodule=Invoice Generation&tab=Rent Invoice&pagetype=list"/>
                                        <div class="row">
                                            <p>&nbsp;</p>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <label class="control-label">Property Name</label>
                                                <select id="propertyName" name="propertyName" class="form-control validate[required]">
                                                    <option value="" disabled selected>Select your option</option>
                                                    <c:forEach items="${propertyNames}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <label class="control-label">Flat Name/No.</label>
                                                <select id="flatNo" name="flatNo" class="form-control validate[required]" >
                                                    <option value="" disabled selected>Select your option</option>
                                                    <c:forEach items="${flatNumbers}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <label class="control-label">Tenant ID</label>
                                                <select id="tenantId" name="tenantId" class="form-control validate[required]">
                                                    <option value="" disabled selected>Select your option</option>
                                                    <c:forEach items="${tenantId}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <!--<label class="control-label">Year & Month</label>-->
                                                <input type="hidden" placeholder="Select Date" readonly="" class="form-control" id="dated"  maxlength="11" value="" onclick="javascript:NewCssCal('dated', 'ddMMMyyyy', '', '', '', '', '')">

                                            </div>
                                            <p>&nbsp;</p>
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                                <div class="col-sm-9 col-xs-12 col-md-offset-5">
                                                    <button type="submit" class="btn btn-primary" style="" onclick="return fetchVal();">Search</button>
                                                    <button type="button" class="btn btn-danger" style="" onclick="return resetVal();">Reset</button>
                                                </div>

                                            </div>

                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="x_panel">


                                                    <div class="x_title">
                                                        <h2>Rent Invoice List</h2>
                                                        <div class="clearfix">
                                                            <p id="successMessage" style="text-align: center;color: blue;font-family:bold;">${message}</p>
                                                            <c:remove var="message" scope="session" /> 
                                                        </div>
                                                    </div>
                                                    <c:forEach items="${permission}" var="type">
                                                        <c:set var="add" value="${type.newEntry}"></c:set>
                                                        <c:set var="edit" value="${type.edit}"></c:set>
                                                        <c:set var="inactive" value="${type.inactive}"></c:set>
                                                        <c:set var="review" value="${type.review}"></c:set>
                                                        <c:set var="approve" value="${type.approve}"></c:set>
                                                    </c:forEach>
                                                    <div class="x_content">
                                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                                            <thead>

                                                                <tr class="headings">
                                                                    <th>Invoice No.</th>
                                                                    <th>Tenant Code</th>
                                                                    <th>Tenant Name</th>
                                                                    <th>Property Name</th>
                                                                    <th>Billing Cycle</th>
                                                                    <th>Flat Name/No.</th>
                                                                    <th>Due Date</th>
                                                                  
                                                                    <th>Rent Amount</th>
                                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                    </th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                                <c:forEach items="${invoiceList}" var="list">
                                                                    <c:forEach items="${invoiceList1}" var="type">
                                                                        <c:if test="${type eq list.invoiceNo}">
                                                                            <c:set var="invoiceNo" value="${type}"/>
                                                                        </c:if> 
                                                                    </c:forEach>

                                                                    <tr class="even pointer">         
                                                                        <td class=""style="text-align: left;">${list.invoiceNo}</td>
                                                                        <td class=""style="text-align: left;">${list.tenantCode}</td>
                                                                        <td class=""style="text-align: left;">${list.tenantName}</td>
                                                                        <td class=""style="text-align: left;">${list.assetName}</td>
                                                                        <td class=""style="text-align: left;">${list.billingCycle}</td>
                                                                        <td class=""style="text-align: left;">${list.flatNo}</td>
                                                                        <td class=""style="text-align: left;"><fmt:formatDate pattern="dd-MMM-yyyy" value="${list.dueDate}"/></td>
                                                                        <td class=""style="text-align: left;">${list.rentAmount}</td>
                                                                        

                                                                        <td class="" style="width: 250px;text-align: center;">
                                                                            <a href="../tenant/rentInvoiceForm.htm?pk=${list.SNo}&invoiceNo=${list.invoiceNo}&action=view" class="fa fa-eye fa-lg"title="View"></a>&nbsp;

                                                                            <c:if test="${list.invoiceNo eq invoiceNo}">
                                                                                <a href="../tenant/rentInvoiceForm.htm?pk=${list.SNo}&invoiceNo=${list.invoiceNo}&action=edit" class="fa fa-pencil fa-lg fa-lg"title="Edit"></a>&nbsp;
<!--                                                                                <a class="fa fa-lg fa-ban" href="../tenant/rentInvoiceFormVoid.htm?sno=${list.SNo}&invoiceNo=${list.invoiceNo}&tenantCode=${list.tenantCode}&action=void&propertyName=${list.assetName}&dueDate=${list.dueDate}" onclick="if (confirm('Do you really want to Void this record?')) {
                                                                                            return true;
                                                                                        } else {
                                                                                            return false;
                                                                                        }" title=Void>
                                                                                </a>-->
                                                                                <a class="fa fa-lg fa-ban" onclick="voidRecord(${list.SNo});" title="Void">
                                                                                <i class=""> </i></a>
                                                                                            &nbsp;
                                                                            </c:if>
                                                                            
                                                                              
                                                                                            <input type="hidden" class="form-control" name="invoiceDate" readonly="" id="invoiceDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.invoiceDate}"/>">
                                                                                            <input type="hidden" class="form-control" name="tenantId" readonly="" id="tenantId" value="${list.tenantId}"/>
                                                                            <a class="fa fa-print fa-lg" onclick="Generate('${list.SNo}','${list.invoiceDate}','${list.tenantId}');" title="Print">
                                                                                <i class=""> </i></a>
                                                                                
                                                                             

                                                                        </td>
                                                                    </tr>
                                                                    
                                                                    
                                                                </c:forEach>

                                                            </tbody>

                                                        </table>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>	


                                </div>

                            </div>
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
                                                                                                'aTargets': [2]
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

        </div>
    </div>
</div>
</div>
</div>
</div>
<!-- /page content -->
</div>


</div>

<div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
</div>
<script>
    function sendEmail(tC, Mail) {
        window.location.href = "../tenant/sendPOEmail.htm?tC=" + tC + "&tEmail=" + Mail + "&action=view";
    }

    function sendSMS(tC, Sms) {
        window.location.href = "../tenant/sendSMS.htm?tC=" + tC + "&tSms=" + Sms + "&action=view";
    }

    NProgress.done();
</script>
</body>

</html>
