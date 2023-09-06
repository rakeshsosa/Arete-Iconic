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


            $(document).ready(function () {
                $("#depreciationAssetType").change(function () {
                    var selectedtype = $("#depreciationAssetType").val();
                    if (selectedtype == null || selectedtype == '') {
                        $("#depreciationAssetNameDiv1").hide();
                        $("#depreciationAssetNameDiv2").hide();
                        $("#depreciationFlatNameDiv1").hide();
                        $("#depreciationFlatNameDiv2").hide();
                        $("#depreciationAccessoryNameDiv1").hide();
                        $("#depreciationAccessoryNameDiv2").hide();
                        $("#fromdatediv1").hide();
                        $("#todatediv1").hide();
                        $("#fromdatediv2").hide();
                        $("#todatediv2").hide();
                    }
                    if (selectedtype == 'Property') {
                        $("#depreciationAssetNameDiv1").show();
                        $("#depreciationAssetNameDiv2").show();
                        $("#depreciationFlatNameDiv1").hide();
                        $("#depreciationFlatNameDiv2").hide();
                        $("#depreciationAccessoryNameDiv1").hide();
                        $("#depreciationAccessoryNameDiv2").hide();
                        $("#fromdatediv1").show();
                        $("#todatediv1").show();
                        $("#fromdatediv2").show();
                        $("#todatediv2").show();
                    }
                    if (selectedtype == 'Accessories') {
                        $("#depreciationAssetNameDiv1").show();
                        $("#depreciationAssetNameDiv2").show();
                        $("#depreciationFlatNameDiv1").show();
                        $("#depreciationFlatNameDiv2").show();
                        $("#depreciationAccessoryNameDiv1").show();
                        $("#depreciationAccessoryNameDiv2").show();
                        $("#fromdatediv1").show();
                        $("#todatediv1").show();
                        $("#fromdatediv2").show();
                        $("#todatediv2").show();
                    }

                });
            });

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
                                                    <h5>Correspondence Reports</h5>
                                                </div>

                                    <form id="quotform" class="row" method="post">
                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspType</label>
                                           
                                                <select id="name"  class="form-select" required onchange="showReports();" class="hello">
                                                    <option>Select Report Type</option>                                                                                 
                                                    <option id="name" value="Correspondence">Correspondence&nbsp&nbspReport&nbsp&nbspGeneration</option>  
                                                </select>
                                           
                                        </div>
                                  
                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspFormat</label>
                                           
                                                <select id="format" class="form-select" required class="hello">
                                                    <option>Select Format</option> 
                                                    <option value="PDF">PDF</option>                                                
                                                    <option value="HTML">HTML</option> 
                                                    <option value="EXCEL">EXCEL</option> 
                                                    <option value="CSV">CSV</option> 
                                                </select>

                                        </div>

                                        <div class="col-md-4 mb-3" id="report1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Correspondence&nbsp&nbspReport&nbsp&nbspName</label>
                                            <!--<div class="controls" id="report">-->
                                                <select id="reportid" class="form-select" required onchange="showDivison();" class="hello">
                                                    <option value="">Select Report Name</option>    
                                                    <option value="followUpDetails">Follow_Up Details Report</option>  
                                                    <option value="campaignDetails">Campaign Details Report</option> 
                                                    <option value="leadDetails">Lead Details Report</option>  
                                                    <!--<option value="vacateDetails">Vacate Details Report</option>-->
                                                    <option value="vacatedFlatDetails">Vacated Flat Details Report</option>
                                                    <option value="depreciationDetails">Fixed Asset & Depreciation Details</option>
                                                    <option value="penaltyReport">Penalty Details Report</option>
                                                    <option value="utilityReport">Utility Details Report</option>
                                                    <option value="rentPostingReport">Rent Posting Report</option>
                                                    <option value="complaintReport">Complaint Report</option> 
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="leadtdiv1">
                                            <label class="control-label" style="padding-right: 40px;">Lead&nbsp&nbspType</label>
                                            <!--<div class="controls"  id="leadtdiv2">-->
                                                <select id="leadt" class="form-select" class="hello">
                                                    <option value="">Select Lead Type</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${leadlist}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="leadNamediv1">
                                            <label class="control-label" style="padding-right: 40px;">Lead&nbsp&nbspName</label>
                                            <!--<div class="controls" id="leadNamediv2">-->
                                                <select id="leadName"  class="form-select" class="hello">
                                                    <option value="">Select Lead Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${leadNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="campaignNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Campaign&nbsp&nbspName</label>
                                            <!--<div class="controls" id="campaignNameDiv2">-->
                                                <select id="campaignName" class="form-select" class="hello">
                                                    <option value="">Select Campaign Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${campaignNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>



                                        <div class="col-md-4 mb-3"  id="leadTypeFollowUpdiv1">
                                            <label class="control-label" style="padding-right: 40px;">Lead&nbsp&nbspType</label>
                                            <!--<div class="controls" id="leadTypeFollowUpdivdiv2">-->
                                                <select id="leadTypeFollowUp" class="form-select" class="hello">
                                                    <option value="">Select Lead Type</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${leadlist}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3"  id="leadNameFollowUpdiv1">
                                            <label class="control-label" style="padding-right: 40px;">Lead&nbsp&nbspName</label>
                                            <!--<div class="controls" id="leadNameFollowUpdiv2">-->
                                                <select id="leadNameFollowUp" class="form-select" class="hello">
                                                    <option value="">Select Lead Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${leadNameListFollowUP}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>


                                        <div class="col-md-4 mb-3"  id="assetNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Property&nbsp&nbspName</label>
                                            <!--<div class="controls" id="assetNameDiv2">-->
                                                <select id="assetNameTD" class="form-select" class="hello">
                                                    <option value="">Select Property Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${assetNameForTD}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="tanantNameVacatDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Tenant&nbsp&nbspName</label>
                                            <!--<div class="controls" id="tanantNameVacatDiv2">-->
                                                <select id="tanantNameVacat" class="form-select" class="hello">
                                                    <option value="">Select Tenant Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${vacatingTenantNames}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="depreciationAssetTypeDiv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Property&nbsp&nbspType</label>
                                            <!--<div class="controls" id="depreciationAssetTypeDiv2">-->
                                                <select id="depreciationAssetType" class="form-select" class="hello">
                                                    <option value="">Select Property Type</option>
                                                    <c:forEach items="${assetTypeList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <!--<div class="col-md-4 mb-3" id="depreciationAssetNameDiv1">-->
                                          <div class="col-md-4 mb-3"  id="depreciationAssetNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Property&nbsp&nbspName</label>
                                            <!--<div class="controls" id="depreciationAssetNameDiv2">-->
                                                <select id="depreciationAssetName" class="form-select" class="hello">
                                                    <option value="">Select Property Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${propertyNamesList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="depreciationFlatNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Flat&nbsp&nbspName</label>
                                            <!--<div class="controls" id="depreciationFlatNameDiv1">-->
                                                <select id="depreciationFlatName" class="form-select" class="hello">
                                                    <option value="">Select Flat Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${flatsNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="depreciationAccessoryNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Accessory&nbsp&nbspName</label>
                                            <!--<div class="controls" id="depreciationAccessoryNameDiv2">-->
                                                <select id="depreciationAccessoryName" class="form-select" class="hello">
                                                    <option value="">Select Accessory Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${accessoriesNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="vacatedFlatAssetNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Property&nbsp&nbspName</label>
                                            <!--<div class="controls" id="vacatedFlatAssetNameDiv2">-->
                                                <select id="vacatedFlatAssetName" class="form-select" class="hello">
                                                    <option value="">Select Property Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${propertiesList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="penaltyAssetNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Property&nbsp&nbspName</label>
                                            <!--<div class="controls" id="penaltyAssetNameDiv2">-->
                                                <select id="penaltyAssetName" class="form-select" class="hello">
                                                    <option value="">Select Property Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${penaltyAssetNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="penaltyTenantCodeDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Tenant&nbsp&nbspCode</label>
                                            <!--<div class="controls" id="penaltyTenantCodeDiv2">-->
                                            
                                                <select id="penaltyTenantCode" class="form-select" class="hello">
                                                    <option value="">Select Tenant Code</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${penaltyTenantCodeList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>


                                        <div class="col-md-4 mb-3" id="utilityTenantCodeDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Tenant&nbsp&nbspCode</label>
                                            <!--<div class="controls" id="utilityTenantCodeDiv2">-->
                                                <select id="utilityTenantCode" class="form-select" class="hello">
                                                    <option value="">Select Tenant Code</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${utilityTenantCodeList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="rentPostingDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Rent&nbsp&nbspPosted&nbsp&nbspBy</label>
                                            <!--<div class="controls" id="rentPostingDiv2">-->
                                                <select id="rentPosting" class="form-select" class="hello">
                                                    <option value="">Select Rent Posted By</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${rentPostingList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="landlordNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">LandLord&nbsp&nbspName</label>
                                            <!--<div class="controls" id="landlordNameDiv2">-->
                                                <select id="landlordName" class="form-select" class="hello">
                                                    <option value="">Select LandLord Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${landlordNameList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        
                                        <div class="col-md-4 mb-3" id="complaintAssetNameDiv1">
                                            <label class="control-label" style="padding-right: 40px;">Property&nbsp&nbspName</label>
                                            <!--<div class="controls" id="complaintAssetNameDiv2">-->
                                                <select id="complaintAssetName" class="form-select" class="hello">
                                                    <option value="">Select Property Name</option>
                                                    <option value="ALL">ALL</option>
                                                    <c:forEach items="${propertiesList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="fromdatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>From Date</label>
                                            <!--<div class="controls" id="fromdatediv2" >-->
                                                <input type="text" placeholder="Select Date" class="form-control datepicker" id="fromdate">
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="todatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>To Date</label>
                                            <!--<div class="controls" id="todatediv2">-->
                                                <input type="text" placeholder="Select Date" class="form-control datepicker1"  id="todate">
                                            <!--</div>-->
                                        </div>
                                        <br>
                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                        <a class="btn btn-primary" onclick="checkForm();">Generate</a>  
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
            content: '<p>  Select Correspondence Report Generation and select the format:  PDF, HTML, EXCEL, and CSV and Click Generate or Reset. </p>\n\
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
                $("#leadtdiv1").hide();
                $("#leadtdiv2").hide();
                $("#fromdatediv1").hide();
                $("#todatediv1").hide();
                $("#fromdatediv2").hide();
                $("#todatediv2").hide();
                $("#leadNamediv1").hide();
                $("#leadNamediv2").hide();
                $("#assetNameDiv1").hide();
                $("#assetNameDiv2").hide();
                $("#campaignNameDiv1").hide();
                $("#campaignNameDiv2").hide();
                $("#leadNameFollowUpdiv1").hide();
                $("#leadNameFollowUpdiv2").hide();
                $("#leadTypeFollowUpdiv1").hide();
                $("#leadTypeFollowUpdiv2").hide();
                $("#tanantNameVacatDiv1").hide();
                $("#tanantNameVacatDiv2").hide();
                $("#depreciationAssetTypeDiv1").hide();
                $("#depreciationAssetTypeDiv2").hide();
                $("#depreciationAssetNameDiv1").hide();
                $("#depreciationAssetNameDiv2").hide();
                $("#depreciationFlatNameDiv1").hide();
                $("#depreciationFlatNameDiv2").hide();
                $("#depreciationAccessoryNameDiv1").hide();
                $("#depreciationAccessoryNameDiv2").hide();
                $("#vacatedFlatAssetNameDiv1").hide();
                $("#vacatedFlatAssetNameDiv2").hide();
                $("#penaltyAssetNameDiv1").hide();
                $("#utilityTenantCodeDiv1").hide();
                $("#rentPostingDiv1").hide();
                $("#penaltyTenantCodeDiv1").hide();
                $("#landlordNameDiv1").hide();
                $("#complaintAssetNameDiv1").hide();

            });
            function showReports()
            {
                var a = document.getElementById('name').value;
                if (a == "Correspondence")
                {
                    $('#rep').val("");
                    $('#report1').show();
                    $('#report').show();
                }
                else
                {
                    $('#report1').hide();
                    $("#fromdatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#todatediv1").hide();
                    $("#todatediv2").hide();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
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
                    $("#fromdatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#todatediv1").hide();
                    $("#todatediv2").hide();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();

                }

                else if (a == "campaignDetails")
                {
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#campaignNameDiv1").show();
                    $("#campaignNameDiv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();

                }
                else if (a == "followUpDetails")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#leadTypeFollowUpdiv1").show();
                    $("#leadTypeFollowUpdiv2").show();
                    $("#leadNameFollowUpdiv1").show();
                    $("#leadNameFollowUpdiv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "leadDetails")
                {


                    $("#leadtdiv1").show();
                    $("#leadtdiv2").show();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#leadNamediv1").show();
                    $("#leadNamediv2").show();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();


                }
                else if (a == "vacateDetails")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").hide();
                    $("#todatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv2").hide();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").show();
                    $("#assetNameDiv2").show();
                    $("#tanantNameVacatDiv1").show();
                    $("#tanantNameVacatDiv2").show();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "depreciationDetails")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").hide();
                    $("#todatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv2").hide();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").show();
                    $("#depreciationAssetTypeDiv2").show();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "vacatedFlatDetails")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").hide();
                    $("#todatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv2").hide();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").show();
                    $("#vacatedFlatAssetNameDiv2").show();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "penaltyReport")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").show();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").show();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }

                else if (a == "utilityReport")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").show();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "rentPostingReport")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").show();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").show();
                    $("#complaintAssetNameDiv1").hide();
                }
                else if (a == "complaintReport")
                {

                    $("#leadtdiv1").hide();
                    $("#leadtdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#leadNamediv1").hide();
                    $("#leadNamediv2").hide();
                    $("#campaignNameDiv1").hide();
                    $("#campaignNameDiv2").hide();
                    $("#leadNameFollowUpdiv1").hide();
                    $("#leadNameFollowUpdiv2").hide();
                    $("#assetNameDiv1").hide();
                    $("#assetNameDiv2").hide();
                    $("#tanantNameVacatDiv1").hide();
                    $("#tanantNameVacatDiv2").hide();
                    $("#leadTypeFollowUpdiv1").hide();
                    $("#leadTypeFollowUpdiv2").hide();
                    $("#depreciationAssetTypeDiv1").hide();
                    $("#depreciationAssetTypeDiv2").hide();
                    $("#depreciationAssetNameDiv1").hide();
                    $("#depreciationAssetNameDiv2").hide();
                    $("#depreciationFlatNameDiv1").hide();
                    $("#depreciationFlatNameDiv2").hide();
                    $("#depreciationAccessoryNameDiv1").hide();
                    $("#depreciationAccessoryNameDiv2").hide();
                    $("#vacatedFlatAssetNameDiv1").hide();
                    $("#vacatedFlatAssetNameDiv2").hide();
                    $("#penaltyAssetNameDiv1").hide();
                    $("#utilityTenantCodeDiv1").hide();
                    $("#rentPostingDiv1").hide();
                    $("#penaltyTenantCodeDiv1").hide();
                    $("#landlordNameDiv1").hide();
                    $("#complaintAssetNameDiv1").show();
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
                var isVisibleleadt = $('#leadt').is(':visible');
                var isVisibleLeadName = $('#leadName').is(':visible');
                var isVisibldt1 = $('#fromdate').is(':visible');
                var isVisibledt2 = $('#todate').is(':visible');
                var isVisibleantd = $('#assetNameTD').is(':visible');
                var isVisibleCampaignName = $('#campaignName').is(':visible');
                var isVisiblelnf = $('#leadNameFollowUp').is(':visible');
                var isVisibletnv = $('#tanantNameVacat').is(':visible');
                var isVisibledat = $('#depreciationAssetType').is(':visible');

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
                else if ((document.getElementById("depreciationAssetType")).selectedIndex == 0 && isVisibledat)
                {
                    alert('Please select a Property Type!!!');
                    return false;
                }
                /*
                 else if ((document.getElementById("tanantNameTD")).selectedIndex == 0 && isVisibletntd)
                 {
                 alert('Please select a Tenant Name!!!');
                 return false;
                 }
                 else if ((document.getElementById("tanantNameVacat")).selectedIndex == 0 && isVisibletnv)
                 {
                 alert('Please select a Tenant Name!!!');
                 return false;
                 }
                 else if ((document.getElementById("leadNameFollowUp")).selectedIndex == 0 && isVisiblelnf)
                 {
                 alert('Please select a Lead Name!!!');
                 return false;
                 }
                 else if ((document.getElementById("campaignName")).selectedIndex == 0 && isVisibleCampaignName)
                 {
                 alert('Please select a Campaign Name!!!');
                 return false;
                 }
                 else if ((document.getElementById("assetNameTD")).selectedIndex == 0 && isVisibleantd)
                 {
                 alert('Please select a Asset Name!!!');
                 return false;
                 }
                 
                 
                 else if ((document.getElementById("leadName")).selectedIndex == 0 && isVisibleLeadName)
                 {
                 alert('Please select Lead Name!!!');
                 return false;
                 }
                 
                 else if ((document.getElementById("leadt")).selectedIndex == 0 && isVisibleleadt)
                 {
                 alert('Please Select Lead Type!!!');
                 return false;
                 }
                 else if ((document.getElementById("assetn")).selectedIndex == 0 && isVisibleasset)
                 {
                 alert('Please select Asset Name!!!');
                 return false;
                 }
                 */
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
                var fromdate = $('#fromdate').val();
                var todate = $('#todate').val();
                var leadType = $('#leadt').val();
                var leadName = $('#leadName').val();
                var assetNameForTD = $('#assetNameTD').val();
                var campaignName = $('#campaignName').val();
                var leadNamefollowup = $('#leadNameFollowUp').val();
                var leadTypefollowup = $('#leadTypeFollowUp').val();
                var vacatingTenantName = $('#tanantNameVacat').val();
                var depreAssetType = $('#depreciationAssetType').val();
                var depreAssetName = $('#depreciationAssetName').val();
                var depreFlatName = $('#depreciationFlatName').val();
                var depreAccessoryName = $('#depreciationAccessoryName').val();
                var vacatedFlatAssetName = $('#vacatedFlatAssetName').val();
                var penaltyAssetName = $('#penaltyAssetName').val();
                var utilityTenantCode = $('#utilityTenantCode').val();
                var rentPosting = $('#rentPosting').val();
                var penaltyTenantCode = $('#penaltyTenantCode').val();
                var landlordName = $('#landlordName').val();
                var complaintAssetName = $('#complaintAssetName').val();

                if (name != "null" && name != "" && format != "null" && format != "" && format != "select format")
                {
                    if (Date.parse(todate) >= Date.parse(fromdate))
                    {
                        if (format == "HTML")
                        {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&fromdate=' + fromdate + '&todate=' + todate + '&leadt=' + leadType + '&leadName=' + leadName + '&assetNameTD=' + assetNameForTD + '&campaignName=' + campaignName + '&leadNameFollowUp=' + leadNamefollowup + '&leadTypeFollowUp=' + leadTypefollowup + '&vacatingTenantName=' + vacatingTenantName + '&depreAssetType=' + depreAssetType + '&depreAssetName=' + depreAssetName + '&depreFlatName=' + depreFlatName + '&depreAccessoryName=' + depreAccessoryName + '&vacatedFlatAssetName=' + vacatedFlatAssetName + '&penaltyAssetName=' + penaltyAssetName + '&utilityTenantCode=' + utilityTenantCode + '&rentPosting=' + rentPosting + '&penaltyTenantCode=' + penaltyTenantCode + '&landlordName=' + landlordName + '&complaintAssetName='+complaintAssetName+ '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "PDF") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&fromdate=' + fromdate + '&todate=' + todate + '&leadt=' + leadType + '&leadName=' + leadName + '&assetNameTD=' + assetNameForTD + '&campaignName=' + campaignName + '&leadNameFollowUp=' + leadNamefollowup + '&leadTypeFollowUp=' + leadTypefollowup + '&vacatingTenantName=' + vacatingTenantName + '&depreAssetType=' + depreAssetType + '&depreAssetName=' + depreAssetName + '&depreFlatName=' + depreFlatName + '&depreAccessoryName=' + depreAccessoryName + '&vacatedFlatAssetName=' + vacatedFlatAssetName + '&penaltyAssetName=' + penaltyAssetName + '&utilityTenantCode=' + utilityTenantCode + '&rentPosting=' + rentPosting + '&penaltyTenantCode=' + penaltyTenantCode + '&landlordName=' + landlordName + '&complaintAssetName='+complaintAssetName+ '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "EXCEL") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&fromdate=' + fromdate + '&todate=' + todate + '&leadt=' + leadType + '&leadName=' + leadName + '&assetNameTD=' + assetNameForTD + '&campaignName=' + campaignName + '&leadNameFollowUp=' + leadNamefollowup + '&leadTypeFollowUp=' + leadTypefollowup + '&vacatingTenantName=' + vacatingTenantName + '&depreAssetType=' + depreAssetType + '&depreAssetName=' + depreAssetName + '&depreFlatName=' + depreFlatName + '&depreAccessoryName=' + depreAccessoryName + '&vacatedFlatAssetName=' + vacatedFlatAssetName + '&penaltyAssetName=' + penaltyAssetName + '&utilityTenantCode=' + utilityTenantCode + '&rentPosting=' + rentPosting + '&penaltyTenantCode=' + penaltyTenantCode + '&landlordName=' + landlordName + '&complaintAssetName='+complaintAssetName+ '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "CSV") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&fromdate=' + fromdate + '&todate=' + todate + '&leadt=' + leadType + '&leadName=' + leadName + '&assetNameTD=' + assetNameForTD + '&campaignName=' + campaignName + '&leadNameFollowUp=' + leadNamefollowup + '&leadTypeFollowUp=' + leadTypefollowup + '&vacatingTenantName=' + vacatingTenantName + '&depreAssetType=' + depreAssetType + '&depreAssetName=' + depreAssetName + '&depreFlatName=' + depreFlatName + '&depreAccessoryName=' + depreAccessoryName + '&vacatedFlatAssetName=' + vacatedFlatAssetName + '&penaltyAssetName=' + penaltyAssetName + '&utilityTenantCode=' + utilityTenantCode + '&rentPosting=' + rentPosting + '&penaltyTenantCode=' + penaltyTenantCode + '&landlordName=' + landlordName + '&complaintAssetName='+complaintAssetName+ '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        reset();
                    }
                    else
                    {
                        alert("FromDate should be less than ToDate!!!");
                        $('#fromdate').val("Select Date");
                        $('#todate').val("Select Date");
                    }
                }
            }
            function reset()
            {
                $('#report1').hide();
                $('#report').hide();
                $("#leadtdiv1").hide();
                $("#leadtdiv2").hide();
                $("#leadNamediv1").hide();
                $("#leadNamediv1").hide();
                $("#fromdatediv1").hide();
                $("#todatediv1").hide();
                $("#fromdatediv2").hide();
                $("#todatediv2").hide();
                $("#assetNameDiv1").hide();
                $("#assettNameDiv2").hide();
                $("#campaignNameDiv1").hide();
                $("#campaignNameDiv2").hide();
                $("#leadNameFollowUpdiv1").hide();
                $("#leadNameFollowUpdiv2").hide();
                $("#tanantNameVacatDiv1").hide();
                $("#tanantNameVacatDiv2").hide();
                $("#leadTypeFollowUpdiv1").hide();
                $("#leadTypeFollowUpdiv2").hide();
                $("#depreciationAssetTypeDiv1").hide();
                $("#depreciationAssetTypeDiv2").hide();
                $("#depreciationAssetNameDiv1").hide();
                $("#depreciationAssetNameDiv2").hide();
                $("#depreciationFlatNameDiv1").hide();
                $("#depreciationFlatNameDiv2").hide();
                $("#depreciationAccessoryNameDiv1").hide();
                $("#depreciationAccessoryNameDiv2").hide();
                $("#vacatedFlatAssetNameDiv1").hide();
                $("#vacatedFlatAssetNameDiv2").hide();
                $("#penaltyAssetNameDiv1").hide();
                $("#utilityTenantCodeDiv1").hide();
                $("#rentPostingDiv1").hide();
                $("#penaltyTenantCodeDiv1").hide();
                $("#landlordNameDiv1").hide();
                $("#complaintAssetNameDiv1").hide();


                $("#name").val("Select Report Type");
                $("#format").val("Select Format");
                $("select#depreciationAssetType")[0].selectedIndex = 0;
                $("select#depreciationAssetName")[0].selectedIndex = 0;
                $("select#depreciationFlatName")[0].selectedIndex = 0;
                $("select#depreciationAccessoryName")[0].selectedIndex = 0;
                $("select#reportid")[0].selectedIndex = 0;
                $("select#leadt")[0].selectedIndex = 0;
                $("select#leadName")[0].selectedIndex = 0;
                $("select#campaignName")[0].selectedIndex = 0;
                $("select#assetNameTD")[0].selectedIndex = 0;
                $("select#leadNameFollowUp")[0].selectedIndex = 0;
                $("select#leadTypeFollowUp")[0].selectedIndex = 0;
                $("select#tanantNameVacat")[0].selectedIndex = 0;
                $("select#vacatedFlatAssetName")[0].selectedIndex = 0;
                $("select#penaltyAssetName")[0].selectedIndex = 0;
                $("select#utilityTenantCode")[0].selectedIndex = 0;
                $("select#rentPosting")[0].selectedIndex = 0;
                $("select#penaltyTenantCode")[0].selectedIndex = 0;
                $("select#complaintAssetName")[0].selectedIndex = 0;
                $("select#landlordName")[0].selectedIndex = 0;
                $('#fromdate').val("Select Date");
                $('#todate').val("Select Date");
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