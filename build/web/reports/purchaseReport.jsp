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
            $(document).ready(function () {
                $("#propertyname").change(function () {
                    var selectedasset = $("#propertyname").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }
                    var request_url = '../reports/getFlatName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Flat Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#flatname").empty();
                            $("#flatname").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            $(document).ready(function () {
                $("#propertynamereq").change(function () {
                    var selectedasset = $("#propertynamereq").val();
                    //if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    //  }          
                    var request_url = '../reports/getReqFlatName.htm?assetName=' + selectedasset + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {                      
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select Flat Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#flatnamereq").empty();
                            $("#flatnamereq").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });
//              $(document).ready(function () {
//                $("#propertynamereq").change(function () {
//                    var selectedasset = $("#propertynamereq").val();
//                    //if (selectedasset == 'ALL' || selectedasset == '') {
//                    //     return false;
//                    //  }
//                    alert("hi");
//                    var request_url = '../reports/getReqFlatName.htm?assetName=' + selectedasset + '';
//                    $.ajax({
//                        url: request_url,
//                        success: function (data) {
//                            alert("hello");
//                            var result = JSON.parse(data);
//                            var items = "<option value=''>" + "Select Item Name" + "</option>" + "<option value='ALL'>" + "ALL" + "</option>";
//                            for (var i = 0; i < result.length; i++) {
//                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
//                            }
//                            $("#itemn").empty();
//                            $("#itemn").append(items);
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
                                                    <h5>Purchase Reports</h5>
                                                </div>

                                    <form id="quotform" class="row" method="post"> 
                                        <!--Note:- class="form-inline" replaced with class="row" for alignment-->
                                        
                                        <!--<div class="control-group spaceContainer" style="alignment-adjust: central">-->
                                        <div class="col-md-4 mb-3">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Report&nbsp&nbspType</label>
                                            <!--<div class="controls">-->
                                                <select id="name" class="form-select" required onchange="showReports();" class="hello">
                                                    <option>Select Report Type</option>                                                                                 
                                                    <option id="name" value="purchase">Purchase&nbsp&nbspReport&nbsp&nbsp</option>  
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
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Purchase&nbsp&nbspReport&nbspName</label>
                                            <!--<div class="controls" id="report">-->
                                                <select id="reportid" class="form-select" required onchange="showDivison();" class="hello">
                                                    <option value="">Select Report Name</option> 
                                                    <option value="Approvalstatusdetails"> Approval Status Wise Purchase Report</option> 
                                                    <option value="itemwisedata"> Purchased Item Report</option>
                                                    <option value="datewisepurchaseddata">Purchase Order Report</option>
                                                    <option value="PurchaseRequest">Purchase Requisition Report</option> 
                                                    <option value="supplierDetails"> Supplier wise Purchase Report</option>  

                                                </select>
                                            <!--</div>-->
                                        </div>

                                        <div class="col-md-4 mb-3" id="inventorydiv1">
                                            <label class="control-label" style="padding-right: 40px;">Supplier&nbsp&nbspName</label>
                                            <!--<div class="controls" id="inventorydiv2">-->
                                                <select id="supn" class="form-select" class="hello">
                                                    <option value="">Select Supplier Name</option>
                                                    <option value="All">All</option>
                                                    <c:forEach items="${suplierList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="itemdiv1">
                                            <label class="control-label" style="padding-right: 40px;">Item&nbsp&nbspName</label>
                                            <!--<div class="controls" id="itemdiv2">-->
                                                <select id="itemn" class="form-select" class="hello">
                                                    <option value="">Select Item Name</option>
                                                    <option value="All">All</option>
                                                    <c:forEach items="${itemList}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="apstatusdiv1">
                                            <label class="control-label" style="padding-right: 40px;">Approval&nbsp&nbspStatus</label>
                                            <!--<div class="controls" id="apstatusdiv2">-->
                                                <select id="apstatus" class="form-select" class="hello">
                                                    <option value="">Select Approval Status</option>
                                                    <option value="All">All</option>
                                                    <c:forEach items="${apStatus}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                         <div class="col-md-4 mb-3" id="propertynamereq1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Property</label>
                                            <!--<div class="controls" id="propertynamereq2" >-->
                                                <select id="propertynamereq" class="form-select" class="hello"> 
                                                    <option value="">Select property name</option>
                                                    <option>ALL</option>
                                                    <c:forEach items="${assetname2}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="flatnamereq1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Flat</label>
                                            <!--<div class="controls" id="flatnamereq2" >-->
                                                <select id="flatnamereq" class="form-select" class="hello"> 
                                                    <option value="">Select Flat name</option>
                                                    <option>ALL</option>
                                                    <c:forEach items="${flatsNameList2}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="filter1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Filters</label>
                                            <!--<div class="controls" id="filter2">-->
                                                <select id="filter" class="form-select" required onchange="showDivison1();" class="hello">
                                                    <option>Select Filtration</option>                                                                     
                                                    <option value="itemcode">Item Name</option>  
                                                    <option value="itemcatagory">Item Category</option>  
                                                    <option value="pdate">Purchase Date</option>                                                                   
                                                    <option value="prapproval">Purchase Requisition Approval Date</option>
                                                    <option value="prstatus">Purchase Requisition Status</option> 
                                                    <option value="prdate">Required Date</option>  
                                                </select>
                                            <!--</div>-->
                                        </div>      
                                        <div class="col-md-4 mb-3" id="itemcodediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Item&nbsp&nbspName</label>
                                            <!--<div class="controls" id="itemcodediv2" >-->
                                                <select id="itemcodediv" class="form-select" class="hello"> 
                                                    <option>Select Item Name</option>
                                                    <option>All</option>
                                                    <c:forEach items="${itemCodeList}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="itemcat1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Item&nbsp&nbspCategory</label>
                                            <!--<div class="controls" id="itemcat2" >-->
                                                <select id="itemcat" class="form-select" class="hello"> 
                                                    <option>Select Item Category</option>
                                                    <option>All</option>
                                                    <c:forEach items="${itemcateList}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="prstatusdiv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Status</label>
                                            <!--<div class="controls" id="prstatusdiv2" >-->
                                                <select id="prstatusdiv" class="form-select" class="hello"> 
                                                    <option>Select Status</option>
                                                    <option>All</option>
                                                    <c:forEach items="${prStatusList}" var="type">
                                                        <option>${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="propertyname1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Property</label>
                                            <!--<div class="controls" id="propertyname2" >-->
                                                <select id="propertyname" class="form-select" class="hello"> 
                                                    <option value="">Select property name</option>
                                                    <option>ALL</option>
                                                    <c:forEach items="${assetname1}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                        <div class="col-md-4 mb-3" id="flatname1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>Flat</label>
                                            <!--<div class="controls" id="flatname2" >-->
                                                <select id="flatname" class="form-select" class="hello"> 
                                                    <option value="">Select Flat name</option>
                                                    <option>ALL</option>
                                                    <c:forEach items="${flatsNameList1}" var="type">
                                                        <option value="${type}">${type}</option>
                                                    </c:forEach>
                                                </select>
                                            <!--</div>-->
                                        </div>
                                       

                                        <div class="col-md-4 mb-3" id="fromdatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>From Date</label>
                                            <!--<div class="controls" id="fromdatediv2" >-->
                                                <input class="form-control datepicker" id="fromdate" type="text" placeholder="Select Date">
                                             <!--</div>-->
                                        </div>                                                       
                                        <div class="col-md-4 mb-3" id="todatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>To Date</label>
                                            <!--<div class="controls" id="todatediv2">-->
                                                <input class="form-control datepicker1" id="todate" type="text" placeholder="Select Date">
                                            <!--</div>-->
                                        </div>
                                        <%--<div class="col-md-4 mb-3" id="fromdatediv2">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>From&nbspDate</label>
                                            <div class="controls" id="fromdatediv2" >
                                                <input class="hello" id="fromdate" readonly="true" type="text" placeholder="Select Date" onclick="selectdate(this.id);">
                                            </div>
                                        </div>                                                       
                                        <div class="col-md-4 mb-3" id="todatediv1">
                                            <label class="control-label" style="padding-right: 40px;"><span style="color: red">*</span>To&nbspDate</label>
                                            <div class="controls" id="todatediv2">
                                                <input class="hello" id="todate" readonly="true"  type="text" placeholder="Select Date"  onclick="selectdate(this.id);">
                                            </div>
                                        </div>--%>

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
            content: '<p>  Select Purchase Report, Select the report format: PDF, HTML, EXCEL, and CSV, and Click Generate or Reset. </p>\n\
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
                $("#itemdiv1").hide();
                $("#itemdiv2").hide();
                $("#apstatusdiv1").hide();
                $("#apstatusdiv2").hide();
                $("#fromdatediv1").hide();
                $("#todatediv1").hide();
                $("#fromdatediv2").hide();
                $("#todatediv2").hide(); //fromdatediv1
                $("#filter1").hide();
                $("#filter2").hide();
                $("#itemcodediv1").hide();
                $("#itemcodediv2").hide();
                $("#itemcat1").hide();
                $("#itemcat2").hide();
                $("#prstatusdiv1").hide();
                $("#prstatusdiv2").hide();
                $("#propertyname1").hide();
                $("#propertyname2").hide();
                $("#flatname1").hide();
                $("#flatname2").hide();
                $("#propertynamereq1").hide();
                $("#propertynamereq2").hide();
                $("#flatnamereq1").hide();
                $("#flatnamereq2").hide();
            });
            function showReports()
            {
                var a = document.getElementById('name').value;
                if (a == "purchase")
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
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#fromdatediv1").hide();
                    $("#todatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv2").hide();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").hide();
                    $("#propertyname2").hide();
                    $("#flatname1").hide();
                    $("#flatname2").hide();
                    $("#propertynamereq1").hide();
                    $("#propertynamereq2").hide();
                    $("#flatnamereq1").hide();
                    $("#flatnamereq2").hide();
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
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#fromdatediv1").hide();
                    $("#todatediv1").hide();
                    $("#fromdatediv2").hide();
                    $("#todatediv2").hide();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").hide();
                    $("#propertyname2").hide();
                    $("#flatname1").hide();
                    $("#flatname2").hide();
                    $("#propertynamereq1").hide();
                    $("#propertynamereq2").hide();
                    $("#flatnamereq1").hide();
                    $("#flatnamereq2").hide();
                }

                else if (a == "supplierDetails")
                {
                    $("#inventorydiv1").show();
                    $("#inventorydiv2").show();
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").show();
                    $("#propertyname2").show();
                    $("#flatname1").show();
                    $("#flatname2").show();
                    $("#propertynamereq1").hide();
                    $("#propertynamereq2").hide();
                    $("#flatnamereq1").hide();
                    $("#flatnamereq2").hide();
                }
                else if (a == "itemwisedata")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#itemdiv1").show();
                    $("#itemdiv2").show();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").show();
                    $("#propertyname2").show();
                    $("#flatname1").show();
                    $("#flatname2").show();
                }
                else if (a == "Approvalstatusdetails")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").show();
                    $("#apstatusdiv2").show();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").show();
                    $("#propertyname2").show();
                    $("#flatname1").show();
                    $("#flatname2").show();
                    $("#propertynamereq1").hide();
                    $("#propertynamereq2").hide();
                    $("#flatnamereq1").hide();
                    $("#flatnamereq2").hide();
                }
                else if (a == "datewisepurchaseddata")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#filter1").hide();
                    $("#filter2").hide();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").show();
                    $("#propertyname2").show();
                    $("#flatname1").show();
                    $("#flatname2").show()
                }
                else if (a == "PurchaseRequest")
                {
                    $("#inventorydiv1").hide();
                    $("#inventorydiv2").hide();
                    $("#itemdiv1").hide();
                    $("#itemdiv2").hide();
                    $("#apstatusdiv1").hide();
                    $("#apstatusdiv2").hide();
                    $("#propertynamereq1").show();
                    $("#propertynamereq2").show();
                    $("#flatnamereq1").show();
                    $("#flatnamereq2").show();
                    $("#fromdatediv1").show();
                    $("#todatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv2").show();
                    $("#filter1").show();
                    $("#filter2").show();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                    $("#propertyname1").hide();
                    $("#propertyname2").hide();
                    $("#flatname1").hide();
                    $("#flatname2").hide();

                }

                else
                {
                    $('#report1').hide();
                }
            }
            function showDivison1()
            {
                var b = document.getElementById('filter').value;
                if (b == "itemcode")
                {

                    $("#itemcodediv1").show();
                    $("#itemcodediv2").show();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                }
                else if (b == "itemcatagory")
                {

                    $("#itemcat1").show();
                    $("#itemcat2").show();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                }
                else if (b == "prstatus")
                {

                    $("#prstatusdiv1").show();
                    $("#prstatusdiv2").show();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                }
                else if (b == "pdate" || b == "prapproval" || b == "prdate")
                {

                    $("#fromdatediv1").show();
                    $("#fromdatediv2").show();
                    $("#todatediv1").show();
                    $("#todatediv2").show();
                    $("#itemcodediv1").hide();
                    $("#itemcodediv2").hide();
                    $("#itemcat1").hide();
                    $("#itemcat2").hide();
                    $("#prstatusdiv1").hide();
                    $("#prstatusdiv2").hide();
                }

            }
            function checkForm()
            {
                var isVisiblername = $('#name').is(':visible');
                var isVisiblerfor = $('#format').is(':visible');
                var isVisiblerep = $('#reportid').is(':visible');
                var isVisibleitemName = $('#itemn').is(':visible');
                var isVisiblesupnName = $('#supn').is(':visible');
                var isVisibleapstatusName = $('#apstatus').is(':visible');
                var isVisiblefromdateName = $('#fromdate').is(':visible');
                var isVisibletodateName = $('#todate').is(':visible');
                var isVisiblefilter = $('#filter').is(':visible');
                var isVisibleitemcodediv = $('#itemcodediv').is(':visible');
                var isVisibleitemcat = $('#itemcat').is(':visible');
                var isVisibleprstatusdiv = $('#prstatusdiv').is(':visible');
                var isVisiblepropertyname = $('#propertyname').is(':visible');
                var isVisibleflatname = $('#flatname').is(':visible');
                var isVisiblepropertynamereq = $('#propertynamereq').is(':visible');
                var isVisibleflatnamereq = $('#flatnamereq').is(':visible');
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
                else if ((document.getElementById("supn")).selectedIndex == 0 && isVisiblesupnName)
                {
                    alert('Please select a Supllier Name!!!');
                    return false;
                }
                else if ((document.getElementById("apstatus")).selectedIndex == 0 && isVisibleapstatusName)
                {
                    alert('Please select a Approval Status!!!');
                    return false;
                }
                else if ((document.getElementById("fromdate")).selectedIndex == 0 && isVisiblefromdateName)
                {
                    alert('Please select a From Date !!!');
                    return false;
                }
                else if ((document.getElementById("todate")).selectedIndex == 0 && isVisibletodateName)
                {
                    alert('Please select a To Date!!!');
                    return false;
                }
                else if ((document.getElementById("filter")).selectedIndex == 0 && isVisiblefilter)
                {
                    alert('Please select a Filter!!!');
                    return false;
                }
                else if ((document.getElementById("itemcodediv")).selectedIndex == 0 && isVisibleitemcodediv)
                {
                    alert('Please select a Item Code!!!');
                    return false;
                }
                else if ((document.getElementById("itemcat")).selectedIndex == 0 && isVisibleitemcat)
                {
                    alert('Please select a Item Category!!!');
                    return false;
                }
                else if ((document.getElementById("prstatusdiv")).selectedIndex == 0 && isVisibleprstatusdiv)
                {
                    alert('Please select Status!!!');
                    return false;
                }
                else if ((document.getElementById("propertyname")).selectedIndex == 0 && isVisiblepropertyname)
                {
                    alert('Please select propertyname!!!');
                    return false;
                }
                else if ((document.getElementById("flatname")).selectedIndex == 0 && isVisibleflatname)
                {
                    alert('Please select flatname!!!');
                    return false;
                }
                else if ((document.getElementById("propertynamereq")).selectedIndex == 0 && isVisiblepropertynamereq)
                {
                    alert('Please select propertyname!!!');
                    return false;
                }
                else if ((document.getElementById("flatnamereq")).selectedIndex == 0 && isVisibleflatnamereq)
                {
                    alert('Please select flatname!!!');
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
                var supName = $('#supn').val();
                var apstatusN = $('#apstatus').val();
                var fromdateR = $('#fromdate').val();
                var todateR = $('#todate').val();
                var filterR = $('#filter').val();
                var itemcodedivR = $('#itemcodediv').val();
                var itemcatR = $('#itemcat').val();
                var prstatusdivR = $('#prstatusdiv').val();
                var propertynameP = $('#propertyname').val();
                var flatnameF = $('#flatname').val();
                var propertynamereqP = $('#propertynamereq').val();
                var flatnamereqF = $('#flatnamereq').val();
                if (name != "null" && name != "" && format != "null" && format != "" && format != "select format")
                {
                    if (Date.parse(todate) >= Date.parse(fromdate))
                    {

                        if (format == "HTML")
                        {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&supn=' + supName + '&apstatus=' + apstatusN + '&fromdate=' + fromdateR + '&todate=' + todateR + '&filter=' + filterR + '&itemcodediv=' + itemcodedivR + '&itemcat=' + itemcatR + '&prstatusdiv=' + prstatusdivR + '&propertyname=' + propertynameP + '&flatname=' + flatnameF + '&propertynamereq=' + propertynamereqP + '&flatnamereq=' + flatnamereqF + '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "PDF") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&supn=' + supName + '&apstatus=' + apstatusN + '&fromdate=' + fromdateR + '&todate=' + todateR + '&filter=' + filterR + '&itemcodediv=' + itemcodedivR + '&itemcat=' + itemcatR + '&prstatusdiv=' + prstatusdivR + '&propertyname=' + propertynameP + '&flatname=' + flatnameF + '&propertynamereq=' + propertynamereqP + '&flatnamereq=' + flatnamereqF + '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "EXCEL") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&supn=' + supName + '&apstatus=' + apstatusN + '&fromdate=' + fromdateR + '&todate=' + todateR + '&filter=' + filterR + '&itemcodediv=' + itemcodedivR + '&itemcat=' + itemcatR + '&prstatusdiv=' + prstatusdivR + '&propertyname=' + propertynameP + '&flatname=' + flatnameF + '&propertynamereq=' + propertynamereqP + '&flatnamereq=' + flatnamereqF + '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        else if (format == "CSV") {
                            var url = '../reports/areteReportData.htm?format=' + format + '&reportid=' + report + '&itemn=' + itemName + '&supn=' + supName + '&apstatus=' + apstatusN + '&fromdate=' + fromdateR + '&todate=' + todateR + '&filter=' + filterR + '&itemcodediv=' + itemcodedivR + '&itemcat=' + itemcatR + '&prstatusdiv=' + prstatusdivR + '&propertyname=' + propertynameP + '&flatname=' + flatnameF + '&propertynamereq=' + propertynamereqP + '&flatnamereq=' + flatnamereqF + '';
                            window.open(url, '_blank');
                            window.focus();
                        }
                        reset();
                    }

                }
            }
            function reset()
            {
                $('#report1').hide();
                $('#report').hide();
                $("#inventorydiv1").hide();
                $("#inventorydiv2").hide();
                $("#itemdiv1").hide();
                $("#itemdiv2").hide();
                $("#apstatusdiv1").hide();
                $("#apstatusdiv2").hide();
                $("#fromdatediv1").hide();
                $("#todatediv1").hide();
                $("#fromdatediv2").hide();
                $("#todatediv2").hide();
                $("#itemcodediv1").hide();
                $("#itemcodediv2").hide();
                $("#itemcat1").hide();
                $("#itemcat2").hide();
                $("#prstatusdiv1").hide();
                $("#prstatusdiv2").hide();
                $("#propertyname1").hide();
                $("#propertyname2").hide();
                $("#flatname1").hide();
                $("#flatname2").hide();
                $("#propertynamereq1").hide();
                $("#propertynamereq2").hide();
                $("#flatnamereq1").hide();
                $("#flatnamereq2").hide();
                $("#filter1").hide();
                $("#filter2").hide();
                $("#name").val("Select Report Type");
                $("#format").val("Select Format");
                $("select#reportid")[0].selectedIndex = 0;
                $("select#itemn")[0].selectedIndex = 0;
                $("select#supn")[0].selectedIndex = 0;
                $("select#apstatus")[0].selectedIndex = 0;
                $("select#fromdate")[0].selectedIndex = 0;
                $("select#todate")[0].selectedIndex = 0;
                $("select#filter")[0].selectedIndex = 0;
                $("select#itemcodediv")[0].selectedIndex = 0;
                $("select#itemcat")[0].selectedIndex = 0;
                $("select#prstatusdiv")[0].selectedIndex = 0;
                $("select#propertyname")[0].selectedIndex = 0;
                $("select#flatname")[0].selectedIndex = 0;
                $("select#propertynamereq")[0].selectedIndex = 0;
                $("select#flatnamereq")[0].selectedIndex = 0;
                
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