<%-- 
    Document   : AMCMaintenanceFormEdit
    Created on : 4 Feb, 2019, 7:24:00 PM
    Author     : Lakshmi Prasanna
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
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <title>arete Assets Management</title>
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
//            function myFunction() {
//                var checkBox = document.getElementById("myCheck");
//                var qifeedback = document.getElementById("qifeedback");
//                var text = document.getElementById("text");
//                if (checkBox.checked == true) {
//                    text.style.display = "block";
//
//                } else {
//                    text.style.display = "none";
////                    if (qifeedback == "")
////                    {
////                        alert("Please Enter Feed Back");
////                        $('#qifeedback').focus();
////                    }
//                }
//            }

            $(document).ready(function () {

                $('#myCheck').change(function () {

                    if ($('#qifeedback').attr('required')) {
                        $('#qifeedback').removeAttr('required');
                    }

                    else {
                        $('#qifeedback').attr('required', 'required');
                    }

                });

            });



//            var checkBox = document.getElementById("myCheck");
//                var qifeedback = document.getElementById("qifeedback");
//
//function toggleRequired() {
//
//    if (qifeedback.hasAttribute('required') !== true) {
//        qifeedback.setAttribute('required','required');
//    }
//
//    else {
//        qifeedback.removeAttribute('required');  
//    }
//}
//
//checkBox.addEventListener('change',toggleRequired,false);
//            function valid()
//            {
//                alert("Hi");
//                var checkBox = document.getElementById("myCheck");
//                alert("checkBox"+checkBox);
//                var qifeedback = document.getElementById("qifeedback");
//                alert("qifeedback"+qifeedback);
//                if (checkBox.checked !="") {
//                    if (qifeedback == "")
//                    {
//                        alert("Mandatory"+qifeedback);
//                        alert("Please Enter Feed Back");
//                        $('#qifeedback').focus();
//                    }
//                }
//            }

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
    <body class="nav-md">

        <jsp:include page="../login/menu.htm" />


        <main id="main" class="main">
            <div>
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
                                    <form id="userform" class="row" action="../AMC/AMCMaintenanceFormSubmit.htm">

                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input type="text" class="form-control" ${mand_status_28} readonly=""required="" name="amcType" id="amcType" maxlength="50" value="${list.amcType}">

                                                                <input name="pk" type="hidden" value="${list.SNo}">
                                                                <input name="status" type="hidden" value="${list.status}">

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control col-md-6" readonly="" required="" name="amcType" maxlength="50" value="${list.amcType}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select class="form-select validate[required]" readonly="" required="" id="amcType" data-rel="chosen" name="amcType">
                                                        <option selected value="">Select an option</option>
                                                        <c:forEach items="${amcorglist}" var="org">
                                                            <option>${org.amcType}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <!--                                                        <input type="text" placeholder="amcType" class="form-control col-md-6" required="" name="amcType" id="amcType" value="">-->
                                                </c:otherwise>        
                                            </c:choose>
                                            <label  class="control-label col-md-6">AMC Type <span style="color: red">*</span></label>
                                        </div>


                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control col-md-6" id="propName" readonly="" required="" name="propName" value="${list.propertyName}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control col-md-6" required="" readonly="" value="${list.propertyName}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="select property" required="" readonly="" id="propName" name="propName" class="form-control col-md-6" onclick="return selectProperty();">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Property Name <span style="color: red">*</span></label>
                                        </div>

                                        <div class="col-md-4 form-floating">                                            
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control col-md-6" required="" readonly="" name="unit" value="${list.unit}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control col-md-6" readonly="" readonly="" value="${list.unit}" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="unit" required="" readonly="" class="form-control col-md-6" id="unit" name="unit" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Unit <span style="color: red">*</span></label>
                                        </div>                                        

                                        <div class="col-md-4 form-floating"> 
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input class="form-control validate[required]" name="schedule" readonly="" required="" id="schedule" autocomplete="off" type="tel"  value="${list.schedule}"> 
                                                                <input class="form-control" name="schedule" id="schedule1" readonly="" autocomplete="off" type="hidden" value="${list.schedule}" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text" data-rel="chosen" value="${list.schedule}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-select validate[required]" id="schedule" readonly="" name="schedule" required="" data-rel="chosen">
                                                        <option selected value="">Select an option</option>
                                                        <option value="weekly">Weekly</option>
                                                        <option value="monthly ">Monthly</option>
                                                        <option value="quarterly ">Quarterly </option>
                                                        <option value="halfyearly">Half Yearly</option>
                                                        <option value="yearly">Yearly</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Schedule <span style="color: red">*</span></label>
                                        </div>


                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control " required="" readonly="" id="vendor" name="vendor" value="${list.vendor}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control " readonly="" value="${list.vendor}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="vendor" required="" readonly="" class="form-control " id="vendor" name="vendor">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Vendor <span style="color: red">*</span></label>
                                        </div>

                                        <div class="col-md-4 form-floating">                                            
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control col-md-6" required="" readonly="" id="cost" name="cost" value="${list.cost}" onkeypress="return isNumberKey(event)">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control col-md-6" readonly="" value="${list.cost}" onkeypress="return isNumberKey(event)">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="cost" required="" class="form-control col-md-6" readonly="" id="cost" name="cost" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Cost <span style="color: red">*</span></label>
                                        </div>
                                       
                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control col-md-6" readonly="" id="assignedTo"  name="assignedTo" value="${list.assignedTo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control col-md-6" readonly="" value="${list.assignedTo}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="assignedTo" readonly="" class="form-control col-md-6" id="assignedTo" name="assignedTo">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Assigned To</label>
                                        </div>



                                        <div class="col-md-4 form-floating"> 
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input class="form-control validate[required]" name="priority" readonly="" required="" id="priority" autocomplete="off" type="tel"  value="${list.priority}"> 

                                                                <input class="form-control" name="priority" id="priority" readonly="" autocomplete="off" type="hidden" value="${list.priority}" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" required="" readonly type="text" value="${list.priority}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-select validate[required]" id="priority" readonly="" name="priority" required="" data-rel="chosen">
                                                        <option selected value=""> Select an option </option>
                                                        <option value="Low">High</option>
                                                        <option value="Medium ">Medium</option>
                                                        <option value="High ">Low</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label col-md-6" >Priority <span style="color: red">*</span></label>
                                        </div>



                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control col-md-6 validate[required]" readonly="" name="dueDate" required="" id="dueDate" type="text" value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>" >
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control col-md-6 validate[required]" readonly type="text" required=""  value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control col-md-6 validate[required]" required="" readonly="" id="dueDate" name="dueDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('dueDate', 'MMMddyyyy', '', '', '', '', '');" >                                                    
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label col-md-6">Due Date <span style="color: red">*</span></label>
                                        </div>         

                                        <div class="col-md-4 form-floating">                                            
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" class="form-control col-md-6" readonly="" id="workDescription" name="workDescription" value="${list.workDescription}"></textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" id="workDescription" name="workDescription" class="form-control col-md-6" readonly="" value="${list.workDescription}"></textarea>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea type="text" placeholder="workDescription" readonly="" class="form-control col-md-6" id="workDescription" name="workDescription"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Work Description</label>
                                        </div>


                                        <div class="col-md-4 form-floating">                                            
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control col-md-6" readonly="" id="contactPerson" required="" name="contactPerson" value="${list.contactPerson}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control col-md-6" readonly="" value="${list.contactPerson}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="contactPerson" required="" readonly="" class="form-control col-md-6" id="contactPerson" name="contactPerson">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">Contact Person <span style="color: red">*</span></label>
                                        </div>

                                        <div class="col-md-4 form-floating"> 
                                            <c:choose>
                                                <c:when test="${fn:length(AMCMaintenanceList) > 0}">
                                                    <c:forEach items="${AMCMaintenanceList}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input class="form-control validate[required]" name="amsStatus" readonly="" required="" id="amsStatus" autocomplete="off" type="tel"  value="${list.amsStatus}"> 
                                                                <input class="form-control" name="amsStatus" id="amsStatus" readonly="" autocomplete="off" type="hidden" value="${list.amsStatus}" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control"name="amsStatus" id="amsStatus" readonly type="text" value="${list.amsStatus}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <select class="form-select validate[required]" id="amsStatus" readonly="" name="amsStatus" required="" data-rel="chosen">
                                                        <option selected value="">Select an option</option>
                                                        <option value="Created">Created</option>
                                                        <option value="In-progress ">In-progress</option>
                                                        <option value="Completed ">Completed </option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                            <label class="control-label col-md-6">AMC Status <span style="color: red">*</span></label>
                                        </div>
                                      
                                        <!--Select for QI Feedback <input type="checkbox" id="myCheck"  onclick="myFunction();">-->
                                        </br></br>
                                        <!--<div id="text" style="display:none">-->
                                        <div class="col-md-4 form-floating">
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="qifeedback" required="" name="qifeedback" value="${list.qiFeedBack}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" id="qifeedback" name="qifeedback" readonly="" value="${list.qiFeedBack}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="qifeedback" class="form-control" required="" id="qifeedback" name="qifeedback">
                                                </c:otherwise>        
                                            </c:choose>
											<label class="control-label col-md-6">QI_FeedBack <span style="color: red">*</span></label>
                                        </div>

                                        <!--</div>-->


                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="submit" class="btn btn-primary" style="" onclick="return valid();">Save</button>
                                                <a href="../AMC/AMCMaintenanceList.htm" class="btn btn-danger">Cancel</a>
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
                                 <script src="../common/theme/js/custom.js"></script>
    </body>

</html>
