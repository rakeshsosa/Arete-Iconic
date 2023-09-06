
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../common/datepicker/datetimepicker_css.js" type="text/javascript"></script>
    <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
</head>

<script>
   function isNumberKey(evt) {
    var charCode = evt.which ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        //                    alert("Please Enter Numeric value");
        return false;
    }
    return true;
}
function isNumberKey4(evt) {
    debugger;
    var charCode = evt.which ? evt.which : event.keyCode;
    if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
        //                    alert("Please Enter Only Alphabets");
        return false;
    }
    return true;
}
function fetchType() {
    var tenantType = document.getElementById("tenantType").value;
    $.ajax({
        type: "POST",
        url: "../master/fetchType.htm",
        data: {
            tenantType: tenantType,
        },
        success: function (data) {
            if ($.trim(data) == "Already Exists.Enter another") {
                alert("This Record Already Exist");
                document.getElementById("tenantType").value = "";
                return false;
            }
        },
    });
}

function test() {
    var desc = document.getElementById("typeDesc").value;
    var desc1 = document.getElementById("typeDesc1").value;

    if (desc !== desc1) {
        if (confirm("Do you really want to Save this updated record")) {
            document.forms["userform"].submit();
            return true;
        } else {
            return true;
        }
    } else {
        document.forms["userform"].submit();
    }
}

function selectdate(val) {
    NewCssCal(val, "dd-MM-yyyy", "dropdown", true, "12", "", "future");
}

