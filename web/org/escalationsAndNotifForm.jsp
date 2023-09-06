<%-- 
    Document   : escalationsAndNotifForm
    Created on : 16 Apr, 2019, 5:00:25 PM
    Author     : Lakshmi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>arête Assets Management</title>
    </head>


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
                                <jsp:include page="../login/headerlink.htm?submodule=Escalations And Notifications&tab=Escalations And Notifications&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Escalations & Notifications Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <h1>Development Is going on....!</h1>

                                    <form class="form-inline" action="../login/escalationsAndNotifFormSubmit.htm">
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>SubModule Name</label>
                                            <select class="form-control" autocomplete="off" required="" id="subModule" name="subModule">
                                                <option selected disabled>Select your option</option>
                                                <c:forEach items="${submodulelist}" var="list">
                                                    <option value="${list}">${list}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Tab Name</label>
                                            <select class="form-control" autocomplete="off" required="" id="tabName" name="tabName">
                                                <option selected disabled="">Select your option</option>
                                                <c:forEach items="${tablist}" var="list">
                                                    <option value=""></option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Role Name</label>
                                            <select class="form-control" autocomplete="off" required="" name="roleName" id="roleName">
                                                <option selected disabled="">Select your option</option>
                                                <c:forEach items="${rolenamelist}" var="list">
                                                    <option value=""></option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Notification Type</label>
                                            <select class="form-control" autocomplete="off" required="" name="notifType" id="notifType">
                                                <option selected disabled="">Select your option</option>
                                                <option value="emailNotification">Email Notification</option>
                                                <option value="systemNotification">System Notification</option>
                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Email ID</label>
                                            <input type="text" placeholder="" autocomplete="off" class="form-control" required="" name="email" id="email">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Status</label>
                                            <select class="form-control" required="" autocomplete="off" name="status" id="status">
                                                <option selected disabled="">Select your option</option>
                                                <c:forEach items="${status}" var="list">
                                                    <option value=""></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Time Line</label>
                                            <select class="form-control" autocomplete="off" style="width: 85px" required="" name="numberof" id="numberof">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                            <select class="form-control" style="width: 85px" autocomplete="off" name="timeLine" id="timeLine" required="">
                                                <option value="days">Days</option>
                                                <option value="weeks">Weeks</option>
                                                <option value="months">Months</option>
                                                <option value="Years">Years</option>


                                            </select>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Escalation Notification Level</label>
                                            <select class="form-control" required="" autocomplete="off" name="escalationLevel" id="escalationLevel">
                                                <option selected disabled="">Select your option</option>
                                                <option value="escalationlevel1">Escalation level 1 (2 days)</option>
                                                <option value="escalationlevel2">Escalation level 2 (5 days)</option>
                                                <option value="escalationlevel3">Escalation level 3 (7 days)</option>
                                            </select>
                                        </div>
                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Mail Subject</label>
                                            <input type="text" placeholder="" autocomplete="off" style="width: 400px" class="form-control" required="" name="mailSub" id="mailSub">
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                            <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Message</label>
                                            <textarea type="text" style="width: 400px" autocomplete="off" placeholder="" class="form-control" required="" name="MailBody" id="MailBody"></textarea>
                                        </div>

                                        <p>&nbsp;</p>
                                        <p>&nbsp;</p>

                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">

                                            <button type="submit" class="btn btn-primary" style="">Save</button>
                                            <a href="../login/escalationsAndNotifList.htm" class="btn btn-danger">Cancel</a>


                                        </div> 



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

            //for Tab Name

            $(document).ready(function () {
                //alert("Tabname");
                $("#subModule").change(function () {
                    //alert("Tabname");
                    var submodulename = $("#subModule").val();
                    //alert("submodulename" + submodulename);
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../login/getTabName.htm?subModuleName=' + submodulename + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            //alert("result" + result);
                            var items = "<option value=''>" + "Select your option" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                alert("result" + result[i]);
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#tabName").empty();
                            $("#tabName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });

            //for role Name
            $(document).ready(function () {

                $("#tabName").change(function () {
                    var submodulename = $("#subModule").val();
                    var tabName = $("#tabName").val();
                    //alert("got changed" + selectedasset);
                    // if (selectedasset == 'ALL' || selectedasset == '') {
                    //     return false;
                    // }
                    var request_url = '../login/getRoleName.htm?subModuleName=' + submodulename + '&tabName=' + tabName + '';
                    $.ajax({
                        url: request_url,
                        success: function (data) {
                            var result = JSON.parse(data);
                            var items = "<option value=''>" + "Select your option" + "</option>";
                            for (var i = 0; i < result.length; i++) {
                                items += "<option value='" + result[i] + "'>" + result[i] + " </option>";
                            }
                            $("#roleName").empty();
                            $("#roleName").append(items);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Status: " + textStatus);
                            alert("Error: " + errorThrown);
                        }
                    });
                });
            });


        </script>
    </body>

</html>
