<%-- 
    Document   : inventoryReport
    Created on : 13 Apr, 2018, 4:49:27 PM
    Author     : ebs05
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
            //for follow up lead name
            $(document).ready(function () {
                $("#leadTypeFollowUp").change(function () {
                    var selectedlead = $("#leadTypeFollowUp").val();
                    // if (selectedlead == 'ALL' || selectedlead == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getFollowUpLeadName.htm?leadType=' + selectedlead + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Lead Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#leadNameFollowUp").empty();
                            $("#leadNameFollowUp").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for lead details lead name
            $(document).ready(function () {
                $("#leadt").change(function () {
                    var selectedlead = $("#leadt").val();
                    // if (selectedlead == 'ALL' || selectedlead == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getLeadDetailsLeadName.htm?leadType=' + selectedlead + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Lead Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#leadName").empty();
                            $("#leadName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for lead details lead name
            $(document).ready(function () {
                $("#assetNameTD").change(function () {
                    var selectedasset = $("#assetNameTD").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getVacateTenantName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tanantNameVacat").empty();
                            $("#tanantNameVacat").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for penalty details tenant code

            $(document).ready(function () {

                $("#penaltyAssetName").change(function () {
                    var selectedasset = $("#penaltyAssetName").val();
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../reports/getPenaltyTenantCode.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Tenant Code" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#penaltyTenantCode").empty();
                            $("#penaltyTenantCode").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            //for Rent Posting LandLord Name

            $(document).ready(function () {

                $("#rentPosting").change(function () {
                    var selectedasset = $("#rentPosting").val();
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../reports/getLandLordName.htm?rentpostingType=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select LandLord Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#landlordName").empty();
                            $("#landlordName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


            $(document).ready(function () {
                $("#depreciationAssetName").change(function () {
                    var selectedasset = $("#depreciationAssetName").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getDepreciationFlatName.htm?assetName=' + selectedasset + '';
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


            $(document).ready(function () {
                $("#depreciationAssetName").change(function () {
                    var selectedasset = $("#depreciationAssetName").val();
                    var request_url = '../reports/getDepreciationAssetAccessoryName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Accessory Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#depreciationAccessoryName").empty();
                            $("#depreciationAccessoryName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
            $(document).ready(function () {
                $("#depreciationFlatName").change(function () {
                    var selectedasset = $("#depreciationAssetName").val();
                    var selectedflat = $("#depreciationFlatName").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getDepreciationAccessoryName.htm?assetName=' + selectedasset + '&flatName' + selectedflat + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Accessory Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#depreciationAccessoryName").empty();
                            $("#depreciationAccessoryName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


//            $(document).ready(function () {
//                $("#depreciationAssetType").change(function () {
//                    var selectedtype = $("#depreciationAssetType").val();
//                    if (selectedtype == null || selectedtype == '') {
//                        $("#depreciationAssetNameDiv1").hide();
//                        $("#depreciationAssetNameDiv2").hide();
//                        $("#depreciationFlatNameDiv1").hide();
//                        $("#depreciationFlatNameDiv2").hide();
//                        $("#depreciationAccessoryNameDiv1").hide();
//                        $("#depreciationAccessoryNameDiv2").hide();
//                        $("#fromdatediv1").hide();
//                        $("#todatediv1").hide();
//                        $("#fromdatediv2").hide();
//                        $("#todatediv2").hide();
//                    }
//                    if (selectedtype == 'Property') {
//                        $("#depreciationAssetNameDiv1").show();
//                        $("#depreciationAssetNameDiv2").show();
//                        $("#depreciationFlatNameDiv1").hide();
//                        $("#depreciationFlatNameDiv2").hide();
//                        $("#depreciationAccessoryNameDiv1").hide();
//                        $("#depreciationAccessoryNameDiv2").hide();
//                        $("#fromdatediv1").show();
//                        $("#todatediv1").show();
//                        $("#fromdatediv2").show();
//                        $("#todatediv2").show();
//                    }
//                    if (selectedtype == 'Accessories') {
//                        $("#depreciationAssetNameDiv1").show();
//                        $("#depreciationAssetNameDiv2").show();
//                        $("#depreciationFlatNameDiv1").show();
//                        $("#depreciationFlatNameDiv2").show();
//                        $("#depreciationAccessoryNameDiv1").show();
//                        $("#depreciationAccessoryNameDiv2").show();
//                        $("#fromdatediv1").show();
//                        $("#todatediv1").show();
//                        $("#fromdatediv2").show();
//                        $("#todatediv2").show();
//                    }
//
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
                                                    <h5>Inventory Reports</h5>
                                                </div>

                                    <form id="quotform" class="row" method="post">
                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspType</label>
                                            <!--<div class="controls">-->
                                                <select id="name" class="form-select" required onchange="showReports();" class="hello">
                                                    <option>Select Report Type</option>                                                                                 
                                                    <option id="name" value="inventory">Inventory&nbsp&nbspReport&nbsp&nbspGeneration</option>  
                                                </select>
                                            <!--</div>-->  
                                        </div>

                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspFormat</label>
                                            <!--<div class="controls">-->
                                                <select id="format" class="form-select" required class="hello">
                                                    <option>Select Format</option> 
                                                    <option value="PDF">PDF</option>                                                
                                                    <option value="HTML">HTML</option> 
                                                    <option value="EXCEL">EXCEL</option> 
                                                    <option value="CSV">CSV</option> 
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="report1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Inventory&nbsp&nbspReport&nbsp&nbspName</label>
                                            <!--<div class="controls" id="report">-->
                                                <select id="reportid" class="form-select" required onchange="showDivison();" class="hello">
                                                    <option value="">Select Report Name</option>    
                                                    <option value="grnDetails">GRN Report</option>                                                       
                                                    <option value="itemSummary">Item summary Report</option>                                                       
                                                    <option value="stockReport">Stock Report</option>                                                       
                                                    <option value="stockadjustment">Stock Adjustment Report</option>                                                       
                                                    <option value="materialReturn">Material Return Report</option>                                                       

                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="storediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Store&nbsp&nbspName</label>
                                            <!--<div class="controls" id="storediv2">-->
                                                <select id="storen" class="form-select" class="hello">
                                                    <option value="">Select Store Name</option>                                                     
                                                    <c:forEach items="${storeList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="inventorydiv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Item&nbsp&nbspName</label>
                                            <!--<div class="controls" id="inventorydiv2">-->
                                                <select id="itemn" class="form-select" class="hello">
                                                    <option value="">Select Item Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${itemList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="supplierdiv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Supplier&nbsp&nbspName</label>
                                            <!--<div class="controls" id="supplierdiv2">-->
                                                <select id="suppliern" class="form-select" class="hello">
                                                    <option value="">Select Supplier Name</option>                                                     
                                                    <c:forEach items="${supplierList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="fromdatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>From Date</label>
                                            <!--<div class="controls" id="fromdatediv2" >-->
                                                <input type="text" placeholder="Select Date"  class="form-control datepicker" id="fromdate">
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="todatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>To Date</label>
                                            <!--<div class="controls" id="todatediv2">-->
                                                <input type="text" placeholder="Select Date" class="form-control datepicker1" class="hello" id="todate" >
                                            <!--</div>-->
                                        </div>

                                        <br>
                                          <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                        <a class="btn btn-primary" onclick="checkForm();">Generate</a>  
                                        <a class="btn btn-danger"  onclick="reset()">Reset</a> 
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
            content: '<p>  Select Inventory Report, Select the report format: PDF, HTML, EXCEL, and CSV, and Click Generate or Reset. </p>\n\
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
                $("#inventorydiv1").hide();
                $("#inventorydiv2").hide();
                $("#storediv1").hide();
                $("#storediv2").hide();
                $("#fromdatediv1").hide();
                $("#fromdatediv2").hide();
                $("#todatediv1").hide();
                $("#todatediv2").hide();
                $("#supplierdiv1").hide();
                $("#supplierdiv2").hide();


            });
            function showReports()
            {
                var a = document.getElementById('name').value;
                if (a == "inventory")
                {
                    $('#rep').val("");
                    $('#report1').show();
                    $('#report').show();
                }
                else
                {
                    $('#report1').hide();

                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#storediv1").hide();
                    $("#storediv2").hide();
                    $("#fromdatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv1").hide();
                    $("#todatediv2").hide();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }
            }
            function selectdate(date)
            {
                NewCssCal(date, 'ddMMMyyyy', '', '', '', '', '');
            }
            function showDivison()
            {

                var a = document.getElementById('reportid').value;
                if (a == "")
                {

                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#storediv1").hide();
                    $("#storediv2").hide();
                    $("#fromdatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv1").hide();
                    $("#todatediv2").hide();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }

                else if (a == "grnDetails")
                {
                    $("#inventorydiv1").show();
                    $("#inventorydiv2").show();
                    $("#storediv1").hide();
                    $("#storediv2").hide();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }
                else if (a == "itemSummary")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#storediv1").show();
                    $("#storediv2").show();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }
                else if (a == "stockReport")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#storediv1").show();
                    $("#storediv2").show();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }
                else if (a == "stockadjustment")
                {
                    $("#inventorydiv1").show();
                    $("#inventorydiv2").show();
                    $("#storediv1").show();
                    $("#storediv2").show();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#supplierdiv1").hide();
                    $("#supplierdiv2").hide();

                }
                else if (a == "materialReturn")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#storediv1").hide();
                    $("#storediv2").hide();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#supplierdiv1").show();
                    $("#supplierdiv2").show();

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
                var isVisibleitemName = $('#itemn').is(':visible');
                var isVisiblestoreName = $('#storen').is(':visible');
                var isVisiblefromDate = $('#fromdate').is(':visible');
                var isVisibletoDate = $('#todate').is(':visible');
                var isVisiblesupplier = $('#suppliern').is(':visible');


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
                else if ((document.getElementById("itemn")).selectedIndex == 0 && isVisibleitemName)
                {
                    alert('Please select a Item Name!!!');
                    return false;
                }
                else if ((document.getElementById("storen")).selectedIndex == 0 && isVisiblestoreName)
                {
                    alert('Please select a Store Name!!!');
                    return false;
                }
                else if ((document.getElementById("fromdate")).selectedIndex == 0 && isVisiblefromDate)
                {
                    alert('Please select a From Date!!!');
                    return false;
                }
                else if ((document.getElementById("todate")).selectedIndex == 0 && isVisibletoDate)
                {
                    alert('Please select a To Date!!!');
                    return false;
                }
                else if ((document.getElementById("suppliern")).selectedIndex == 0 && isVisiblesupplier)
                {
                    alert('Please select a supplier Name!!!');
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

                var itemName = $('#itemn').val();
                var storeName = $('#storen').val();
                var fromDate = $('#fromdate').val();
                var toDate = $('#todate').val();
                var supplier = $('#suppliern').val();


                if (name != "null" && name != "" && format != "null" && format != "" && format != "select format")
                {

                    if (format == "HTML")
                    {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&storen=' + storeName + '&fromdate=' + fromDate + '&todate=' + toDate + '&supplier=' + supplier + '';
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "PDF") {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&storen=' + storeName + '&fromdate=' + fromDate + '&todate=' + toDate + '&supplier=' + supplier + '';
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "EXCEL") {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&storen=' + storeName + '&fromdate=' + fromDate + '&todate=' + toDate + '&supplier=' + supplier + '';
                        window.open(url, '_blank');
                        window.focus();
                    }
                    else if (format == "CSV") {
                        var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&storen=' + storeName + '&fromdate=' + fromDate + '&todate=' + toDate + '&supplier=' + supplier + '';
                        window.open(url, '_blank');
                        window.focus();
                    }
                    reset();

                }
            }
            function reset()
            {
                $('#report1').hide();
                $('#report').hide();
                $("#inventorydiv1").hide();
                $("#inventorydiv2").hide();
                $("#name").val("Select Report Type");
                $("#format").val("Select Format");
                $("select#reportid")[0].selectedIndex = 0;
                $("select#itemn")[0].selectedIndex = 0;
                $("select#storen")[0].selectedIndex = 0;
                $("select#fromdate")[0].selectedIndex = 0;
                $("select#todate")[0].selectedIndex = 0;
                $("select#suppliern")[0].selectedIndex = 0;

            }
        </script>
        <script>
            NProgress.done();
        </script>
        <script>
            $(".datepicker")
            .datepicker({
            format: "yyyy-mm-dd",
            //startDate: "0m +0m",
            autoclose: true,
            orientation: 'bottom',
            todayHighlight: true,
        })
        .datepicker("update", new Date());

        $(".datepicker1")
            .datepicker({
            format: "yyyy-mm-dd",
            //startDate: "0m +0m",
            autoclose: true,
            orientation: 'bottom',
            todayHighlight: true,
        })
        .datepicker("update", new Date());
        </script>
    </body>
</html>