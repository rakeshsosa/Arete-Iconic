<%-- 
    Document   : tenantCategoryForm
    Created on : Mar 4, 2016, 10:42:01 AM
    Author     : Ram
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>

        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="../common/validate/moment.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
        <script>
            function isNumberKey(evt)
            {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
//                    alert("Please Enter Numeric value");
                    return false;
                }
                return true;
            }
            function isNumberKey4(evt) {
                debugger;
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
                {
//                    alert("Please Enter Only Alphabets");
                    return false;
                }
                return true;
            }
            function fetchType() {
                var tenantType = document.getElementById("tenantType").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchType.htm',
                            data: {
                                tenantType: tenantType
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("tenantType").value = "";
                                    return false;
                                }
                            }
                        });
            }


            function test()
            {

                var desc = document.getElementById("typeDesc").value;
                var desc1 = document.getElementById("typeDesc1").value;



                if (desc !== desc1) {
                    if (confirm('Do you really want to Save this updated record')) {
                        document.forms["userform"].submit();
                        return true;
                    } else {
                        return true;
                    }

                } else {
                    document.forms["userform"].submit();
                }


            }
//            function test()
//            {
//                if (confirm('Do you really want to Save this updated record')) {
//                    document.forms["userform"].submit();
//                    return true;
//                } else {
//                    return false;
//                }
//
//            }
            function selectdate(val) {

                NewCssCal(val, 'MMMddyyyy', 'dropdown', true, '12', '', 'future');
                //$('#test').attr();
                //document.getElementById("hiddentr").value=$itemRow.index();

            }
            function selectProperty()
            {
                myWindow = window.open("../dashboard/selectProperty.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
            }
            function valid()
            {

                var dueDate = document.getElementById("dueDate").value;
                if (dueDate == "")
                {
                    alert("enter the date");
                    return false;
                }
            }

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-md">

        <jsp:include page="../login/menu.htm" />


                        <main id="main" class="main">
                            <div>
                                <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC Jobs&pagetype=form"/>
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
                                    <form id="userform" class="form-inline row" action="../AMC/AMCJobsFormSubmit.htm">



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>AMC Type</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <!--<input type="text" class="form-control" ${mand_status_28} required="" name="amcType" id="amcType" maxlength="50" value="${list.amcType}">-->
                                                                <select class="form-control  validate[required]"  id="amcType" data-rel="chosen"  name="amcType">
                                                                    <option selected value="${list.amcType}">${list.amcType}</option>
                                                                    <option value="">Select an option</option>
                                                                    <c:forEach items="${amcorglist}" var="org">
                                                                        <option>${org.amcType}</option>
                                                                    </c:forEach>
                                                                </select>

                                                                <input name="pk" type="hidden" value="${list.SNo}">
                                                                <input name="status" type="hidden" value="${list.status}">

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" name="amcType" maxlength="50" value="${list.amcType}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select class="form-control  validate[required]"  required="" id="amcType" data-rel="chosen" name="amcType">
                                                        <option selected value="">Select an option</option>
                                                        <c:forEach items="${amcorglist}" var="org">
                                                            <option>${org.amcType}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--<input type="text" placeholder="amcType" required="" class="form-control"  name="amcType" id="amcType" value="">-->
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>




                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Property Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="propName" name="propName" required="" value="${list.propertyName}" onclick="return selectProperty();">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.propertyName}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" class="form-control" placeholder="select property" id="propName" name="propName" onclick="return selectProperty();">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Unit</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" name="unit" value="${list.unit}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.unit}" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="unit" class="form-control" id="unit" name="unit" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Invoice No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="invoiceNo" required="" name="invoiceNo" value="${list.invoiceNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="invoiceNo" value="${list.invoiceNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" placeholder="invoiceNo" class="form-control" name="invoiceNo" id="invoiceNo">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-6"><span style="color: red">*</span>Due Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control validate[required]" name="dueDate" id="dueDate" type="text" readonly="" value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>" onclick="NewCssCal('dueDate', 'MMMddyyyy', '', '', '', '', '');"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control validate[required]" readonly type="text"  value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control validate[required]" required="" id="dueDate" name="dueDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('dueDate', 'MMMddyyyy', '', '', '', '', '');" >                                                    
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Cost</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" id="cost" name="cost" value="${list.cost}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.cost}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" placeholder="cost" class="form-control" id="cost" name="cost" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Priority</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <select class="form-control"  id="priority" data-rel="chosen" name="priority">
                                                                    <option slected value="${list.priority}">${list.priority}</option>
                                                                    <option value="">Select an option</option>
                                                                    <option value="high">High</option>
                                                                    <option value="medium">Medium</option>
                                                                    <option value="low">Low</option>
                                                                </select>
                                                                            <!--<input type="text" class="form-control" required="" id="priority" name="priority" value="${list.priority}">-->

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.priority}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <!--<input type="text" required="" placeholder="priority" class="form-control" id="priority" name="priority">-->
                                                    <select class="form-control" id="priority" data-rel="chosen" name="priority">
                                                        <option slected value="">Select an option</option>
                                                        <option value="high">High</option>
                                                        <option value="medium">Medium</option>
                                                        <option value="low">Low</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-6">Next AMC Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" name="nextAmcDate" id="nextAmcDate" type="text" readonly="" value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.nextAmcDate}"/>" onclick="NewCssCal('nextAmcDate', 'MMMddyyyy', '', '', '', '', '');"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text"  value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.nextAmcDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" required="" id="nextAmcDate" name="nextAmcDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('nextAmcDate', 'MMMddyyyy', '', '', '', '', '');" >                                                    
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Extra Charge</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="assignedTo" name="assignedTo" value="${list.assignedTo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.assignedTo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="extracharge" class="form-control" id="assignedTo" name="assignedTo">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Vendor Note</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="vendor"name="vendor" value="${list.vendor}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.vendor}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="vendor"  class="form-control" id="vendor" name="vendor">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>




                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Status</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <select class="form-control  validate[required]" id="amsStatus"  name="amsStatus"  data-rel="chosen">
                                                                    <option selected value="${list.amsStatus}">${list.amsStatus}</option>
                                                                    <option value="">Select an option</option>
                                                                    <option value="Created">Created</option>
                                                                    <option value="In-progress ">In-progress</option>
                                                                    <option value="Completed ">Completed </option>
                                                                </select>
                                                                            <!--<input type="text" class="form-control" required="" id="amsStatus" name="amsStatus" value="${list.amsStatus}">-->
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.amsStatus}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise> 
                                                    <select class="form-control  validate[required]" id="amsStatus" name="amsStatus" required="" data-rel="chosen">
                                                        <option selected value="">Select an option</option>
                                                        <option value="Created">Created</option>
                                                        <option value="In-progress ">In-progress</option>
                                                        <option value="Completed ">Completed </option>
                                                    </select>
                                                    <!--<input type="text" required="" placeholder="amsStatus" class="form-control" id="amsStatus" name="amsStatus">-->
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Remarks</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCJobsList) > 0}">
                                                    <c:forEach items="${AMCJobsList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="workDescription" name="workDescription" value="${list.workDescription}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.workDescription}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="Remarks" class="form-control" id="workDescription" name="workDescription">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="" onclick="return valid();">Save</button>
                                                <a href="../AMC/AMCJobsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>


                                        <!--
                                                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                                                        <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                                                        <a href="../master/amcTypeList.htm" class="btn btn-danger">Cancel</a>
                                                                                    </div>-->


                                    </form>
                                </div>
                                        </div>

                                    </div>
                                </div>
                            </section>

                        </main><!-- End #main -->
                        <jsp:include page="../login/footer.jsp" />
    </body>

</html>
