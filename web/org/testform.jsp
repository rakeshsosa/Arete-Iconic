<%-- 
    Document   : approvallevelform
    Created on : June 2, 2016, 2:47:25 PM
    Author     : Deepesh
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../common/theme/css/alert/alert.css" rel="stylesheet" type="text/css"/>
        <script src="../common/theme/css/alert/alert1.js" type="text/javascript"></script>
        <title>arête Assets Management</title>
        <link rel="shortcut icon" type="image/png" href="../common/theme/images/al-hasar.png" />
        <script src="../common/timeout-dialog.js-master/js/timeout-dialog.js" type="text/javascript"></script>

    </head>
    <script>

        function alert()
        {
            Alert.render("sdfdaaaaaaaaaaaa");

        }




    </script>
    <script>
        var secondsBeforeExpire = ${pageContext.session.maxInactiveInterval};
        var timeToDecide = 15; // Give client 15 seconds to choose.
        setTimeout(function () {
            // Alert.render('Your session is about to timeout in ' + (secondsBeforeExpire - timeToDecide) * 1000 + ' seconds!');





        }, (secondsBeforeExpire - timeToDecide) * 1000);






    </script>


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
                                <jsp:include page="../login/headerlink.htm?submodule=User Role&tab=Test&pagetype=form"/>
                                <jsp:include page="../org/alert.jsp"/>
                                <div class="x_title">
                                    <h2>Test</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <p>  <a style="font-size: 18px;color:#AA0000;font-weight: bold;">*</a> Indicates required field(s)</p>
                                <div class="x_content">


                                    <form class="form-inline" action="../login/testSubmit.htm" onsubmit="return checkGrid();">
                                        <c:forEach items="${levellist}" var="list">

                                            <c:if test="${list.userId eq userId}">

                                                <c:if test="${list.submoduleName eq 'User Role'}">

                                                    <c:if test="${list.tabName eq 'Test'}">
                                                        <c:set value="${list.approvalLevel}" var="approvalLevel"/>
                                                        <c:set value="${list.userName}" var="userName"/>
                                                        <c:set value="${list.approvalRole}" var="approvalRole"/>
                                                        <c:set value="${list.orgName}" var="orgName"/>
                                                        <c:set value="${list.levelNo}" var="levelNo"/>

                                                    </c:if> 
                                                </c:if> 
                                            </c:if> 
                                        </c:forEach>
                                        <input type="hidden"  class="form-control"  name="userId" value="${userId}"> 
                                        <input type="hidden"  class="form-control"  name="orgName" value="${orgName}"> 
                                        <input type="hidden"  class="form-control"  name="userName" value="${userName}"> 
                                        <input type="hidden"  class="form-control"  name="approvalRole" value="${approvalRole}"> 
                                        <input type="hidden"  class="form-control"  name="approvalLevel" value="${approvalLevel}">
                                        <input type="hidden"  class="form-control"  name="levelNo" value="${levelNo}">
                                        <input type="hidden"  class="form-control"  name="submoduleName" value="User Role"> 
                                        <input type="hidden"  class="form-control"  name="tabName" value="Test"> 

                                        <div id="countdown" > </div>

                                        <div id="download">Download Rebecca Black now!</div>

                                        <c:forEach items="${test}" var="list">
                                            <c:if test="${list[0] eq '1'}">
                                                <c:set value="${list[1]}" var="field_1"/>
                                                <c:set value="${list[2]}" var="fieldStatus_1"/>
                                                <c:set value="${list[3]}" var="mand_status_1"/>
                                                <c:set value="${list[4]}" var="maxLength_1"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '2'}">
                                                <c:set value="${list[1]}" var="field_2"/>
                                                <c:set value="${list[2]}" var="fieldStatus_2"/>
                                                <c:set value="${list[3]}" var="mand_status_2"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '3'}">
                                                <c:set value="${list[1]}" var="field_3"/>
                                                <c:set value="${list[2]}" var="fieldStatus_3"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '4'}">
                                                <c:set value="${list[1]}" var="field_4"/>
                                                <c:set value="${list[2]}" var="fieldStatus_4"/>
                                            </c:if>

                                        </c:forEach> 

                                        <c:if test="${fieldStatus_1 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <c:if test="${mand_status_1 eq 'required'}">
                                                    <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_1}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(testlist) > 0}">
                                                        <c:forEach items="${testlist}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" id="requiredAtLoc" class="form-control" required="" readonly="" name="testNo" value="${list.testNo}">
                                                                    <input type="hidden" name="sNo" value="${list.sno}">
                                                                </c:when>

                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text"  class="form-control" ${mand_status_1}  maxlength="${maxLength_1}" name="testNo">
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_2 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                                <c:if test="${mand_status_2 eq 'required'}">
                                                    <a style="font-size: 15px;color:#AA0000;font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_2}</label>
                                                <input type="text" placeholder="Enter Comments" class="form-control" ${mand_status_2} name="Comments">
                                            </div>
                                        </c:if> 



                                        <div class="clearfix"></div>
                                        <p>&nbsp;</p>





                                </div>

                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>

                                <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="submit" class="btn btn-primary" style="">SAVE</button>

                                    </div>
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
    <!-- <div id="dialogoverlay"></div>
                                            <div id="dialogbox">
                                                <div>
                                                    <div id="dialogboxhead"></div>
                                                    <div id="dialogboxbody"></div>
                                                    <div id="dialogboxfoot"></div>
                                                </div>
                                            </div>-->

    <script>
        NProgress.done();
    </script>
</body>

</html>