function selectProperty() {
    myWindow = window.open("../dashboard/selectProperty.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

function valid() {
    var dueDate = document.getElementById("dueDate").value;
    if (dueDate == "") {
        alert("Enter the due date");
        return false;
    }
}

function selectAccAssetDetails() {
    myWindow = window.open("../assets/selectAccAssetDetails.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
}

</script>
<body class="nav-md">
    <% java.util.Date d = new java.util.Date();%>
    <jsp:include page="../login/menu.htm" />

    <jsp:include page="../login/footer.jsp" />

    <main id="main" class="main">
        <div class="mt-3">
            <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC Management&pagetype=form"/>
        </div>
        <div class="pagetitle">

        </div><!-- End Page Title -->
        <section class="section">
            <div class="row">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="card-body">
                            <div class="card-title">
                                <h5>AMC Maintenance Details</h5>
                            </div>
                            <form id="userform validateForm" class="row" action="../AMC/AMCMaintenanceFormSubmit.htm" method="post" enctype="multipart/form-data">

                                <c:if test="${action ne 'view' && action ne 'edit'}">

                                <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Select Property Code"
                class="form-control"
                required=""
                id="assetCode"
                readonly=""
                name="assetCode"
                maxlength="40"
                value=""
                onclick="return selectAccAssetDetails();"


            />
            <label class="control-label">Property Code <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Fill"
                class="form-control"
                id="assetName"
                readonly=""
                name="assetName"
                maxlength="40"
                value=""
                required
                onclick="return selectAccAssetDetails();"
                onkeypress="return isNumberKey3(event)"
                onfocus="return changeFloor();"
            />
            <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="amcId" name="amcId" maxlength="40" value="${amcCode}" required/>
            <label class="control-label">AMC Id</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <select id="amcType" name="amcType" required="" class="form-select">
                <option value="" disabled="" selected="">Select your option</option>
                <option value="Commercial">Commercial</option>
                <option value="Residential">Residential</option>
            </select>
            <label class="control-label">AMC Type<a style="color: red;">*</a> </label>
        </div>
             <div class="col-md-4 form-floating mb-3" id="serviceCatHide">
            <select id="serviceCat" name="serviceCat" required="" class="form-select">
                <option value="" disabled="" selected="">Select your option</option>
                  <option value="Rental">Rental</option>
                   <option value="Common">Common</option>
            </select>
            <label class="control-label">Service Category<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="serviceAreaHide">
            <select id="serviceArea" name="serviceArea" class="form-select">
                <option value="" disabled="" selected="">Select your option</option>
                <option value="Unit">Unit</option>
                <option value="Utility">Utility</option>
            </select>
            <label class="control-label">Service Area<a style="color: red;">*</a> </label>
        </div>

        <div class="col-md-4 form-floating mb-3" id="unitNoDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="${list.unitNo}" onclick="return selectUnitNoDetails();"  name="unitNo"/>
            <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="utilityAreaDiv" style="display:none;">
            <select id="utilityArea" name="utilityArea"  class="form-select">
                <option value="" disabled="" selected="">Select your option</option>
                <option value="Common">Common</option>
                <option value="Shared">Shared</option>
            </select>
            <label class="control-label">Utility Area </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="chooseUnitDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="chooseUnit" maxlength="40" value="" name="chooseUnit" />
            <label class="control-label">Choose Units<a style="color: red;">*</a> </label>
        </div>


        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="serviceName" name="serviceName" maxlength="40" value="" required/>
            <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="serviceDesc" name="serviceDesc" maxlength="40" value="" required/>
            <label class="control-label">Service Description<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
          <select id="schedule" name="schedule" required="" class="form-select">
              <option value="" disabled="" selected="">Select your option</option>
              <option value="Weekly">Weekly</option>
              <option value="Monthly">Monthly</option>
              <option value="Quarterly">Quarterly</option>
              <option value="Half Yearly">Half Yearly</option>
              <option value="Yearly">Yearly</option>
          </select>
          <label class="control-label">Schedule<a style="color: red;">*</a> </label>
      </div>

        <div class="col-md-4 form-floating mb-3 pick">
            <input type="text" placeholder="Fill" class="form-control datepicker" id="dueDate" autocomplete="off" required name="dueDate" value=""/>
            <label class="control-label">Due Date <a style="color: red;">*</a></label>
        </div>
        <div class="col-md-4 form-floating mb-3 pick">
          <input type="text" placeholder="Fill" class="form-control datepicker" id="amcDate"autocomplete="off" required name="amcDate" value=""/>
          <label class="control-label">Next AMC Date <a style="color: red;">*</a></label>
      </div>
      <div class="col-md-4 form-floating mb-3">
        <select id="priority" name="priority" required="" class="form-select">
            <option value="" disabled="" selected="">Select your option</option>
            <option value="Critical">Critical</option>
            <option value="High">High</option>
            <option value="Medium">Medium</option>
            <option value="Low">Low</option>
        </select>
        <label class="control-label">Priority<a style="color: red;">*</a> </label>
    </div>
    <div class="col-md-4 form-floating mb-3">
      <select id="responsibility" name="responsibility" required="" class="form-select">
          <option value="" disabled="" selected="">Select your option</option>
          <option value="External">External</option>
          <option value="Internal">Internal</option>
      </select>
      <label class="control-label">Responsibility of  <a style="color: red;">*</a> </label>
  </div>
  <div class="col-md-4 form-floating mb-3">
      <input type="text" placeholder="Fill" class="form-control" id="approvedCost" required="" name="approvedCost" maxlength="10" value="" onkeypress="return isNumberKey(event)" />
    <label class="control-label">Approved Costs<a style="color: red;">*</a></label>
</div>
<div class="col-md-4 form-floating mb-3">
  <input type="text" placeholder="Fill" class="form-control" id="contactPerson" name="contactPerson" value=""/>
  <label class="control-label">Contact Person</label>
</div>

      <div class="col-md-4 form-floating mb-3">
        <label for="xlfile" class="control-label"></label>
        <input type="file" class="form-control" name="xlfile" id="xlfile" onchange ="return stUpdate()"/>
    </div>

                                </c:if>

                                <c:if test="${action eq 'edit'}">
                                <c:forEach items="${AMCMaintenanceList}" var="list">

                                   <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Select Property Code"
                class="form-control"
                required=""
                id="assetCode"
                readonly=""
                name="assetCode"
                maxlength="40"
                value="${list.assetCode}"



            />
            <label class="control-label">Property Code <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Fill"
                class="form-control"
                id="assetName"
                readonly=""
                name="assetName" readonly=""
                maxlength="40"
                value="${list.propertyName}"
                onclick="return selectAccAssetDetails();"
                onkeypress="return isNumberKey3(event)"
                onfocus="return changeFloor();"
            />
            <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="amcId" name="amcId" maxlength="40" value="${list.amcId}" required readonly/>
            <input type="hidden" placeholder="Fill" class="form-control" id="pk" name="pk" maxlength="40" value="${list.SNo}" required readonly/>
            <label class="control-label">AMC Id</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <select id="amcType" name="amcType" required="" readonly="" class="form-select">

                <option value="${list.amcType}">${list.amcType}</option>

            </select>
            <label class="control-label">AMC Type<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <select id="serviceArea" name="serviceArea" required="" readonly="" class="form-control">

                <option value="${list.serviceArea}">${list.serviceArea}</option>

            </select>
            <label class="control-label">Service Area<a style="color: red;">*</a> </label>
        </div>

        <div class="col-md-4 form-floating mb-3" id="unitNoDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="${list.unitNo}" onclick="return selectUnitNoDetails();"  name="unitNo"/>
            <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="utilityAreaDiv" style="display:none;">
            <select id="utilityArea" name="utilityArea" readonly="" class="form-control">

                <option value="${list.utilityArea}">${list.utilityArea}</option>
                <option value="Shared">Shared</option>
            </select>
            <label class="control-label">Utility Area </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="chooseUnitDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="chooseUnit" maxlength="40" value="${list.chooseUnit}" name="chooseUnit"  readonly=""/>
            <label class="control-label">Choose Units<a style="color: red;">*</a> </label>
        </div>


        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" readonly="" class="form-control" id="serviceName" name="serviceName" maxlength="40" value="${list.serviceName}" required/>
            <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill"  readonly=""class="form-control" id="serviceDesc" name="serviceDesc" maxlength="40" value="${list.serviceDesc}" required/>
            <label class="control-label">Service Description<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
          <select id="schedule" name="schedule" required="" readonly="" class="form-select">

              <option value="${list.schedule}">${list.schedule}</option>

          </select>
          <label class="control-label">Schedule<a style="color: red;">*</a> </label>
      </div>

        <div class="col-md-4 form-floating mb-3 pick">
            <input type="text" placeholder="Fill" readonly="" class="form-control datepicker" id="dueDate" autocomplete="off" required name="dueDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.dueDate}"/>"/>
            <label class="control-label">Due Date <a style="color: red;">*</a></label>
        </div>
        <div class="col-md-4 form-floating mb-3 pick">
            <input type="text" placeholder="Fill" readonly="" class="form-control datepicker" id="amcDate"autocomplete="off" required name="amcDate" value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.amcDate}"/>"/>
          <label class="control-label">Next AMC Date <a style="color: red;">*</a></label>
      </div>
      <div class="col-md-4 form-floating mb-3">
        <select id="priority" name="priority" required="" readonly="" class="form-select">

            <option value="${list.priority}">${list.priority}</option>

        </select>
        <label class="control-label">Priority<a style="color: red;">*</a> </label>
    </div>
    <div class="col-md-4 form-floating mb-3">
      <select id="responsibility" name="responsibility" required="" readonly="" class="form-select">

          <option value="${list.responsibility}">${list.responsibility}</option>
      </select>
      <label class="control-label">Responsibility of <a style="color: red;">*</a> </label>
  </div>
  <div class="col-md-4 form-floating mb-3">
      <input type="text" placeholder="Fill" readonly="" class="form-control" id="approvedCost" name="approvedCost" maxlength="10" value="${list.approvedCost}"  />
    <label class="control-label">Approved Cost <a style="color: red;">*</a></label>
</div>
<div class="col-md-4 form-floating mb-3">
    <input type="text" placeholder="Fill" readonly="" class="form-control" id="contactPerson" name="contactPerson" value="${list.contactPerson}"/>
  <label class="control-label">Contact Person</label>
</div>

      <div class="col-md-4 form-floating mb-3">
        <label for="xlfile" class="control-label"></label>
        <input type="file" class="form-control" name="xlfile" id="xlfile" readonly="" onchange ="return stUpdate()"/>
    </div>


      <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="actualCost" name="actualCost"  maxlength="10" value="${list.cost}" 
                                            onchange="return calcArea();" onkeypress="return checkdigit(event, this, 10, 2);" />
            <label class="control-label">Actual Cost <a style="color: red;">*</a></label>
        </div>

                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline"> 
                        <label class="control-label col-md-6"><span style="color: red">*</span> AMC Status</label>
                        <select class="form-control  validate[required]" id="amsStatus" name="amsStatus" required="" data-rel="chosen">

                                    <c:if test="${list.amsStatus eq 'Cancel'}">
                                        <option value="${list.amsStatus}">${list.amsStatus}</option>
                                        <option value="Pending">Pending</option>
                                    <option value="OnHold">OnHold</option>
                                    <option value="Closed">Closed </option>
                                    </c:if>
                                    <c:if test="${list.amsStatus eq 'Closed'}">
                                        <option value="${list.amsStatus}">${list.amsStatus}</option>
                                        <option value="Pending">Pending</option>
                                        <option value="OnHold">OnHold</option>
                                        <option value="Cancel">Cancel </option>
                                    </c:if>
                                    <c:if test="${list.amsStatus eq 'OnHold'}">
                                        <option value="${list.amsStatus}">${list.amsStatus}</option>
                                        <option value="Pending">Pending</option>
                                    <option value="Closed">Closed</option>
                                    <option value="Cancel">Cancel </option>
                                    </c:if>
                                    <c:if test="${list.amsStatus eq 'Pending'}">
                                        <option value="${list.amsStatus}">${list.amsStatus}</option>
                                        <option value="Closed">Closed</option>
                                    <option value="OnHold">OnHold</option>
                                    <option value="Cancel">Cancel </option>
                                    </c:if>
<!--                                                        <option value="Pending">Pending</option>
                                    <option value="OnHold">OnHold</option>
                                    <option value="Closed">Closed </option>
                                    <option value="Cancel">Cancel </option>-->
                                </select>
                    </div>


                                </c:forEach>

                                </c:if>

                                <c:if test="${action eq 'view'}">
                                <c:forEach items="${AMCMaintenanceList}" var="list">

                                   <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Select Property Code"
                class="form-control"
                required=""
                id="assetCode"
                readonly=""
                name="assetCode"
                maxlength="40"
                value="${list.assetCode}"



            />
            <label class="control-label">Property Code <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input
                type="text"
                placeholder="Fill"
                class="form-control"
                id="assetName"
                readonly=""
                name="assetName" readonly=""
                maxlength="40"
                value="${list.propertyName}"
                onclick="return selectAccAssetDetails();"
                onkeypress="return isNumberKey3(event)"
                onfocus="return changeFloor();"
            />
            <input type="hidden" id="assetType1" value="" /> <label class="control-label">Property Name</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" class="form-control" id="amcId" name="amcId" maxlength="40" value="${list.amcId}" required readonly/>
            <input type="hidden" placeholder="Fill" class="form-control" id="SNo" name="SNo" maxlength="40" value="${list.SNo}" required readonly/>
            <label class="control-label">AMC Id</label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <select id="amcType" name="amcType" required="" readonly="" class="form-control">

                <option value="${list.amcType}">${list.amcType}</option>

            </select>
            <label class="control-label">AMC Type<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <select id="serviceArea" name="serviceArea" required="" readonly="" class="form-control">

                <option value="${list.serviceArea}">${list.serviceArea}</option>

            </select>
            <label class="control-label">Service Area<a style="color: red;">*</a> </label>
        </div>

        <div class="col-md-4 form-floating mb-3" id="unitNoDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="unitNo" maxlength="40" value="${list.unitNo}" name="unitNo" required readonly/>
            <label class="control-label">Unit No. <a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="utilityAreaDiv" style="display:none;">
            <select id="utilityArea" name="utilityArea" readonly="" class="form-control">

                <option value="${list.utilityArea}">${list.utilityArea}</option>
                <option value="Shared">Shared</option>
            </select>
            <label class="control-label">Utility Area </label>
        </div>
        <div class="col-md-4 form-floating mb-3" id="chooseUnitDiv" style="display:none;">
            <input type="text" placeholder="Select No" class="form-control" id="chooseUnit" maxlength="40" value="${list.chooseUnit}" name="chooseUnit"  readonly=""/>
            <label class="control-label">Choose Units<a style="color: red;">*</a> </label>
        </div>


        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill" readonly="" class="form-control" id="serviceName" name="serviceName" maxlength="40" value="${list.serviceName}" required/>
            <label class="control-label">Asset / Service Name<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
            <input type="text" placeholder="Fill"  readonly=""class="form-control" id="serviceDesc" name="serviceDesc" maxlength="40" value="${list.serviceDesc}" required/>
            <label class="control-label">Service Description<a style="color: red;">*</a> </label>
        </div>
        <div class="col-md-4 form-floating mb-3">
          <select id="schedule" name="schedule" required="" readonly="" class="form-control">

              <option value="${list.schedule}">${list.schedule}</option>

          </select>
          <label class="control-label">Schedule<a style="color: red;">*</a> </label>
      </div>

        <div class="col-md-4 form-floating mb-3 pick">
            <input type="text" placeholder="Fill" readonly="" class="form-control datepicker" id="dueDate" autocomplete="off" required name="dueDate"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.dueDate}"/>"/>
            <label class="control-label">Due Date <a style="color: red;">*</a></label>
        </div>
        <div class="col-md-4 form-floating mb-3 pick">
            <input type="text" placeholder="Fill" readonly="" class="form-control datepicker" id="amcDate"autocomplete="off" required name="amcDate"  value="<fmt:formatDate pattern="dd-MM-yyyy" value="${list.amcDate}"/>"/>
          <label class="control-label">Next AMC Date <a style="color: red;">*</a></label>
      </div>
      <div class="col-md-4 form-floating mb-3">
        <select id="priority" name="priority" required="" readonly="" class="form-control">

            <option value="${list.priority}">${list.priority}</option>

        </select>
        <label class="control-label">Priority<a style="color: red;">*</a> </label>
    </div>
    <div class="col-md-4 form-floating mb-3">
      <select id="responsibility" name="responsibility" required="" readonly="" class="form-control">

          <option value="${list.responsibility}">${list.responsibility}</option>
      </select>
      <label class="control-label">Responsibility of <a style="color: red;">*</a> </label>
  </div>
  <div class="col-md-4 form-floating mb-3">
      <input type="text" placeholder="Fill" readonly="" class="form-control" id="approvedCost" name="approvedCost" maxlength="10" value="${list.approvedCost}"/>
    <label class="control-label">Approved Cost  <a style="color: red;">*</a></label>
</div>
<div class="col-md-4 form-floating mb-3">
    <input type="text" placeholder="Fill" readonly="" class="form-control" id="contactPerson" name="contactPerson" value="${list.contactPerson}"/>
  <label class="control-label">Contact Person</label>
</div>

      <div class="col-md-4 form-floating mb-3">
        <label for="xlfile" class="control-label"></label>
        <input type="file" class="form-control" name="xlfile" id="xlfile" readonly="" onchange ="return stUpdate()"/>
    </div>


      <div class="col-md-4 form-floating mb-3">
          <input type="text" placeholder="Fill"  readonly="" class="form-control" id="actualCost" name="actualCost"   maxlength="10" value="${list.cost}" 
                                            onchange="return calcArea();" onkeypress="return checkdigit(event, this, 10, 2);" />
            <label class="control-label">Actual Cost  <a style="color: red;">*</a></label>
        </div>

                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline"> 
                        <label class="control-label col-md-6"><span style="color: red">*</span> AMC Status</label>
                        <select class="form-control  validate[required]" readonly="" id="amsStatus" name="amsStatus" required="" data-rel="chosen">

                                    <option value="${list.amsStatus}">${list.amsStatus}</option>

                                </select>
                    </div>


                                </c:forEach>

                                </c:if>


    <c:if test="${action ne 'view'}">
                                    <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <a href="../AMC/AMCMaintenanceList.htm" class="btn btn-danger">Cancel</a>
                                    </div>

                                </c:if>
                                   <c:if test="${action eq 'view'  }">
                                       <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                       <a href="../AMC/AMCMaintenanceList.htm" class="btn btn-danger">Cancel</a>
                                         </div>
                                          </c:if>

    </form>


                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main><!-- End #main -->


    <script>
        $(document).ready(function(){
    $("#serviceAreaHide").hide()
})
 $("#serviceCat").on('change', function (e) {
    if(e.target.value == "Rental") {
        $("#serviceAreaHide").show()
    } else {
        $("#serviceAreaHide").hide()
    }
})
function stUpdate() {
    var errpval = document.getElementById("xlfile").value;
    var valid_extensions = /(.pdf|.jpg|.jpeg|.png)$/i;
    if (valid_extensions.test(errpval)) {
    } else {
        document.getElementById("xlfile").value = "";
        swal('Please select either pdf or images');
    }
}
</script>
<script>
$("#serviceArea").on('change', function() {
    var serviceArea = document.getElementById("serviceArea").value;
    if (serviceArea === 'Unit')
    {
        $("#unitNoDiv").show();
        $("#utilityAreaDiv").hide();
    }
    else{
        $("#unitNoDiv").hide();
        $("#utilityAreaDiv").show();
    }

});
</script>
<script>
$("#utilityAreaDiv").on('change', function() {
    var utilityArea = document.getElementById("utilityArea").value;
    if (utilityArea === 'Common')
    {
        $("#chooseUnitDiv").show();
    }
    else{
        $("#chooseUnitDiv").hide();
    }

});
</script>
<script>
    $('#dueDate').datepicker({
                format: 'dd-MM-yyyy',
                autoclose: true,
                todayHighlight: true,
                startDate:new Date(),
                orientation:'bottom'
            });
</script>
<script>
$('#amcDate').datepicker({
          format: 'dd-MM-yyyy',
          autoclose: true,
          todayHighlight: true,
          startDate:new Date(),
          orientation:'bottom'
      });
</script>
<script>
$("#savebtn").click(function () {
       $("#subassetsForm").validate({
           rules: {},
           messages: {},
           errorElement: 'div',
           errorClass: 'invalid-feedback',
           errorPlacement: function (error, element) {
               if (element.parent('.input-group-prepend').length) {
                   $(element).siblings(".invalid-feedback").append(error);
               } else {
                   error.insertAfter(element);
               }
           },
           highlight: function (element, errorClass, validClass) {
               $(element).addClass('is-invalid');
           },
           unhighlight: function (element, errorClass, validClass) {
               $(element).removeClass('is-invalid');
           }
       });
   });
   </script>
               <script src="../common/theme/js/custom.js"></script>
</body>

</html>