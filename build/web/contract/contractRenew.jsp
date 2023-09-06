<%-- 
    Document   : contractRenew
    Created on : 30 Nov, 2016, 12:56:40 PM
   Author     : Shweta S S
--%>

<%@page import="java.text.SimpleDateFormat"%>
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

        <link href="../common/validate/validationEngine.css" rel="stylesheet" type="text/css"/>

        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript"></script>
        <script src="../common/validate/jquery-1.js" type="text/javascript"></script>
        <script src="../common/validate/jquery_002.js" type="text/javascript"></script>
        <script src="../common/validate/jquery.js" type="text/javascript"></script>
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="../common/validate/moment.js" type="text/javascript"></script>

        <title>arête Assets Management</title>
    </head>

    <script>
        jQuery(document).ready(function () {
            $('#userform').validationEngine();

            var code = {};
            $("select[name='contStatus'] > option").each(function () {
                if (code[this.text]) {
                    $(this).remove();
                } else {
                    code[this.text] = this.value;
                }
            });
        });
    </script>
    <script>

        //date validation 
         function dateValid()
        {
            //alert("jhj");
            var loadingDate = document.getElementById("contStartDate").value;
            //alert(loadingDate);
            var unloadingDate = document.getElementById("contEndDate").value;
            //alert(unloadingDate);
            var contReviewDate = document.getElementById("contReviewDate").value;
            //alert(contReviewDate);

            var day = 1000 * 60 * 60 * 24;
            var loaddate = loadingDate.split("-");
            var unloaddate = unloadingDate.split("-");
            var rDAte = contReviewDate.split("-");

            var ldateday = loaddate[1];
            var ldatemon = loaddate[0];
            var ldateyear = loaddate[2];

            var uldateday = unloaddate[1];
            var uldatemon = unloaddate[0];
            var uldateyear = unloaddate[2];

            var revdateday = rDAte[0];
            var revdatemonth = rDAte[1];
            var revdateyear = rDAte[2];

            var ldate = ldateday + '/' + ldatemon + '/' + ldateyear;
            var uldate = uldateday + '/' + uldatemon + '/' + uldateyear;
            var rdate1 = revdateday + '/' + revdatemonth + '/' + revdateyear;

            var diff = ((new Date(uldate).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);
            var diff1 = ((new Date(rdate1).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);
            var diff2 = ((new Date(rdate1).getTime()) - (new Date(uldate).getTime())) / (1000 * 24 * 3600);


            if ((diff < 0)) {
                alert("End Date Should Be Greater Than Start Date");
                document.getElementById("contEndDate").value = "";
                return false;
            }

            if ((diff1 < 0))
            {
                alert("Renewal Date Should Be Greater Than Start Date");
                document.getElementById("contReviewDate").value = "";
                return false;
            } else {

                if (contReviewDate)
                {
                    var months = Math.floor(diff1 / 30.4);
                    var years = Math.floor(months / 12);
                    var cterms = years + "year," + (months - 12 * years) + "months";
                    document.getElementById("contractTerm").value = cterms;
                } else {

                    var months = Math.floor(diff / 30.4);
                    var years = Math.floor(months / 12);
                    var cterms = years + "year," + (months - 12 * years) + "months";

                    if (diff > 0)
                    {
                        document.getElementById("contractTerm").value = cterms;

                    }
                }


            }
        }


       
        ///to select datapicker
        function selectdate(val) {

            NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
            //$('#test').attr();
            //document.getElementById("hiddentr").value=$itemRow.index();

        }
        //attachment validation
        function Validate($this)
        {
            var fl = document.getElementById("attachmentReference").value;
            var fileSize = $this.files[0];
            var sizeInMb = fileSize.size / 1024;
            var sizeLimit = 1024 * 2;
            if (sizeInMb > sizeLimit) {
                alert("File Size Exceeded(Only 2MB Allowed)");
                $($this).val('');
                return;
            }
            var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
            if (!fl.match(fmt))
            {
                alert('Invalid File');
                $($this).val('');
                return false;
            }

            else {
                return true;
            }

        }
        //pop up to select classification
        function SelectClassif() {

            myWindow = window.open("../insurance/contraClassifPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }
        //pop up to select category
        function SelectCategory() {

            myWindow = window.open("../insurance/contraCategoryPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

        //pop up to select Insurance
        function SelectInsurance() {

            myWindow = window.open("../insurance/insuranTagPopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=99,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }
        function parent_disable() {
            if (myWindow && !myWindow.closed)
                myWindow.focus();
        }

        //function to delete the attachment   
        function deleteFile(data1) {
            var attach = data1;
            var x = confirm("Do you really want to delete this attachment?");
            if (x)
            {
                var attchSNo = attach;
                $.ajax
                        ({
                            type: "POST",
                            url: '../insurance/contractAttachDel.htm',
                            data: {
                                attchSNo: attchSNo
                            },
                            success: function (data) {
                                if ($.trim(data) === 'Already Exists.Enter another') {
                                    //alert("This File is deleted");
                                    return false;
                                }

                            }


                        });
                alert("This File is deleted");
                return false;
            }
            else
            {
                return false;
            }

        }


///grid validation before save
        function testGrid()
        {
            var y =
//                    (document.getElementById('contractTitle').value) &&
                    (document.getElementById('contractCategory').value) &&
                    (document.getElementById('contStartDate').value) &&
                    (document.getElementById('contEndDate').value) &&
                    (document.getElementById('contStatus').value) &&
                    (document.getElementById('contClassification').value);

            if (y == "" || y == null) {
                alert('Please fill out the mandatory fields');
                return false;
            }

            else
            {
                $('#contractCreation').submit();
            }
        }

        function test()
        {
            var comp = document.getElementById("contractTitle").value;
            var comp1 = document.getElementById("contractTitle1").value;



            if (comp !== comp1) {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["contractCreation"].submit();
                    return true;
                } else {
                    return true;
                }

            } else {
                document.forms["contractCreation"].submit();
            }


        }

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
                                <jsp:include page="../login/headerlink.htm?submodule=Contract Creation&tab=Contract Creation&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Contract Renewal</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="contractCreation" class="form-inline" action="../insurance/contractRenewSubmit.htm" method="post" enctype="multipart/form-data">
                                        <c:choose>
                                            <c:when test="${fn:length(contCreat) > 0}">
                                                <c:forEach items="${contCreat}" var="list">
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <script type="text/javascript">
                                                                $(document).ready(function () {


                                                                    var nFields = document.getElementsByClassName('x_panel')[0].getElementsByTagName('input');
                                                                    for (i = 0; i < nFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(nFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(nFields[i]).css("border-color", "red");
                                                                            $(nFields[i]).focus(function () {
                                                                                debugger;
                                                                                //alert('hi');
                                                                                $(this).css("border-color", "red");
                                                                                //$(this).attr("style", "border-color red !important");
                                                                            });
                                                                        }
                                                                    }

                                                                });
                                                            </script>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                        <c:forEach items="${category}" var="list">                                       
                                            <c:if test="${list[0] eq '94'}">
                                                <c:set value="${list[1]}" var="field_94"/>
                                                <c:set value="${list[2]}" var="fieldStatus_94"/>
                                                <c:set value="${list[3]}" var="mand_status_94"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '95'}">
                                                <c:set value="${list[1]}" var="field_95"/>
                                                <c:set value="${list[2]}" var="fieldStatus_95"/>
                                                <c:set value="${list[3]}" var="mand_status_95"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '96'}">
                                                <c:set value="${list[1]}" var="field_96"/>
                                                <c:set value="${list[2]}" var="fieldStatus_96"/>
                                                <c:set value="${list[3]}" var="mand_status_96"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '97'}">
                                                <c:set value="${list[1]}" var="field_97"/>
                                                <c:set value="${list[2]}" var="fieldStatus_97"/>
                                                <c:set value="${list[3]}" var="mand_status_97"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '98'}">
                                                <c:set value="${list[1]}" var="field_98"/>
                                                <c:set value="${list[2]}" var="fieldStatus_98"/>
                                                <c:set value="${list[3]}" var="mand_status_98"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '99'}">
                                                <c:set value="${list[1]}" var="field_99"/>
                                                <c:set value="${list[2]}" var="fieldStatus_99"/>
                                                <c:set value="${list[3]}" var="mand_status_99"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '100'}">
                                                <c:set value="${list[1]}" var="field_100"/>
                                                <c:set value="${list[2]}" var="fieldStatus_100"/>
                                                <c:set value="${list[3]}" var="mand_status_100"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '101'}">
                                                <c:set value="${list[1]}" var="field_101"/>
                                                <c:set value="${list[2]}" var="fieldStatus_101"/>
                                                <c:set value="${list[3]}" var="mand_status_101"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '102'}">
                                                <c:set value="${list[1]}" var="field_102"/>
                                                <c:set value="${list[2]}" var="fieldStatus_102"/>
                                                <c:set value="${list[3]}" var="mand_status_102"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '103'}">
                                                <c:set value="${list[1]}" var="field_103"/>
                                                <c:set value="${list[2]}" var="fieldStatus_103"/>
                                                <c:set value="${list[3]}" var="mand_status_103"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '106'}">
                                                <c:set value="${list[1]}" var="field_106"/>
                                                <c:set value="${list[2]}" var="fieldStatus_106"/>
                                                <c:set value="${list[3]}" var="mand_status_106"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '107'}">
                                                <c:set value="${list[1]}" var="field_107"/>
                                                <c:set value="${list[2]}" var="fieldStatus_107"/>
                                                <c:set value="${list[3]}" var="mand_status_107"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '291'}">
                                                <c:set value="${list[1]}" var="field_291"/>
                                                <c:set value="${list[2]}" var="fieldStatus_291"/>
                                                <c:set value="${list[3]}" var="mand_status_291"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '614'}">
                                                <c:set value="${list[1]}" var="field_614"/>
                                                <c:set value="${list[2]}" var="fieldStatus_614"/>
                                                <c:set value="${list[3]}" var="mand_status_614"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '615'}">
                                                <c:set value="${list[1]}" var="field_615"/>
                                                <c:set value="${list[2]}" var="fieldStatus_615"/>
                                                <c:set value="${list[3]}" var="mand_status_615"/>
                                            </c:if>


                                        </c:forEach> 
                                        <c:if test="${fieldStatus_95 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_95 eq 'required'}">
                                                    <a style="color:transparent;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_95}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input type="hidden" value="${action}" name="action" id="action"/>
                                                                    <input type="hidden" class="form-control" ${mand_status_94} readonly="" id="contractCode" name="contractCode" value="${list.contractCode}">
                                                                    <input type="text" class="form-control" ${mand_status_95} id="contractTitle" name="contractTitle" maxlength="50" value="${list.contractTitle}">
                                                                    <input type="hidden" class="form-control" ${mand_status_95} id="contractTitle1" name="contractTitle1" maxlength="50" value="${list.contractTitle}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="hidden" class="form-control" ${mand_status_94} readonly=""  id="contractCode" value="${list.contractCode}">
                                                                    <input type="text" class="form-control" ${mand_status_95} readonly="" name="contractTitle" value="${list.contractTitle}" maxlength="50">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="hidden" value="" id="action"/>
                                                        <input type="hidden"  class="form-control"${mand_status_94} readonly=""  placeholder="CONT-" name="contractCode" id="contractCode" value="">
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_95} autocomplete="off" id="contractTitle" name="contractTitle" maxlength="50">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_96 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_96 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_96}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(catId) > 0}">
                                                        <c:forEach items="${catId}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input type="text" class="form-control" ${mand_status_96} readonly="" id="contractCategory" name="contractCategory" value="${list[0]}" readonly="">
                                                                    <input type="hidden"  class="form-control" readonly=""   id="categoryId" name="categoryId"  value="${list[1]}"> 
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control" ${mand_status_96} readonly="" name="contractCategory" value="${list[0]}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Contract Category" class="form-control" ${mand_status_96}  id="contractCategory" name="contractCategory"  readonly="" onclick="SelectCategory();">
                                                        <input type="hidden" placeholder="" class="form-control"  id="categoryDesc" name="categoryDesc">
                                                        <input type="hidden"  class="form-control" readonly=""   id="categoryId" name="categoryId"   value=""> 
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_97 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_97 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_97}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_97} name="contStartDate" id="contStartDate" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contStartDate}"/>"> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_97} readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contStartDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_97} id="contStartDate" name="contStartDate"   placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contStartDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_98 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_98 eq 'required'}">
                                                    <a style="color:red;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_98}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contEndDate}"/>" onclick="NewCssCal('contEndDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid();"> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_98} readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contEndDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_98} id="contEndDate" name="contEndDate"  placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contEndDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_99 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="color:transparent;">*</a>                                               
                                                <label class="control-label" for="selectError">${field_99}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input name="status" type="hidden" value="${type.status}">
                                                                    <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contReviewDate}"/>" onclick="NewCssCal('contReviewDate', 'ddMMMyyyy', '', '', '', '', '');" onchange="dateValid();"> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contReviewDate}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} id="contReviewDate" name="contReviewDate" placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contReviewDate', 'ddMMMyyyy', '', '', '', '', '');" onchange="dateValid();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_291 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_291 eq 'required'}">
                                                    <a class="control-label-required"style="color:red;">*</a>  
                                                </c:if>
                                                <label class="control-label">${field_291}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input type="text" class="form-control" ${mand_status_291} readonly="" id="contractTerm" name="contractTerm" value="${list.contractTerm}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_291} readonly="" name="contractTerm" value="${list.contractTerm}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text"  class="form-control" ${mand_status_291}  id="contractTerm" name="contractTerm" readonly="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_100 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_100 eq 'required'}">
                                                    <a style="color:red;">*</a>   
                                                </c:if>                                          
                                                <label class="control-label ">${field_100}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">

                                                                    <select  name="contStatus" id="contStatus" readonly  ${mand_status_100} class="form-control validate[required]" >
                                                                        <option selected="" >${list.contStatus}</option>

                                                                    </select> 

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_100} readonly="" name="contStatus" value="${list.contStatus}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select  id="contStatus" name="contStatus"    required="" class="form-control validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option value="Active">Active</option> 
                                                            <option value="Inactive">Inactive</option> 
                                                        </select> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>  

                                        <c:if test="${fieldStatus_101 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_101 eq 'required'}">
                                                    <a style="color:red;">*</a> 
                                                </c:if>
                                                <label class="control-label">${field_101}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(classId) > 0}">
                                                        <c:forEach items="${classId}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">
                                                                    <input style="margin-top: -10px;" type="text" class="form-control" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${list[0]}" onclick="SelectClassif();">
                                                                    <input type="hidden" placeholder="" class="form-control"  id="classificationId" value="${list[1]}" >

                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input style="margin-top: -10px;" type="text" class="form-control" ${mand_status_101} readonly="" name="contClassification" value="${list[0]}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input style="margin-top: -10px;" type="text" placeholder="Select Contract Type" class="form-control" ${mand_status_101}  id="contClassification" name="contClassification" readonly="" onclick="SelectClassif();">
                                                        <input type="hidden" placeholder="" class="form-control"  id="classificationId" name="classificationId" >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>


                                        <c:if test="${fieldStatus_614 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_614 eq 'required'}">  
                                                    <a style="color:red;">*</a>    
                                                </c:if>
                                                <label class="control-label">${field_614}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(subAssetDetail) > 0}">
                                                        <c:forEach items="${subAssetDetail}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">

                                                                    <input type="text" class="form-control" placeholder="Select Property" readonly="" id="assetName" name="assetName" value="${list[0]}" onclick="SelectProperty();"> 
                                                                    <input type="hidden" placeholder="" class="form-control"  id="assetCode" name="assetCode" value="${list[2]}">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control"  readonly="" name="assetName" value="${list[0]}">  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" placeholder="Select Property" class="form-control" ${mand_status_614}  id="assetName" name="assetName"  readonly="" onclick="SelectProperty();">
                                                        <input type="hidden"  class="form-control"  id="assetCode" name="assetCode">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_615 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_615 eq 'required'}">  
                                                    <a style="color:red;">*</a>    
                                                </c:if>
                                                <label class="control-label">${field_615}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(subAssetDetail) > 0}">
                                                        <c:forEach items="${subAssetDetail}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">

                                                                    <input type="text" class="form-control"  readonly="" id="subAssetName" name="subAssetName" value="${list[1]}" > 
                                                                    <input type="hidden" placeholder="" class="form-control"  id="subAssetCode" name="subAssetCode" value="${list[3]}">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control"  readonly="" name="subAssetName" value="${list[1]}">  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text"  class="form-control" ${mand_status_615}  id="subAssetName" name="subAssetName"  readonly="" >
                                                        <input type="hidden"  class="form-control"  id="subAssetCode" name="subAssetCode">

                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_102 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_101 eq 'required'}">  
                                                    <a style="color:transparent;">*</a>    
                                                </c:if>
                                                <label class="control-label">${field_102}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">

                                                                    <input type="text" class="form-control" placeholder="Select Insurance" readonly="" id="insuranceTagged" name="insuranceTagged" value="" readonly=""> 
                                                                    <input type="hidden" placeholder="" class="form-control"  id="insuranceId" >
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control"  readonly="" name="insuranceTagged" value="">  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise> 
                                                        <input type="text" placeholder="Select Insurance" class="form-control" ${mand_status_102}  id="insuranceTagged" name="insuranceTagged"  readonly="" onclick="SelectInsurance();">
                                                        <input type="hidden" placeholder="" class="form-control"  id="insuranceId" name="insuranceId">
                                                        <input type="hidden" value="" name="deleteRows"/>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_106 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">     
                                                <a style="color:transparent;">*</a>
                                                <label style="margin-top:-15px;" class="control-label">${field_106}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(contCreat) > 0}">
                                                        <c:forEach items="${contCreat}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'||action eq 'recheck'}">  
                                                                    <input name="pk" type="hidden" value="${list.sno}">
                                                                    <input name="deleteRows" id="deleteRows" type="hidden" value="">
                                                                    <input name="deleteRows1" id="deleteRows1" type="hidden" value="">
                                                                    <textarea name="remarks" id="remarks" class="form-control" maxlength="300" readonly="" rows="1" style="resize: none">${list.remarks}</textarea>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" class="form-control"  name="remarks" maxlength="300" rows="1" style="resize: none">${list.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea  class="form-control" id="remarks" name="remarks" rows="1" style="resize: none" maxlength="300"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <p>&nbsp;</p>
                                        <div id = "FileUploadContainer">

                                            <!--FileUpload Controls will be added here -->

                                        </div>

                                        <p>&nbsp;</p>
                                        <div class="clearfix"></div>
                                        <div id="div1" >                                   
                                            <c:if test="${action ne 'view'}">                                        
                                                <div class="col-md-4 col-sm-12 col-xs-12 form-inline" >

                                                </div>
                                                <div class="clearfix"></div>
                                                
                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                    <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                        <thead>
                                                            <tr>
                                                                <th style=" ">Action</th>                                                           
                                                                <th style=" "><span style="color: red">*</span>Contract</th>                                              
                                                                <!--                                                                <th style="color:#fff;"><span style="color: red">*</span>Start Date</th>
                                                                                                                                <th style="color:#fff;"><span style="color: red">*</span>End Date</th>    -->
                                                                <th style=" "><span style="color: red">*</span>Contract Type</th>
                                                                <th style=" ">Insurance Tagged</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="resourcetable">

                                                            <c:forEach items="${contraEditList}" var="type">                                                          
                                                                <tr class="item-row"> 
                                                                    <td align="center" onclick=""><button type="button" id="deleteRowcert"><input type="hidden" id="sno"  name="sno" value="${type[11]}"/>
                                                                            <input type="hidden" id="sno1"  name="sno1" value="${type[13]}"/><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                    <td>
                                                                        <input type="hidden" id="contractCode"  name="contractCode" value="${type[6]}"/>
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="contractTitle" id="contractTitle" readonly="" autocomplete="off" type="text" maxlength="30" value="${type[5]}"></td>                           
                                                                    <td><input class="form-control" style="text-align: left;width:100%;"  name="contClassification" id="contClassification" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${type[9]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;"  name="classificationId" id="classificationId" readonly autocomplete="off" type="hidden" min="8" maxlength="11" value="${type[0]}"></td>                                 
                                                                    <td><input class="form-control" style="text-align: left;width:100%;" name="insuranceTagged" id="insuranceTagged1" readonly autocomplete="off" type="text" maxlength="30" value="${type[12]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="categoryId" id="categoryId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[4]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="insuranceId" id="insuranceId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[7]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="contStatus" id="contStatus" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[3]}"></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                        <script>
                                                            //Function to add data into grid
                                                            var count = 0;
                                                            function addToGrid(val1, val2, val3, val4, val5) {
                                                                var valid1 = true;
                                                                var y =
//                                                                        (document.getElementById('contractTitle').value) &&
                                                                        (document.getElementById('contractCategory').value) &&
                                                                        (document.getElementById('contStartDate').value) &&
                                                                        (document.getElementById('contEndDate').value) &&
                                                                        (document.getElementById('contStatus').value) &&
                                                                        (document.getElementById('contClassification').value) &&
                                                                        (document.getElementById('contractTerm').value);

                                                                if (y == "" || y == null) {
                                                                    alert('Please fill out the mandatory fields');
                                                                    valid1 = false;
                                                                }

                                                                if (valid1 === true) {
                                                                    var contractTitle = document.getElementById('contractTitle').value;
                                                                    var contStartDate = document.getElementById('contStartDate').value;
                                                                    var contEndDate = document.getElementById('contEndDate').value;
                                                                    var contClassification = document.getElementById('contClassification').value;
                                                                    var classificationId = document.getElementById('classificationId').value;

                                                                    //readonly
                                                                    var contractCategory = document.getElementById('contractCategory').value;
                                                                    var categoryId = document.getElementById('categoryId').value;
                                                                    var contReviewDate = document.getElementById('contReviewDate').value;
                                                                    var contStatus = document.getElementById('contStatus').value;
                                                                    var remarks = document.getElementById('remarks').value;
                                                                    var contractTerm = document.getElementById('contractTerm').value;

                                                                    $('#resourcetable tr').each(function () {
                                                                        $(this).find('td').each(function () {
                                                                            var a = $(this).find('#insuranceTagged1').val();
                                                                            //alert(a);
                                                                            if (a === val1) {
                                                                                alert('Record already added to grid');
                                                                                document.getElementById('td').value = "";
                                                                                return false;
                                                                            } else {
                                                                                return true;
                                                                            }
                                                                        });
                                                                    });
                                                                    if (val1 != "")
                                                                    {

                                                                        var table = document.getElementById("resourcetable");
                                                                        var slNo1 = table.rows.length;
                                                                        var slNo = count;
                                                                        var tr = table.insertRow(slNo1);
                                                                        tr.id = 'list_tr_' + slNo;
                                                                        tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow(' + slNo + ')" style=""></button><input name="sno" type="hidden" value=""><input name="sno1" type="hidden" value=""/>\n\
                                                                        <input name="contractTerm" type="hidden" value="' + contractTerm + '"></td>' +
                                                                                '<td class="tinput"><input style="width: 100%; text-align:left;" class="form-control" type="text" readonly name="contractTitle" id="contractTitle" value="' + contractTitle + '" style="border: none"></td>' +
                                                                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;"  readonly required name="contClassification" id="contClassification" value="' + contClassification + '"  ><input name="classificationId" id="classificationId" type="hidden" value="' + classificationId + '"></td>' +
                                                                                '<td class="tinput"><input type="text" class="form-control" style="text-align: left;width:100%;" readonly required name="insuranceTagged" id="insuranceTagged1" value="' + val1 + '"  ><input name="insuranceId" id="insuranceId" type="hidden" value="' + val2 + '"></td>';
                                                                    }

                                                                    count++;
                                                                    if (count > 0)
                                                                    {
                                                                        document.getElementById("save1").disabled = false;
                                                                    }
                                                                    document.getElementById('contractTitle').disabled = true;
                                                                    document.getElementById('contClassification').disabled = true;
                                                                    document.getElementById('classificationId').disabled = true;
                                                                    document.getElementById('insuranceId').disabled = true;
                                                                    document.getElementById('classificationId').disabled = true;
                                                                }
                                                            }
                                                            function removeRow(id) {
                                                                count--;
                                                                if (count == 0)
                                                                {
                                                                    document.getElementById("save1").disabled = true;
                                                                    document.getElementById('contractTitle').disabled = false;
                                                                    document.getElementById('contClassification').disabled = false;
                                                                    document.getElementById('classificationId').disabled = false;
                                                                    document.getElementById('insuranceId').disabled = false;
                                                                    document.getElementById('classificationId').disabled = false;

                                                                }
                                                                else {
                                                                    document.getElementById("save1").disabled = false;
                                                                }
                                                                var table = document.getElementById("resourcetable");
                                                                for (var i = 0; i < table.rows.length; i++) {
                                                                    var lr = table.rows[i];
                                                                    if (lr.id == 'list_tr_' + id) {
                                                                        table.deleteRow(i);
                                                                        return;
                                                                    }
                                                                }
                                                            }

                                                        </script>

                                                        <script>


                                                            $(document).on('click', '#deleteRowcert', function () {

                                                                var $itemRow = $(this).closest('tr');
                                                                var discount = $itemRow.find('#sno').val();
                                                                var s = $('#deleteRows').val();
                                                                if (s == "") {
                                                                    document.getElementById("deleteRows").value = discount;
                                                                } else {
                                                                    $('#deleteRows').val(s + '//' + discount);

                                                                }

                                                                deleteRowedu(this);
                                                            });
                                                            function deleteRowedu(row) {
                                                                var rowCount = $('#resourcetable tr').length;
                                                                if (rowCount > 1) {

                                                                    $(row).parents('.item-row').remove();
                                                                    return true;
                                                                }
                                                                else {
                                                                    alert("You cannot delete this row");
                                                                    return false;
                                                                }

                                                            }
                                                        </script>
                                                    </table> 
                                                </div>

                                            </c:if>

                                        </div>
                                        <!--for edit-->    

                                       

                                        <div>    
                                            <c:if test="${ action eq 'view' }">


                                                <div class="clearfix"></div>
                                                <p>&nbsp;</p>
                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                    <table id="membertable" class="table table-striped responsive-utilities jambo_table">
                                                        <thead>
                                                            <tr>
                                                                <th style="color:#fff;">Action</th>                                                           
                                                                <th style="color:#fff;"><span style="color: red">*</span>Contract</th>
                                                                <th style="color:#fff;"><span style="color: red">*</span>Contract Classification</th>
                                                                <th style="color:#fff;">Insurance Tagged</th>

                                                            </tr>

                                                        </thead>
                                                        <tbody id="resourcetable">

                                                            <c:forEach items="${contraEditList}" var="type">
                                                                <tr class="item-row"> 
                                                                    <td align="center" onclick=""><button type="button" ><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                    <td><input type="hidden" id="sno"  name="sno" value="${type[11]}"/>
                                                                        <input type="hidden" id="sno1"  name="sno1" value="${type[13]}"/>
                                                                        <input type="hidden" id="contractCode"  name="contractCode1" value="${type[6]}"/>
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="contractTitle1" id="contractTitle" readonly="" autocomplete="off" type="text" maxlength="30" value="${type[5]}"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:100%;"  name="contClassification1" id="contClassification" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${type[9]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;"  name="classificationId1" id="classificationId" readonly autocomplete="off" type="hidden" min="8" maxlength="11" value="${type[0]}"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:100%;" name="insuranceTagged1" id="insuranceTagged" readonly autocomplete="off" type="text" maxlength="30" value="${type[12]}">
                                                                        <input class="form-control" style="text-align: left;width:100%;" name="insuranceId1" id="insuranceId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[7]}"></td>

                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:if>
                                        </div>
                                        <p>&nbsp</p>
                                        <c:forEach items="${contCreat}" var="list">
                                            <c:set value="${list.contractCode}" var="contractCode"/>
                                            <c:set value="${list.approvar2Remark}" var="approvar2Remark"/>
                                            <c:set value="${list.approvar3Remark}" var="approvar3Remark"/>
                                            <c:set value="${list.lastmodifiedDate}" var="lastmodifiedDate"/>
                                        </c:forEach>
                                        <div class="col-md-12 col-sm-12">                                 
                                                <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                                <input type="hidden" name="count" value="1" />
                                            <c:choose>
                                                <c:when test="${fn:length(contCreat) > 0}">
                                                    <c:forEach items="${contCreat}" var="list">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">   
                                                                <c:set var="i" value="1"/> 
                                                                <c:forEach items="${attachment}" var="list1">


                                                                    <div class="removeattach" id="del${i}">
                                                                        <div id="field" class="col-md-12 col-sm-12">
                                                                            <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                            <a href="../contract/ContractAttachDownload.htm?SNo=${list1.sno}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize" value="${list1.filename}" > <span> </span>
                                                                            </a>                                                                        
                                                                            <input type="hidden" id="attsno${i}" name="attsno" value="${list1.sno}">
                                                                        </div>
                                                                    </div>

                                                                </c:forEach>
                                                                <c:set var="i" value="${i+1}"/>
                                                                <input type="hidden" id="tobedel" name="tobedel" value="">
                                                                <input type="hidden" name="count" value="1" />
                                                                <div >
                                                                    <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                                        <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                                        <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                                        <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                                        <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                                setAttachName(1);"> 
                                                                        <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                        <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                                    </div>
                                                                    <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                                    <span class="nowrap">(Click press + to add another attachment)</span>
                                                                </div> 


                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${attachment}" var="list">
                                                                    <div>
                                                                        <div id="field" class="col-md-12 col-sm-12">

                                                                            <a href="../contract/ContractAttachDownload.htm?SNo=${list.sno}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > 
                                                                            </a><br><br/>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>

                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise> 
                                                    <div >
                                                        <div id="adiv1"  class="col-md-4 col-sm-12 ">
                                                            <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>
                                                            <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                            <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                            <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                    setAttachName(1);"> 
                                                            <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                            <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                        </div>
                                                        <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn add-more" type="button">+</button>
                                                        <span class="nowrap">(Click press + to add another attachment)</span>
                                                    </div>                                                
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>
                                            
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                            <c:if test="${approvar2Remark ne null || approvar3Remark ne null}">

                                                <thead >
                                                    <tr class="headings">     
                                                        <th>Role</th>
                                                        <!--                                                        <th>Name</th>-->
                                                        <th>Date</th>
                                                        <th>Remarks</th>
                                                    </tr>      
                                                </thead> 

                                            </c:if>
                                            <tbody> 
                                                <c:if test="${approvar2Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>GFC</b></td>
                                                        <!--                                                        <td class="center" style="text-align: left;"></td>-->
                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar2Remark}</td>
                                                    </tr>
                                                </c:if> 

                                                <c:if test="${approvar3Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>CFO</b></td>
                                                        <!--                                                        <td class="center" style="text-align: left;"></td>-->
                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar3Remark}</td>
                                                    </tr>
                                                </c:if> 

                                            </tbody>
                                        </table>




                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <button type="button" id="save1" class="btn btn-primary" style="" onclick="testGrid();">Save</button>
                                                <a href="../insurance/expiredContractList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../insurance/expiredContractList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>
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
            function readURL1(input) {
                $('#blah1').show();
                var imageId = input.id;
                checkImageSize1(input, imageId);
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah1')
                                .attr('src', e.target.result)
                                .width(120)
                                .height(120);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }


            function checkImageSize1(obj, id1)
            {
                var size = ($("#" + id1)[0].files[0].size) / (200 * 230);
                if (parseFloat(size) > 45)
                {
                    alert("Exceeding File Size");
                    $("#" + id1).val("");
                } else {
                    Validate(obj, id1);
                }
            }

            function Validate(obj, id1)
            {
                var image = document.getElementById(id1).value;
                if (image != '') {
                    var checkimg = image.toLowerCase();
                    if (!checkimg.match(/(\.jpg|\.png|\.JPG|\.PNG|\.jpeg|\.JPEG)$/)) {
                        alert("Please enter Image File Extensions .jpg,.png,.jpeg");
                        $("#" + id1).focus();
                        $("#" + id1).val("");
                        return false;
                    }
                }
                return true;
            }

            function browseFile(slno) {
                document.getElementById('field' + slno).click();
            }
            function setAttachName(slno) {
                var filenm = document.getElementById('field' + slno).value;
                var filenmArr = filenm.split(".");
                document.getElementById('attachname' + slno).value = filenmArr[0];
            }

            function browseImage(image) {
                document.getElementById(image).click();
            }
            function imageUpload(image, imageLbl) {
                var imgText = document.getElementById(image).value;
                var imgTextArr = imgText.split(".");
                document.getElementById(imageLbl).value = imgTextArr[0];
            }

            var next = 1;
            $(document).on("click", ".add-more", function (e) {
                e.preventDefault();
                var addto = "#adiv" + next;
                next = next + 1;
                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 col-sm-12 "><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div>';
                var newInput = $(newIn);
                $(addto).after(newInput);
//                $("#field" + next).attr('data-source', $(addto).attr('data-source'));
                $("#count").val(next);

            });

            $(document).on("click", '.remove-me', function (e) {
                var rmvId = '' + this.id;
                var fieldNum = rmvId.substring(6);
                var fieldID = "#field" + (fieldNum);
                var nameFieldID = "#attachname" + (fieldNum);
                var btnb = "#btnb" + (fieldNum);
                var errpgh = "#field" + (fieldNum) + "Error";
                var adiv = "#adiv" + (fieldNum);
                $(this).remove();
                $(fieldID).remove();
                $(nameFieldID).remove();
                $(btnb).remove();
                $(errpgh).remove();
                $(adiv).remove();
                next = next - 1;
            });

            $(document).on("click", '.r1', function (e) {
                var rmvId = '' + this.id;

                var num = rmvId.substring(2);

                var divid = "#del" + (num);
                var sno1 = "#attsno" + (num);

                var a = $(sno1).val();
                var b = $("#tobedel").val();

                var c = a + "," + b;

                document.getElementById("tobedel").value = c;

                $(divid).remove();
            });
        </script>
        <script>
            NProgress.done();
        </script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

    </body>

</html>

