<%--
    Document   : correspondenceReport
    Created on : 22 Oct, 2016, 3:39:14 PM
    Author     : ebs-sdd41
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>        
        <title>Arete Iconic</title>
         <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">    </head>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.min.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>

        <style>
            .hello{
                width: 250px;
                height: 30px;
            }          
            .spaceContainer{
                margin-bottom: 10px;
            }
        </style>

        <script>


            //for Tenant Details
            $(document).ready(function () {
                $("#tanantc").change(function () {

                    var tenant_code = $('#tanantc').val();
                    var asset_name = $('#tenantDetailsAssetName').val();

                    // if (tenant_code == 'ALL' || tenant_code == '') {
                    //    return false;
                    // }
                    var request_url = '../reports/getTenantName.htm?tenantCode=' + tenant_code + '&assetName=' + asset_name + '';
                    $.ajax({url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tanantNameTD").empty();
                            $('#tanantNameTD').append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for service history tenant code
            $(document).ready(function () {
                $("#assetNameService").change(function () {
                    var selectedasset = $("#assetNameService").val();
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getServiceTenantCode.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Code" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantCodeService").empty();
                            $("#tenantCodeService").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            $(document).ready(function () {
                $("#tenantDetailsAssetName").change(function () {
                    var selectedasset = $("#tenantDetailsAssetName").val();
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getTenantDetailsCode.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Code" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tanantc").empty();
                            $("#tanantc").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            function updateAssetName() {
                var selectedasset = $("#amountDuesAssetName").val();
                // if (selectedasset == 'ALL' || selectedasset == '') {
                //     return false;
                //  }
                var request_url = '../reports/getAmountDuesTenantName.htm?assetName=' + selectedasset + '';
                $.ajax({
                    url: request_url,
                    success: function (data) {
                        var result = JSON.parse(data);
                        var items = "<option value=''>" + "Select Tenant Code" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                        for (var i = 0; i < result.length; i++) {
                            items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                        }
                        $("#amountDuesTenantName").empty();
                        $("#amountDuesTenantName").append(items);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Status: " + textStatus);
                        alert("Error: " + errorThrown);
                    }
                });
            }

            //for service history tenant name
            $(document).ready(function () {
                $("#assetNameService").change(function () {
                    var selectedasset = $("#assetNameService").val();
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getServiceAssetTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameService").empty();
                            $("#tenantNameService").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#tenantDetailsAssetName").change(function () {
                    var selectedasset = $("#tenantDetailsAssetName").val();
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getTenantDetailsName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tanantNameTD").empty();
                            $("#tanantNameTD").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            //for service history tenant name
            $(document).ready(function () {
                $("#tenantCodeService").change(function () {
                    var selectedcode = $("#tenantCodeService").val();
                    var selectedasset = $("#assetNameService").val();
                    //  if (selectedcode == 'ALL' || selectedcode == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getServiceTenantName.htm?tenantCode=' + selectedcode + '&assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameService").empty();
                            $("#tenantNameService").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            //for dues history tenant code
            $(document).ready(function () {
                $("#assetNameDues").change(function () {
                    var selectedasset = $("#assetNameDues").val();
                    //  if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getDuesTenantCode.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Code" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantCodeDues").empty();
                            $("#tenantCodeDues").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            //for dues history tenant code
            $(document).ready(function () {
                $("#assetNameDues").change(function () {
                    var selectedasset = $("#assetNameDues").val();
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../reports/getDuesAssetTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameDues").empty();
                            $("#tenantNameDues").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for dues history tenant name
            $(document).ready(function () {
                $("#tenantCodeDues").change(function () {
                    var selectedcode = $("#tenantCodeDues").val();
                    var selectedasset = $("#assetNameDues").val();
                    // if (selectedcode == 'ALL' || selectedcode == '') {
                    //     return false;
                    // }
                    var request_url = '../reports/getDuesTenantName.htm?tenantCode=' + selectedcode + '&assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameDues").empty();
                            $("#tenantNameDues").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for advance history tenant code
            $(document).ready(function () {

                $("#assetNameAdvance").change(function () {
                    var selectedasset = $("#assetNameAdvance").val();
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../reports/getAdvanceTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameAdvance").empty();
                            $("#tenantNameAdvance").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for rentpaid history tenant code
            $(document).ready(function () {
                $("#assetNameRent").change(function () {
                    var selectedasset = $("#assetNameRent").val();
                    //  if (selectedasset == 'ALL' || selectedasset == '') {
                    //      return false;
                    //   }
                    var request_url = '../reports/getRentTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tenantNameRent").empty();
                            $("#tenantNameRent").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            //for agreement renewal details tenant name
            $(document).ready(function () {
                $("#renewalDetailsAssetName").change(function () {
                    var selectedasset = $("#renewalDetailsAssetName").val();
                    //  if (selectedasset == 'ALL' || selectedasset == '') {
                    //      return false;
                    //   }
                    var request_url = '../reports/getRenewalTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#renewalDetailsTenantName").empty();
                            $("#renewalDetailsTenantName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
//made by pavi

            $(document).ready(function () {
                $("#tenantDetailsAssetName").change(function () {
                    var selectedasset = $("#tenantDetailsAssetName").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getSubassetFlatName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Flat Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#depreciationFlatName").empty();
                            $("#depreciationFlatName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            //made by pavi
            $(document).ready(function () {
                $("#rentproperty").change(function () {
                    var selectedasset = $("#rentproperty").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }

                    var request_url = '../reports/getRentTenant.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";

                            }

                            $("#renttenant").empty();
                            $("#renttenant").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            $(document).ready(function () {
                $("#rentproperty").change(function () {
                    var selectedasset = $("#rentproperty").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getRentFlatName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Flat Name" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#rentflat").empty();
                            $("#rentflat").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#rentpropertyname").change(function () {
                    var selectedasset = $("#rentpropertyname").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getRentFlatName1.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Flat Name" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#rentflat").empty();
                            $("#rentflat").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

//     $(document).ready(function () {
//                $("#tenantDetailsAssetName").change(function () {
//                    var selectedasset = $("#tenantDetailsAssetName").val();
//                    // if (selectedasset == 'ALL' || selectedasset == '') {
//                    //     return false;
//                    //  }
//                    var request_url = '../reports/getflatDetailsName.htm?assetName=' + selectedasset + '';
//                    $.ajax({
//                        url: request_url,
//                        success: function (data) {f
//                            var result = JSON.parse(data);
//                            var items = "<option value=''>" + "Select flat_no" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
//                            for (var i = 0; i < result.length; i++) {
//                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
//                            }
//                            $("#flatnoID").empty();
//                            $("#flatnoID").append(items);
//                        },
//                        error: function (XMLHttpRequest, textStatus, errorThrown) {
//                            alert("Status: " + textStatus);
//                            alert("Error: " + errorThrown);
//                        }
//                    });
//                });
//            });

        </script>

    </head>
    <body class="nav-md">

        


             <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                             <ul class="nav nav-pills" style="margin-bottom: -20px;">
                                 <li class="nav-item "><a class="nav-link active" href="#">Reports</a></li> &nbsp;
                           </ul>  
                        </div>
                            <div>
                                <jsp:include page="../login/headerlink.htm"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">
                                            
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Finance Reports</h5>
                                                </div>

                                    <form id="quotform" class="row" method="post">
                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspType</label>
                                            
                                                <select id="name" class="form-select" required onchange="showReports();" class="hello">
                                                    <option>Select Report Type</option>                                                                                 
                                                    <option id="name" value="tenant">Finance&nbsp&nbspReport&nbsp&nbspGeneration</option>  
                                                </select>
                                          
                                        </div>

                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspFormat</label>
                                            
                                                <select id="format" required class="form-select">
                                                    <option>Select Format</option>
                                                    <option value="PDF">PDF</option>        
                                                    <option value="EXCEL">EXCEL</option>
                                                </select>
                                           
                                        </div>

                                        <div class="col-md-4 mb-3" id="report1">
                                            <label class="control-label"><span style="color: red">*</span>Finance Report Name</label>
                                            <div class="controls" id="report">
                                                <select id="reportid" required onchange="showDivison();" class="form-select">
                                                    <option value="">Select Report Name</option>    
                                                      <option value="AgingReport">Aging Report</option>
                                                       <option value="AccReceivableReport">Account Receivable Report</option>
<!--                                                       <option value="LedgerReport">Ledger Report</option>
                                                       <option value="ProfitAndLoss">Profit and Loss</option>
                                                       <option value="CashFlow">Cash Flow</option>
                                                       <option value="BalanceSheet">Balance Sheet</option>
                                                       -->
                                   
                                                </select>
                                            </div>
                                        </div>
                                    
                                           <div class="col-md-4 mb-3" id="userIDForAgingHide">
                                            <label class="control-label"><span style="color: red">*</span>User ID</label>
                                           
                                            <select id="userIDForAging" required="" class="form-select">
                                                    <option value="">Select User ID</option>
                                                    
                                                    <c:forEach items="${UserIDFromAging}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                           
                                        </div>
                                         <div class="col-md-4 mb-3" id="reportTypeAgingHide">
                                            <label class="control-label"><span style="color: red">*</span>Report Type</label>
                                           
                                            <select id="reportTypeAging" required="" class="form-select">
                                                    <option value="">Select Report Type</option>
                                                    <option value="">Aging By Type</option> 
                                                    <option value="">Aging By Summary</option> 
                                                </select>                                           
                                        </div>
                                        <div class="col-md-4 mb-3" id="selectTypeAgingHide">
                                            <label class="control-label"><span style="color: red">*</span>Select Type</label>
                                           
                                            <select id="selectTypeAging" required="" class="form-select">
                                                    <option value="">Rent</option>
                                                    <option value="">Service</option> 
                                                      <option value="">Other</option>
                                                    
                                                </select>                                           
                                        </div>
                                         <div class="col-md-4 mb-3" id="propertyNameAgingHide">
                                            <label class="control-label"><span style="color: red">*</span>Property Name</label>
                                           
                                            <select id="propertyNameAging" required="" class="form-select">
                                                    <option value="">All</option>
                                                    <option value="">Property A</option> 
                                                      <option value="">Property B</option>
                                                    
                                                </select>                                           
                                        </div>
                                          <div class="col-md-4 mb-3" id="unitAgingHide">
                                            <label class="control-label"><span style="color: red">*</span>Unit</label>
                                           
                                            <select id="unitAging" required="" class="form-select">
                                                    <option value="">All</option>
                                                    <option value="">Unit</option> 
                                                      <!--<option value="">Property B</option>-->
                                                    
                                                </select>                                           
                                        </div>
                                       <div class="col-md-4 mb-3 pickledger1" id="agingFromDate">
                                            <label class="control-label"><span style="color: red">*</span>Aging From Date</label>
                                           
                                            <input type="text" id="agingFrom" required="" class="datepickerledger form-control" name="ledgerFrom">
                                       
                                        </div>
                                        <div class="col-md-4 mb-3 pickledger2" id="agingToDate">
                                            <label class="control-label"><span style="color: red">*</span>Aging To Date</label>
                                            
                                            <input type="text" id="agingTo" required="" class="datepickerledger1 form-control" name="ledgerTo">
                                            
                                        </div>
                                        
                                         <div class="col-md-4 mb-3" id="selectTypeAccReceivableHide">
                                            <label class="control-label"><span style="color: red">*</span>Select Type</label>
                                           
                                            <select id="selectTypeAccReceivable" required="" class="form-select">
                                                    <option value="">Rent</option>
                                                    <option value="">Service</option> 
                                                      <option value="">Other</option>
                                                    
                                                </select>                                           
                                        </div>
                                           <div class="col-md-4 mb-3" id="propertyNameAccReceivableHide">
                                            <label class="control-label"><span style="color: red">*</span>Property Name</label>
                                           
                                            <select id="propertyNameAccReceivable" required="" class="form-select">
                                                    <option value="">All</option>
                                                    <option value="">Property 1</option> 
                                                      <option value="">Property 2</option>
                                                    
                                                </select>                                           
                                        </div>
                                          <div class="col-md-4 mb-3" id="unitAccReceivableHide">
                                            <label class="control-label"><span style="color: red">*</span>Unit</label>
                                           
                                            <select id="unitAccReceivable" required="" class="form-select">
                                                    <option value="">All</option>
                                                    <option value="">Unit</option> 
                                                      <!--<option value="">Property B</option>-->
                                                    
                                                </select>                                           
                                        </div>
                                       <div class="col-md-4 mb-3 pickledger1" id="accReceivableFromDate">
                                            <label class="control-label"><span style="color: red">*</span>Account Receivable From Date</label>
                                           
                                            <input type="text" id="accReceivableFrom" required="" class="datepickerledger form-control" name="accReceivableFrom">
                                       
                                        </div>
                                        <div class="col-md-4 mb-3 pickledger2" id="accReceivableToDate">
                                            <label class="control-label"><span style="color: red">*</span>Account Receivable To Date</label>
                                            
                                            <input type="text" id="accReceivabbleTo" required="" class="datepickerledger1 form-control" name="accReceivabbleTo">
                                            
                                        </div>
                                        
                                        
                                        
                                        
                                        
<!--                                        <div class="col-md-4 mb-3" id="ledgerNoHide">
                                            <label class="control-label">Ledger Number</label>
                                           
                                                <select id="ledgerNo" class="form-select">
                                                    <option value="">Select an option</option>
                                                    
                                                    <%--<c:forEach items="${getLedgerNo}" var="type">--%>
                                                        <option value="${type}">${type}</option>
                                                    <%--</c:forEach>--%>
                                                 
                                                </select>
                                           
                                        </div>-->

<!--                                          <div class="col-md-4 mb-3" id="ledgerUserIdHide">
                                            <label class="control-label">User ID</label>
                                           
                                                <select id="ledgerUser" class="form-select">
                                                    <option value="">Select User ID</option>
                                                    <option value="admin">Admin</option>
                                                   
                                                </select>
                                       
                                        </div>-->
                                         
                                        <!--<div class="col-md-4 mb-3 pickledger1" id="ledgerFromDate">-->
<!--                                            <label class="control-label">Ledger From Date</label>
                                           
                                                <input type="text" id="ledgerFrom" class="datepickerledger form-control" name="ledgerFrom">
                                       
                                        </div>-->
                                        <!--<div class="col-md-4 mb-3 pickledger2" id="ledgerToDate">-->
<!--                                            <label class="control-label">Ledger To Date</label>
                                            
                                                <input type="text" id="ledgerTo" class="datepickerledger1 form-control" name="ledgerTo">
                                            
                                        </div>-->
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                        <br>
                                        <a class="btn btn-primary" onclick="Generate();">Generate</a>  
                                        <a class="btn btn-danger" onclick="reset()">Reset</a>
                                        </div>
                                    </form>
                                </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
 <script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
        <script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>
        <script type="text/javascript">
        tippy('#information', {
            content: '<p>  Select Finanace Report Generation and select the format:  PDF, HTML, EXCEL, and CSV, and Click Generate or Reset. </p>\n\
             ',
            allowHTML: true,
            hideOnClick: true,
            trigger: 'click',
            onShow: function(reference){
		setTimeout(function() {
			reference.hide();
                         reference.reference.blur(); // for a second touch opening, lose focus
		}, 30000);
                    }
        });
        </script>

        <script>
            $(document).ready(function ()
            {
                $('#report1').hide();
                $('#report').hide();
                  $('#userIDForAgingHide').hide();
                  $('#reportTypeAgingHide').hide();
                   $('#selectTypeAgingHide').hide();
                   $('#propertyNameAgingHide').hide();
                   $('#unitAgingHide').hide();
                   $('#agingFromDate').hide();
                   $('#agingToDate').hide();
                   $('#selectTypeAccReceivableHide').hide();
                   $('#propertyNameAccReceivableHide').hide();
                   $('#unitAccReceivableHide').hide();
                   $('#accReceivableFromDate').hide();
                   $('#accReceivableToDate').hide();
//                    $('#ledgerNoHide').hide();
//                    $('#ledgerUserIdHide').hide();
//                     $('#ledgerFromDate').hide();
//                        $('#ledgerToDate').hide();
    


            });
            function showReports()
            {
                var a = document.getElementById('name').value;
                if (a == "tenant")
                {
                    $('#rep').val("");
                    $('#report1').show();
                    $('#report').show();
                }
                else
                {
                 
                }
            }
            function selectdate(date)
            {
                NewCssCal(date, 'ddMMMyyyy', '', '', '', '', '');
            }
            function showDivison()
            {
                var a = document.getElementById('reportid').value;
         if (a == "AgingReport")
                {
              $('#ledgerNoHide').hide();
                    $('#ledgerUserIdHide').hide();
                    $('#ledgerFromDate').hide();
                    $('#ledgerToDate').hide();
                    $('#userIDForAgingHide').show();
                    $('#reportTypeAgingHide').show();
                    $('#selectTypeAgingHide').show();
                    $('#propertyNameAgingHide').show();
                    $('#unitAgingHide').show();
                    $('#agingFromDate').show();
                     $('#agingToDate').show();
                    $('#selectTypeAccReceivableHide').hide();
                   $('#propertyNameAccReceivableHide').hide();
                   $('#unitAccReceivableHide').hide();
                   $('#accReceivableFromDate').hide();
                   $('#accReceivableToDate').hide();
                }
                 else if (a == "AccReceivableReport")
                { $('#userIDForAgingHide').hide();
                    $('#reportTypeAgingHide').hide();
                       $('#selectTypeAgingHide').hide();
                         $('#propertyNameAgingHide').hide();
                         $('#unitAgingHide').hide();
                          $('#agingFromDate').hide();
                      $('#agingToDate').hide();
                       $('#selectTypeAccReceivableHide').show();
                   $('#propertyNameAccReceivableHide').show();
                   $('#unitAccReceivableHide').show();
                   $('#accReceivableFromDate').show();
                   $('#accReceivableToDate').show();
                    $('#ledgerNoHide').hide();
                    $('#ledgerUserIdHide').hide();
                     $('#ledgerFromDate').hide();
                        $('#ledgerToDate').hide();
                        
                }
                else
                {
                    $('#report1').hide();
                }
            }
            
            
            function checkForm()
            {
                
                var isVisiblername = $('#name').is(':visible');
                var isVisiblerfor = $('#format').is(':visible');
                var isVisiblerep = $('#reportid').is(':visible');
                var isVisibleteanantc = $('#tanantc').is(':visible');
              
                var isVisibldt1 = $('#fromdate').is(':visible');
                var isVisibledt2 = $('#todate').is(':visible');
                var isVisibletntd = $('#tanantNameTD').is(':visible');
                var isVisibletns = $('#tenantNameService').is(':visible');
                var isVisibletcs = $('#tenantCodeService').is(':visible');
                var isVisibletnd = $('#tenantNameDues').is(':visible');
                var isVisibletcd = $('#tenantCodeDues').is(':visible');
                var report_name = $('#reportid').val();
                var isVisibleadtt = $('#amountDuesAssetName').is(':visible');
                var isVisiblerentpro = $('#rentproperty').is(':visible');
                var isVisiblerentten = $('#renttenant').is(':visible');
                var isVisiblerentflat = $('#rentflat').is(':visible');
                var isVisiblerentproname = $('#rentpropertyname').is(':visible');
       

                //   if (reportName == "amountDuesHistory") {

                //  if (fromMonth != 0 && fromDay != 1) {


                //     alert('Start Date should be from 1\u02e2\u1d57 January!!!');
                //    return false;
                //  }
                // }

                if ((document.getElementById("name")).selectedIndex == 0 && isVisiblername)
                {
                    alert('Please select a Report Type!!!');
                    return false;
                }
                else if ((document.getElementById("format")).selectedIndex == 0 && isVisiblerfor)
                {
                    alert('Please select a Format!!!');
                    return false;
                }
                else if ((document.getElementById("reportid")).selectedIndex == 0 && isVisiblerep)
                {
                    alert('Please select a Report Name!!!');
                    return false;
                }

                else if ((document.getElementById("amountDuesAssetName")).selectedIndex == 0 && isVisibleadtt)
                {
                    alert('Please select a Property Name!!!');
                    return false;
                }
                else if ((document.getElementById("rentpropertyname")).selectedIndex == 0 && isVisiblerentproname)
                {
                    alert('Please select a Property Name!!!');
                    return false;
                }
                else if ((document.getElementById("rentproperty")).selectedIndex == 0 && isVisiblerentpro)
                {
                    alert('Please select a Property Name!!!');
                    return false;
                }
                else if ((document.getElementById("renttenant")).selectedIndex == 0 && isVisiblerentten)
                {
                    alert('Please select a tenant Name!!!');
                    return false;
                }
                else if ((document.getElementById("rentflat")).selectedIndex == 0 && isVisiblerentflat)
                {
                    alert('Please select a flat Name!!!');
                    return false;
                }

                else if (((document.getElementById("fromdate")).value == "" || (document.getElementById("fromdate")).value == "Select Date") && isVisibldt1)
                {
                    alert('Please select From_Date!!!');
                    return false;
                }
                else if (((document.getElementById("todate")).value == "" || (document.getElementById("todate")).value == "Select Date") && isVisibledt2)
                {
                    alert('Please select to_Date!!!');
                    return false;
                }

                else {

                    Generate();
                }
            }
            function Generate()
            {
               
                var name = $('#name').val();
                var report = $('#reportid').val();
                var format = $('#format').val();     
                var agingUserId = $("#userIDForAging").val();
                var agingReportType = $('#reportTypeAging').val();
                var agingSelectType =  $('#selectTypeAging').val();
                var agingPropertyName = $('#propertyNameAging').val();
                var agingUnit = $('#unitAging').val();
                var agingTo = $("#agingTo").val();
                var agingFrom = $("#agingFrom").val();
                var accReceivableSelectType =  $('#selectTypeAccReceivable').val();
                var accReceivablePropertyName = $('#propertyNameAccReceivable').val();
                var accReceivableUnit = $('#unitAccReceivable').val();
                var accReceivableTo = $("#accReceivableTo").val();
                var accReceivableFrom = $("#accReceivableFrom").val();
                
//                var ledgerNo = $("#ledgerNo").val();
//                var ledgerUser = $("#ledgerUser").val();
//                 var ledgerTo = $("#ledgerTo").val();
//                var ledgerFrom = $("#ledgerFrom").val();
               debugger

                if (name != "null" && name != "" && format != "null" && format != "" && format != "select format")
                {
if (format == "PDF") {
                            var url = '../jasperReport/yycReportData.htm?format=' + format + '&reportid=' + report  + '&agingUserIdFromUser=' + agingUserId + '&agingReportType=' + agingReportType + '&agingSelectType=' + agingSelectType + '&agingPropertyName=' + agingPropertyName + '&agingUnit=' + agingUnit + '&agingTo=' + agingTo + '&agingFrom=' + agingFrom + '&accReceivableSelectType=' + accReceivableSelectType + '&accReceivablePropertyName=' + accReceivablePropertyName + '&accReceivableUnit=' + accReceivableUnit + '&accReceivableFrom=' + accReceivableFrom + '&accReceivableTo=' + accReceivableTo + '&name=' + name +''; 
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "EXCEL") {
    var url = '../jasperReport/yycReportData.htm?format=' + format + '&reportid=' + report  + '&agingUserIdFromUser=' + agingUserId + '&agingReportType=' + agingReportType + '&agingSelectType=' + agingSelectType + '&agingPropertyName=' + agingPropertyName + '&agingUnit=' + agingUnit + '&agingTo=' + agingTo + '&agingFrom=' + agingFrom + '&accReceivableSelectType=' + accReceivableSelectType + '&accReceivablePropertyName=' + accReceivablePropertyName + '&accReceivableUnit=' + accReceivableUnit + '&accReceivableFrom=' + accReceivableFrom + '&accReceivableTo=' + accReceivableTo + '&name=' + name +''; 
 window.open(url, '_blank');
                            window.focus();
                        }
                       
                        reset();
              
                } else {
                    swal("Please select report format.")
                }
            }


            function reset()
            {
              location.reload(true);
            }
            
            
            
            
             $(".datepickerledger")
        .datepicker({
            format: "yyyy-mm-dd",
            //startDate: "0m +0m",
            autoclose: true,
            orientation: 'bottom',
            todayHighlight: true,
        })
        .datepicker("update", new Date());

 $(".datepickerledger1")
        .datepicker({
            format: "yyyy-mm-dd",
            startDate: "0m +0m",
            orientation: 'bottom',
            autoclose: true,
            todayHighlight: true,
        })
        .datepicker("update", new Date());
        </script>
        <script>
            NProgress.done();
        </script>
    </body>
</html>
