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

        </script>
    </head>

    <% java.util.Date d = new java.util.Date();%>
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
                                <jsp:include page="../login/headerlink.htm?submodule=AMC Management&tab=AMC QualityCheck&pagetype=null"/>

                                <div class="x_title">
                                    <h2>AMC Maintenance Details</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form id="userform" class="form-inline" action="../AMC/AMCQualityCheckFormSubmit.htm">

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label  class="control-label col-md-6"><span style="color: red">*</span>AMC Type</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <select class="form-control  validate[required]"  required="" id="amcType" data-rel="chosen" name="amcType">
                                                                    <option selected value="">${list.amcType}</option>
                                                                    <option value="">Select an option</option>
                                                                    <c:forEach items="${amcorglist}" var="org">
                                                                        <option>${org.amcType}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                            <!--<input type="text" class="form-control" ${mand_status_28} required="" name="amcType" id="amcType" maxlength="50" value="${list.amcType}">-->

                                                                <input name="pk" type="hidden" value="${list.SNo}">
                                                                <input name="status" type="hidden" value="${list.status}">

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" name="amcType" maxlength="50" value="${list.amcType}">
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
                                                    <!--<input type="text" placeholder="amcType" class="form-control" required="" name="amcType" id="amcType" value="">-->
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Property Name</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="propName" required="" name="propName" value="${list.propertyName}" onclick="return selectProperty();">
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

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Unit</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required=""  name="unit" value="${list.unit}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.unit}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" placeholder="unit" class="form-control" id="unit" name="unit">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Invoice No</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" id="invoiceNo" name="invoiceNo" value="${list.invoiceNo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" id="invoiceNo" value="${list.invoiceNo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="invoiceNo" required="" class="form-control" name="invoiceNo" id="invoiceNo">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Vendor</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" id="vendor" name="vendor" value="${list.vendor}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.vendor}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" placeholder="vendor" class="form-control" id="vendor" name="vendor">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Cost</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" id="cost" name="cost" value="${list.cost}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" readonly="" value="${list.cost}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" required="" placeholder="cost" class="form-control" id="cost" name="cost">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Assigned To</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="assignedTo" name="assignedTo" value="${list.assignedTo}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="assignedTo" name="assignedTo" class="form-control" readonly="" value="${list.assignedTo}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="assignedTo" class="form-control" id="assignedTo" name="assignedTo">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>Priority</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <!--<input type="text" class="form-control" required="" id="priority" name="priority" value="${list.priority}">-->
                                                                <select class="form-control  validate[required]"  required="" id="priority" data-rel="chosen" name="priority">
                                                                    <option slected value="">${list.priority}</option>
                                                                    <option value="">Select an option</option>
                                                                    <option value="high">High</option>
                                                                    <option value="medium">Medium</option>
                                                                    <option value="low">Low</option>
                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="priority" name="priority" class="form-control" readonly="" value="${list.priority}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <!--<input type="text" placeholder="priority" required="" class="form-control" id="priority" name="priority">-->
                                                    <select class="form-control  validate[required]"  required="" id="priority" data-rel="chosen" name="priority">
                                                        <option value="" slected>Select an option</option>
                                                        <option value="high">High</option>
                                                        <option value="medium">Medium</option>
                                                        <option value="low">Low</option>
                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>



                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label col-md-6">Due Date</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control" name="dueDate" id="dueDate" type="text" value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control" readonly type="text"  value="<fmt:formatDate pattern="MMM-dd-yyyy" value="${list.dueDate}"/>">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="form-control" required="" id="dueDate" name="dueDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('dueDate', 'MMMddyyyy', '', '', '', '', '');" >                                                    
                                                </c:otherwise>        
                                            </c:choose>

                                        </div>         


                                        <p>&nbsp;</p>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">Work Description</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <textarea type="text" class="form-control" id="workDescription" name="workDescription" value="${list.workDescription}"></textarea>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <textarea type="text" class="form-control" id="workDescription" name="workDescription" readonly="" value="${list.workDescription}"></textarea>
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <textarea type="text" placeholder="workDescription" class="form-control" id="workDescription" name="workDescription"></textarea>
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6">QI_FeedBack</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" id="qifeedback" name="qifeedback" value="${list.qifeedback}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" id="qifeedback" name="qifeedback" readonly="" value="${list.qifeedback}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="qifeedback" class="form-control" id="qifeedback" name="qifeedback">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">

                                            <label class="control-label col-md-6"><span style="color: red">*</span>AMS Status</label>
                                            <c:choose>
                                                <c:when test="${fn:length(AMCQualityCheckLists) > 0}">
                                                    <c:forEach items="${AMCQualityCheckLists}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" required="" id="amsStatus" name="amsStatus" value="${list.amsStatus}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" id="amsStatus" name="amsStatus" class="form-control" readonly="" value="${list.amsStatus}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="amsStatus" required="" class="form-control" id="amsStatus" name="amsStatus">
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>


                                        <div class="col-md-12 col-sm-9 col-xs-12 col-md-offset-4">
                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../AMC/AMCQualityCheckList.htm" class="btn btn-danger">Cancel</a>
                                        </div>




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
        </script>
    </body>

</html>
