<%-- 
    Document   : MOMForm
    Created on : 24 May, 2016, 3:33:28 PM
    Author     : ebs-sdd05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../common/validate/validationEngine.css" type="text/css">
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript" charset="utf-8"></script>
        <script src="../common/validate/jquery.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="../common/csspopup.js"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css_2.js"></script>
        <link href="../common/theme/css/disableSelection.css" rel="stylesheet" type="text/css"/>

        <title>arête Assets Management</title>
        <script type="text/javascript">

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

                        <div class="page-title">

                        </div>
                        <div class="clearfix"></div>

                        <div class="col-md-6 col-xs-12">
                            <div class="x_panel">
                                <jsp:include page="../login/headerlink.htm?submodule=Minutes Of Meeting&tab=Minutes Of Meeting&pagetype=form"/>
                                <div class="x_title">
                                    <h2>Minutes Of Meeting </h2>

                                    </li>

                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <br />
                                    <c:forEach items="${momdata}" var="list">
                                        <c:if test="${list[0] eq '356'}">
                                            <c:set value="${list[1]}" var="field_1"/>
                                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                                            <c:set value="${list[3]}" var="mand_status_1"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '357'}">
                                            <c:set value="${list[1]}" var="field_2"/>
                                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                                            <c:set value="${list[3]}" var="mand_status_2"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '358'}">
                                            <c:set value="${list[1]}" var="field_3"/>
                                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            <c:set value="${list[3]}" var="mand_status_3"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '359'}">
                                            <c:set value="${list[1]}" var="field_4"/>
                                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            <c:set value="${list[3]}" var="mand_status_4"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '360'}">
                                            <c:set value="${list[1]}" var="field_5"/>
                                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                                            <c:set value="${list[3]}" var="mand_status_5"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '361'}">
                                            <c:set value="${list[1]}" var="field_6"/>
                                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                                            <c:set value="${list[3]}" var="mand_status_6"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '362'}">
                                            <c:set value="${list[1]}" var="field_7"/>
                                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                                            <c:set value="${list[3]}" var="mand_status_7"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '363'}">
                                            <c:set value="${list[1]}" var="field_8"/>
                                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                                            <c:set value="${list[3]}" var="mand_status_8"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '364'}">
                                            <c:set value="${list[1]}" var="field_9"/>
                                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                                            <c:set value="${list[3]}" var="mand_status_9"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '365'}">
                                            <c:set value="${list[1]}" var="field_10"/>
                                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                                            <c:set value="${list[3]}" var="mand_status_10"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '366'}">
                                            <c:set value="${list[1]}" var="field_11"/>
                                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                                            <c:set value="${list[3]}" var="mand_status_11"/>
                                        </c:if>
                                        <c:if test="${list[0] eq '138'}">
                                            <c:set value="${list[1]}" var="field_12"/>
                                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                                            <c:set value="${list[3]}" var="mand_status_12"/>
                                        </c:if>
                                    </c:forEach>

                                    <form class="form-inline" id="MOMForm" accept-charset="UTF-8" method="post" action="../CRM/MOMFormSubmit.htm" onsubmit="return checkGrid();" >
                                        <!--                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                                                    <label class="control-label"><span style="color:red">*</span> Division
                                                                                    </label>
                                        
                                        
                                                                                    <select class="form-control validate[required]" name="division" id="division">
                                                                                        <option value="">Select an option</option>
                                        <c:forEach items="${orglist}" var="org">                                                                
                                            <option value="${org.orgCode}">${org.orgCode}</option> 
                                        </c:forEach>
                                    </select>
                                </div>-->
                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>

                                                <input type="text" id="createdBy" name="createdBy" autocomplete="off" maxlength="50"  class="form-control " value="">
                                                <input type="hidden" id="momCode" name="momCode" placeholder="Select Date" style="cursor: pointer;" readonly=""  class="form-control validate[required]">

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>

                                                <input type="text" id="momdate" name="momdate" placeholder="Select Date" style="cursor: pointer;" readonly=""  class="form-control " onclick="javascript:NewCssCal('momdate', 'ddMMMyyyy', '', '', '', '', 'past')">

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_3 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_3 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_3}</label>

                                                <input type="text" id="meetingTime" name="meetingTime"  placeholder="Select Time" style="cursor: pointer;"   class="form-control " onchange="momTimeCheck();" >

                                            </div>
                                        </c:if>
                                        <p> &nbsp;</p>
                                        <c:if test="${fieldStatus_4 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_4 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_4}</label>

                                                <textarea type="text" id="agenda" name="agenda" rows="1" autocomplete="off" style="resize: none;" maxlength="150"  class="form-control "  ></textarea>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_7 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_7 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_7}</label>

                                                <textarea type="text" id="discussion" name="discussion" rows="1" autocomplete="off" style="resize: none;" maxlength="150"  class="form-control "  ></textarea>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_8 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_8 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_8}</label>


                                                <textarea type="text" id="meetingOutPut" name="meetingOutPut" rows="1" autocomplete="off" style="resize: none;" maxlength="150"  class="form-control "  ></textarea>

                                            </div>
                                        </c:if>









                                        <p>&nbsp;</p>     <p>&nbsp;</p>    
                                        <ul class="nav nav-tabs">
                                            <li  class="active"><a>Members Attended</a></li>
                                        </ul>
                                        <p>&nbsp;</p>
                                        <c:if test="${fieldStatus_5 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_5 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_5}</label>

                                                <input type="text" id="Members" autocomplete="off"  class="form-control"  placeholder="Enter Member Name" value="" onclick="selectmembers();">

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_6 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_6 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_6}</label>

                                                <input type="text" id="Designation" autocomplete="off"  class="form-control" value="" placeholder="Enter Designation" >


                                            </div>
                                        </c:if>
                                        <div class="clearfix"></div>

                                        <p>&nbsp;</p>
                                        
                                        <c:if test="${SNo eq null}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> Add Members</button>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>



                                            <div style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;" >

                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th><i class="fa fa-trash fa-lg"></i></th>                                                
                                                            <th><span style="color:red">*</span> Members Name</th>
                                                            <th><span style="color:red">*</span> Designation</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                    </tbody>
                                                    <script>
                                                        var count = 1;
                                                        var slNo = null;
                                                        function addOrderRow_test() {
                                                            var valid1 = true;
                                                            var x = document.getElementById('Members').value &&
                                                                    document.getElementById('Designation').value;
                                                            if (x == "" || x == null)
                                                            {
                                                                alert("Please Select Mandatory Fields");
                                                                valid1 = false;
                                                            }
                                                            if (valid1 == true) {
                                                                var Members1 = document.getElementById('Members').value;
                                                                var Designation1 = document.getElementById('Designation').value;

                                                                var mobile1 = Members1.split("/");
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < mobile1.length; i++) {
                                                                    $('#resourcetable tr').each(function () {
                                                                        var a = $(this).find('#Members').val();
                                                                        var b = $(this).find('#Designation').val();
                                                                        if (a == mobile1[i]) {
                                                                            alert('Members Already Added');
                                                                            document.getElementById('td').value = "";
                                                                            return false;
                                                                        } else {
                                                                            return true;
                                                                        }

                                                                    });


                                                                    var slNo = table.rows.length - 1;
                                                                    var slNo1 = table.rows.length;
                                                                    var id1 = slNo1;

                                                                    var tr = table.insertRow(slNo + 1);
                                                                    tr.id = 'list_tr_' + slNo;
                                                                    tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                            + slNo + ')" ></button> </td>\n\
                                                     <td ><input class="form-control validate[required]" style="text-align:center;" type="text" id="Members" readonly name="Members" value="' + Members1 +
                                                                            '" ></td><td ><input class="form-control validate[required]" style="text-align:center;" type="text"readonly name="Designation" id="Designation" value="' + Designation1 +
                                                                            '" style="border: none"></td>';



                                                                    count++;
                                                                    document.getElementById('Members').value = "";
                                                                    document.getElementById('Designation').value = "";
                                                                }
                                                            } else {
                                                                return;
                                                            }




                                                        }
                                                        function removeRow(id) {
                                                            count--;
                                                            var table = document.getElementById("resourcetable");
                                                            for (var i = 0; i < table.rows.length; i++) {
                                                                var lr = table.rows[i];
                                                                if (lr.id == 'list_tr_' + id) {
                                                                    table.deleteRow(i);
                                                                    return;
                                                                }
                                                            }
                                                        }


                                                        function checkGrid() {
                                                            var table = document.getElementById("resourcetable");
                                                            var slNo = table.rows.length - 1;
                                                            if (slNo < 0) {
                                                                alert("Please add data in grid");
                                                                return false;
                                                            } else {
                                                                return true;
                                                            }
                                                        }

                                                    </script>

                                                </table>                        



                                            </c:if>


                                        </div>

                                        <br/>

                                        <br/> 
                                        <c:if test="${fieldStatus_9 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_9 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_9}</label>

                                                <input type="text" id="closedBy" autocomplete="off" name="closedBy" maxlength="50"  class="form-control " value="">

                                            </div>
                                        </c:if>
                                        

                                        <c:if test="${action ne 'view'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <p>&nbsp;</p>
                                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                        <button type="submit" class="btn btn-primary" style=""  onclick="return mandTest();"> Save </button>
                                                        <a href="../CRM/momList.htm"  class="btn btn-danger"  style="">Cancel</a>
                                                    </div>
                                                </div></div>
                                            </c:if>

                                    </form>

                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <br/>


                        <div class="clearfix"></div>

                        <div class="clearfix"></div>                

                        <!-- /page content -->

                    </div>

                </div>
            </div>

            <div id="custom_notifications" class="custom-notifications dsp_none">
                <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
                </ul>
                <div class="clearfix"></div>
                <div id="notif-group" class="tabbed_notifications"></div>
            </div>
            <script>
                $(document).ready(function () {
                    $("#MOMForm").validationEngine();
                    $('#meetingTime').timepicker({'timeFormat': 'H:i', 'disableTextInput': true});

                });

                function selectmembers() {
                    var department = document.getElementById("departmentName").value;
                    var division = document.getElementById("division").value;
                    if (department === '') {
                        alert("Please Select The Department Name");
                        return false;
                    }
                    else {
                        myWindow = window.open("../Mom/selectmembers.htm?departmentName=" + department + "&division=" + division, "PopWindow1", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                    }

                }

                function selectDepartment() {

                    var division = document.getElementById("division").value;
                    if (division === '') {
                        alert("Please Select The Division");
                        $("#departmentName").val("");
                        return false;
                    }
                    else {
                        return true;
                    }

                }

                function selecttargetdates($this) {
                    var $itemRow = $($this).closest('tr');
                    var row_index = $($this).closest("tr")[0].rowIndex;
                    $this.id = 'tergetDate' + row_index;
                    NewCssCal('tergetDate' + row_index, 'ddMMMyyyy', '', '', '', '', '');
                }
                function momTimeCheck() {
                    var a = document.getElementById("meetingTime").value;


                    if (a == "00:00") {
                        alert("Please Enter Valid Time.");
                        document.getElementById("meetingTime").value = "";
                    }
                }
                NProgress.done();
            </script>
            <script src="../sales/salesScript/salesScript.js" type="text/javascript"></script>       
            <script src="../CRM/general-crm_scripts.js" type="text/javascript"></script>
            <script src="../CRM/mioinvoice-crm-scripts.js" type="text/javascript"></script>
            <script>
                function mandTest() {
//               closedBy/meetingOutPut/discussion/agenda/meetingTime/momdate/createdBy

                    var tenantM = document.getElementById("createdBy").value &&
                            document.getElementById("momdate").value &&
                            document.getElementById("meetingTime").value &&
                            document.getElementById("agenda").value &&
                            document.getElementById("discussion").value &&
                            document.getElementById("meetingOutPut").value &&
                            document.getElementById("closedBy").value;

                    if (tenantM == '')
                    {

                        alert("Please Fill Mandatory Fields.");

                        $('#createdBy').focus();
                        $('#momdate').focus();
                        $('#meetingTime').focus();
                        $('#agenda').focus();
                        $('#discussion').focus();
                        $('#meetingOutPut').focus();
                        $('#closedBy').focus();
                        return false;
                    }

                    else {
                        document.forms["customerfeedbackForm"].submit();
                    }
                }
            </script>
    </body>

</html>
