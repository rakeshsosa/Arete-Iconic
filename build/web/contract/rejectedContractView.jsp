<%-- 
    Document   : rejectedContractView
    Created on : 20 Oct, 2016, 3:12:24 PM
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

        ///to select datapicker
        function selectdate(val) {

            NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');

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




        //date validation 
        function dateValid()
        {
            // alert("jhj");
            var loadingDate = document.getElementById("contStartDate").value;
            var unloadingDate = document.getElementById("contEndDate").value;
            var loaddate = loadingDate.split("-");
            var unloaddate = unloadingDate.split("-");
            var ldateday = loaddate[1];
            var ldatemon = loaddate[0];
            var ldateyear = loaddate[2];
            var ldate = ldateday + '/' + ldatemon + '/' + ldateyear;

            var uldateday = unloaddate[1];
            var uldatemon = unloaddate[0];
            var uldateyear = unloaddate[2];
            var uldate = uldateday + '/' + uldatemon + '/' + uldateyear;
            var diff = ((new Date(uldate).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);

            if ((diff < 0)) {
                alert("End Date Should Be Greater Than Start Date");
                document.getElementById("contEndDate").value = "";
                return false;

            }

        }
        function dateValid1()
        {
            // alert("jhj");
            var loadingDate1 = document.getElementById("contStartDate").value;
            var loadingDate = document.getElementById("contEndDate").value;
            var unloadingDate = document.getElementById("contReviewDate").value;
            var loaddate1 = loadingDate1.split("-");
            var loaddate = loadingDate.split("-");
            var unloaddate = unloadingDate.split("-");
            var ldateday1 = loaddate1[1];
            var ldatemon1 = loaddate1[0];
            var ldateyear1 = loaddate1[2];
            var ldateday = loaddate[1];
            var ldatemon = loaddate[0];
            var ldateyear = loaddate[2];
            var ldate = ldateday + '/' + ldatemon + '/' + ldateyear;
            var ldate1 = ldateday1 + '/' + ldatemon1 + '/' + ldateyear1;
            var uldateday = unloaddate[1];
            var uldatemon = unloaddate[0];
            var uldateyear = unloaddate[2];
            var uldate = uldateday + '/' + uldatemon + '/' + uldateyear;
            var diff1 = ((new Date(ldate).getTime()) - (new Date(ldate1).getTime())) / (1000 * 24 * 3600);
            var diff2 = ((new Date(uldate).getTime()) - (new Date(ldate1).getTime())) / (1000 * 24 * 3600);
            var months = Math.floor(diff1 / 31);
            var years = Math.floor(months / 12);
            if (unloadingDate === null || unloadingDate === "")
            {
                // var contraterms = "" + years + " " + "years" + " " + "-" + " " + months + " " + "months";
                var contraterms = "" + years + " " + "years";
                //alert(contraterms);
                document.getElementById("contractTerm").value = contraterms;
            }
            else
            {
                var months1 = Math.floor(diff2 / 31);
                var years1 = Math.floor(months1 / 12);
                //var contraterms1 = "" + years1 + " " + "years" + " " + "-" + " " + months1 + " " + "months";
                var contraterms1 = "" + years1 + " " + "years";
                document.getElementById("contractTerm").value = contraterms1;
            }


            var diff = ((new Date(uldate).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);

            if ((diff < 0)) {
                alert("Renewal Date Should Be Greater Than End Date");
                document.getElementById("contReviewDate").value = "";
                return false;

            }

        }



///grid validation before save
        function testGrid()
        {
            var y =
                    (document.getElementById('contractTitle').value) &&
                    (document.getElementById('contractCategory').value) &&
                    (document.getElementById('contStartDate').value) &&
                    (document.getElementById('contEndDate').value) &&
                    (document.getElementById('contStatus').value) &&
                    (document.getElementById('contClassification').value);

            if (y == "" || y == null) {
                alert('Please fill out the mandatory fields');
                return false;
            }
            var table = document.getElementById("resourcetable");
            var slNo = table.rows.length - 1;

            if (slNo < 0) {
                alert("Please Enter Data Into Grid ");

            }
            else
            {
                $('#contractCreation').submit();
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
                                <jsp:include page="../login/headerlink.htm?submodule=Contract Creation&tab=Rejected Contract List&pagetype=form"/>

                                <div class="x_title">
                                    <h2>Rejected Contract Form</h2>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br/>


                                    <form id="contractCreation" class="form-inline" action="../insurance/contractCreationFormSubmit.htm" method="post" enctype="multipart/form-data">

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

                                        </c:forEach>

                                        <c:forEach items="${approvList}" var="type">                                          
                                            <c:set var="contractCode" value="${type[6]}"/> 
                                            <c:set var="contractTitle" value="${type[5]}"/> 
                                            <c:set var="contractCategoryId" value="${type[8]}"/> 
                                            <c:set var="contStartDate" value="${type[10]}"/> 
                                            <c:set var="contEndDate" value="${type[1]}"/>
                                            <c:set var="contReviewDate" value="${type[2]}"/>
                                            <c:set var="contractTerm" value="${type[14]}"/>
                                            <c:set var="contStatus" value="${type[3]}"/>
                                            <c:set var="contClassification" value="${type[9]}"/>
                                            <c:set var="remarks" value="${type[15]}"/>
                                        </c:forEach>




                                        <c:if test="${fieldStatus_95 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_95 eq 'required'}">
                                                    <a style="color:transparent; font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_95}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="hidden" class="form-control" ${mand_status_94} readonly="" id="contractCode" name="contractCode" value="${list.contractCode}">
                                                                <input type="text" class="form-control" ${mand_status_95} readonly="" id="contractTitle" name="contractTitle" maxlength="50" value="${list.contractTitle}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text"  class="form-control" ${mand_status_95}  id="contractTitle" name="contractTitle" readonly="" value="${contractTitle}">
                                                                <input  type="hidden" name="contractCode" value="${contractCode}"> 
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>   
                                                        <input type="hidden"  class="form-control"${mand_status_94} readonly=""  placeholder="CONT-" name="contractCode" id="contractCode" value="">
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_95}  id="contractTitle" name="contractTitle" maxlength="50">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_96 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_96 eq 'required'}">
                                                    <a style="color:red; font-weight: bold;">*</a>
                                                </c:if>
                                                <label class="control-label">${field_96}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_96} readonly="" id="contractCategory" name="contractCategory" value="${list[0]}" onclick="SelectCategory();">
                                                                <input type="hidden"  class="form-control" readonly=""   id="categoryId"  value="${list[1]}"> 
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text"  class="form-control" ${mand_status_96}  id="contractCategoryId" name="contractCategoryId" readonly="" value="${contractCategoryId}">
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="Select Contract Category" class="form-control" ${mand_status_96}  id="contractCategory"   readonly="" onclick="SelectCategory();">
                                                        <input type="hidden" placeholder="" class="form-control"  id="categoryDesc" name="categoryDesc">
                                                        <input type="hidden"  class="form-control" readonly=""   id="categoryId"   value=""> 
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_97 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_97 eq 'required'}">
                                                    <a style="color:red; font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_97}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" ${mand_status_97} name="contStartDate" id="contStartDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contStartDate}"/>" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" ${mand_status_97} name="contStartDate" id="contStartDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${contStartDate}"/>" > 
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_97} id="contStartDate"   placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contStartDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_98 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_98 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> 
                                                <label class="control-label" for="selectError">${field_98}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input class="form-control  input-xlarge" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contEndDate}"/>" > 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input class="form-control  input-xlarge" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${contEndDate}"/>" >  
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge" ${mand_status_98} id="contEndDate"  placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contEndDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_99 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>                                               
                                                <label class="control-label" for="selectError">${field_99}</label>

                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="status" type="hidden" value="${type.status}">
                                                                <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.contReviewDate}"/>" onclick="NewCssCal('contReviewDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid1();"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${contReviewDate}"/>">  
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <input style="margin-top:-10px;" class="form-control  input-xlarge" ${mand_status_99} id="contReviewDate"  placeholder="Select Date" readonly="" type="text" onclick="NewCssCal('contReviewDate', 'ddMMMyyyy', '', '', '', '', 'future');" onchange="dateValid1();">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_291 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_291 eq 'required'}">
                                                    <a class="control-label-required" style="color:red;">*</a>    
                                                </c:if>
                                                <label class="control-label">${field_291}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input type="text" class="form-control" ${mand_status_291} readonly="" id="contractTerm" name="contractTerm" value="${list.contractTerm}">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" ${mand_status_291} readonly="" id="contractTerm" name="contractTerm" value="${contractTerm}"> 
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="" class="form-control" ${mand_status_291}  id="contractTerm" readonly="">
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_100 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                                                <c:if test="${mand_status_100 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>   
                                                </c:if>                                          
                                                <label class="control-label ">${field_100}</label>
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <!--                                                                    <label class="control-label" ></label>-->
                                                                <select  name="contStatus" id="contStatus"    ${mand_status_100} class="form-control validate[required]" >
                                                                    <option selected="" disabled="">${list.contStatus}</option>
                                                                    <option value="Active">Active</option> 
                                                                    <option value="Inactive">Inactive</option> 
                                                                </select> 

                                                            </c:when>
                                                            <c:otherwise>
                                                                <input type="text" class="form-control" ${mand_status_291} readonly="" id="contStatus" name="contStatus" value="${contStatus}"> 
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <select  id="contStatus"     required="" class="form-control validate[required]">
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
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a> 
                                                </c:if>
                                                <label class="control-label">${field_101}</label>                                          
                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input style="margin-top: -10px;" type="text" class="form-control" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${list[0]}">
                                                                <input type="hidden" placeholder="" class="form-control"  id="classificationId" value="${list[1]}" >

                                                            </c:when>
                                                            <c:otherwise>

                                                                <input style="margin-top: -10px;" type="text" class="form-control" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${contClassification}">  
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input style="margin-top: -10px;" type="text" placeholder="Select Contract Type" class="form-control" ${mand_status_101}  id="contClassification"  readonly="" onclick="SelectClassif();">
                                                        <input type="hidden" placeholder="" class="form-control"  id="classificationId"  >
                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_102 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline">


                                                <c:if test="${mand_status_101 eq 'required'}">  
                                                    <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>    
                                                </c:if>
                                                <label class="control-label">${field_102}</label>


                                                <c:choose>
                                                    <c:when test="${fn:length(approvList) > 0}">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">
                                                                <input name="deleteRows" type="hidden" value="">
                                                                <input type="text" class="form-control" placeholder="Select Insurance" readonly="" id="insuranceTagged" value="" onclick="SelectInsurance();"> 
                                                                <input type="hidden" placeholder="" class="form-control"  id="insuranceId" >
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control"  readonly="" name="insuranceTagged" value="">  
                                                            </c:otherwise> 
                                                        </c:choose>

                                                    </c:when>
                                                    <c:otherwise> 


                                                        <input type="text" placeholder="Select Insurance" class="form-control" ${mand_status_102}  id="insuranceTagged"  readonly="" onclick="SelectInsurance();">

                                                        <input type="hidden" placeholder="" class="form-control"  id="insuranceId" name="insuranceId">

                                                    </c:otherwise>        
                                                </c:choose>

                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>

                                        
                                        <div id = "FileUploadContainer">

                                            <!--FileUpload Controls will be added here -->

                                        </div>

                                        

                                        <div class="clearfix"></div>

                                        <div id="div1" >                                   

                                            <div class="col-md-4 col-sm-12 col-xs-12 form-inline" >
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <button type="button" class="btn btn-succ" style="" onclick="addOrderRow_test();"><i class="fa fa-plus-circle" style="font-size: 15px"></i> ADD</button>

                                                </div>
                                            </div>

                                            <div class="clearfix"></div>
                                           <br/>
                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th style=" ">Action</th>                                                           
                                                            <th style=" "><span style="color: red">*</span>Contract</th>
                                                            <th style=" "><span style="color: red">*</span>Start Date</th>
                                                            <th style=" "><span style="color: red">*</span>End Date</th>    
                                                            <th style=" "><span style="color: red">*</span>Contract Type</th>                                                    
                                                            <th style=" ">Insurance Tagged</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                        <c:forEach items="${contraEditList}" var="type">                                                          
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id=""><input type="hidden" id="sno"  name="sno" value="${type[11]}"/><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                <td><input type="hidden" id="sno"  name="sno" value="${type[11]}"/>
                                                                    <input type="hidden" id="sno1"  name="sno1" value="${type[13]}"/>
                                                                    <input type="hidden" id="contractCode"  name="contractCode1" value="${type[6]}"/>
                                                                    <input class="form-control" style="text-align: left;width:200px;" name="contractTitle1" id="contractTitle" readonly="" autocomplete="off" type="text" maxlength="30" value="${type[5]}"></td>
                                                                <td><input class="form-control" style="text-align: left;width:200px;" name="contStartDate1" id="contStartDate" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type[10]}"/>"></td>
                                                                <td><input class="form-control" style="text-align: left;width:200px;" name="contEndDate1" id="contEndDate" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/>"></td>                              
                                                                <td><input class="form-control" style="text-align: left;width:200px;"  name="contClassification1" id="contClassification" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${type[9]}">
                                                                    <input class="form-control" style="text-align: left;width:200px;"  name="classificationId1" id="classificationId" readonly autocomplete="off" type="hidden" min="8" maxlength="11" value="${type[0]}"></td>                                 
                                                                <td><input class="form-control" style="text-align: left;width:200px;" name="insuranceTagged1" id="insuranceTagged" readonly autocomplete="off" type="text" maxlength="30" value="${type[12]}">
                                                                    <input class="form-control" style="text-align: left;width:200px;" name="categoryId1" id="categoryId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[4]}">
                                                                    <input class="form-control" style="text-align: left;width:200px;" name="insuranceId1" id="insuranceId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[7]}">
                                                                    <input class="form-control" style="text-align: left;width:200px;" name="contStatus1" id="contStatus" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[3]}"></td>

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>

                                                    <script>
                                                        //To add data into grid
                                                        var count = 0;
                                                        function addOrderRow_test() {


                                                            var valid1 = true;
                                                            var y =
                                                                    (document.getElementById('contractTitle').value) &&
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

                                                            if (valid1 == true) {


                                                                var contractTitle = document.getElementById('contractTitle').value;
                                                                var contractCategory = document.getElementById('contractCategory').value;
                                                                var categoryId = document.getElementById('categoryId').value;
                                                                var contStartDate = document.getElementById('contStartDate').value;
                                                                var contEndDate = document.getElementById('contEndDate').value;
                                                                var contReviewDate = document.getElementById('contReviewDate').value;

                                                                var contStatus = document.getElementById('contStatus').value;
                                                                var contClassification = document.getElementById('contClassification').value;
                                                                var classificationId = document.getElementById('classificationId').value;
                                                                // var contraHardcoded = document.getElementById('contraHardcoded').value;
                                                                var insuranceTagged = document.getElementById('insuranceTagged').value;
                                                                var insuranceId = document.getElementById('insuranceId').value;
                                                                var remarks = document.getElementById('remarks').value;
                                                                var contractTerm = document.getElementById('contractTerm').value;


                                                                var attch = "";

                                                                if (insuranceTagged != null || insuranceTagged != "")
                                                                {
                                                                    var insuranceTagged1 = insuranceTagged.split("/");
                                                                    var insuranceId1 = insuranceId.split("/");
                                                                }
                                                                if (insuranceTagged == null || insuranceTagged == "")
                                                                {
                                                                    //alert("k");
                                                                    var insuranceTagged2 = "NA";
                                                                    var insuranceTagged1 = insuranceTagged2.split("/");

                                                                }


                                                                var contractTitle1 = contractTitle.split("/");
                                                                var contractCategory1 = contractCategory.split("/");
                                                                var categoryId1 = categoryId.split("/");
                                                                var contStartDate1 = contStartDate.split("/");

                                                                var contEndDate1 = contEndDate.split("/");
                                                                if (contReviewDate !== null || "")
                                                                {
                                                                    var contReviewDate1 = contReviewDate.split("/");
                                                                }
                                                                var contStatus1 = contStatus.split("/");
                                                                var contClassification1 = contClassification.split("/");
                                                                var classificationId1 = classificationId.split("/");


                                                                var remarks1 = remarks.split("/");
                                                                var contractTerm1 = contractTerm.split("/");

//                                     
                                                                var table = document.getElementById("resourcetable");

                                                                for (var j = 0; j < insuranceTagged1.length; j++) {
                                                                    $('#resourcetable tr').each(function () {
                                                                        $(this).find('td').each(function () {

                                                                            var a = $(this).find('#insuranceTagged').val();
                                                                            var insuranceTagged = $(this).find('#insuranceTagged').val();

                                                                            if (insuranceTagged === insuranceTagged1[j]) {
                                                                                alert('Record already added to grid');
                                                                                document.getElementById('td').value = "";
                                                                                return false;
                                                                            } else {
                                                                                return true;
                                                                            }
                                                                        })
                                                                    })

                                                                    if (insuranceTagged1[j] !== "")
                                                                    {
                                                                        var c = insuranceTagged1[j];
                                                                        var slNo = table.rows.length - 1;

                                                                        var slNo1 = table.rows.length;
                                                                        var id1 = slNo1;

                                                                        var tr = table.insertRow(slNo + 1);


                                                                        tr.id = 'list_tr_' + slNo;
                                                                        tr.innerHTML = '<td align="center" class="tinput"><button type="button" class="fa fa-trash fa-lg-o" onclick="removeRow('
                                                                                + slNo + ')" ></button> </td>' +
                                                                                '<td class="tinput"><input type="text" style="text-align: center;" readonly id="contractTitle" name="contractTitle" value="' + contractTitle1 + '"/></td>\n\
                                                                                       ' +
                                                                                '<td class="tinput"><input type="text" style="text-align: center;" required autocomplete="off"  readonly  maxlength="10" name="contStartDate" id="contStartDate" value="' + contStartDate1 + '"></td>\n\
                                                                                  <td class="tinput"><input type="text" style="text-align: center;" readonly name="contEndDate" id="contEndDate" value="' + contEndDate1 + '"></td>\n\
                                                                                ' +
                                                                                '<td class="tinput"><input type="text" style="text-align: center;" name="contClassification" readonly value="' + contClassification1 + '"></td>\n\
                                                                                 ' +
                                                                                '<td class="tinput"><input type="text" style="text-align: center;" name="insuranceTagged" id="insuranceTagged" readonly value="' + insuranceTagged1[j] +
                                                                                '" ></td>' + '<td style="display:none;" class="tinput"><input type="hidden" name="remarks" id="remarks" readonly value="' + remarks1 +
                                                                                '" ></td>' + '<td style="display:none;" class="tinput"><input type="hidden" name="categoryId" id="categoryId" readonly value="' + categoryId1 + '"></td>\n\
                                                                                <td style="display:none;" class="tinput"><input type="hidden" name="classificationId" id="classificationId" readonly value="' + classificationId1 + '"></td>\n\
                                                                                 <td style="display:none;" class="tinput"><input type="hidden" name="insuranceId" id="insuranceId" readonly value="' + insuranceId1[j] + '"></td>\n\
                                                                                <td style="display:none;" class="tinput"><input type="hidden" name="contractCode" id="contractCode" readonly value="" ></td>\n\
                                                                                  <td style="display:none;" class="tinput"><input type="hidden" name="contractCategory" id="contractCategory" readonly value="' + contractCategory1 + '" ></td>\n\
                                                                                    <td style="display:none;" class="tinput"><input type="hidden" name="contReviewDate" id="contReviewDate" readonly value="' + contReviewDate1 + '" ></td>\n\
                                                                                      <td style="display:none;" class="tinput"><input type="hidden" name="contStatus" id="contStatus" readonly value="' + contStatus1 + '" ></td>\n\
                                                                                       <td style="display:none;" class="tinput"><input type="hidden" name="contraHardcoded" id="contraHardcoded" readonly value="' + attch + '" ></td>\n\
                                                                                     <td style="display:none;" class="tinput"><input type="hidden" name="contractTerm" id="contractTerm" readonly value="' + contractTerm1 + '" ></td>\n\
                                                                                  <td style="display:none;" class="tinput"><input type="file" name="atth' + contractTitle + '" id="contr" readonly value="' + attch + '" ></td>';

                                                                        count++;
                                                                        if (count > 0)
                                                                        {
                                                                            document.getElementById("save1").disabled = false;
                                                                        }


                                                                        document.getElementById('contractTitle').disabled = true;
                                                                        document.getElementById('contractCategory').disabled = true;
                                                                        document.getElementById('contStartDate').disabled = true;
                                                                        document.getElementById('contEndDate').disabled = true;
                                                                        document.getElementById('contReviewDate').disabled = true;
                                                                        document.getElementById('contClassification').disabled = true;
                                                                        document.getElementById('contStatus').disabled = true;
                                                                        document.getElementById('insuranceTagged').disabled = true;
                                                                        document.getElementById('remarks').disabled = true;
                                                                        document.getElementById('classificationId').disabled = true;
                                                                        document.getElementById('insuranceId').disabled = true;
                                                                        //document.getElementById('contraHardcoded').disabled = true;
                                                                        document.getElementById('insuranceId').disabled = true;
                                                                        document.getElementById('classificationId').disabled = true;
//                                                                          

                                                                    }
                                                                }


                                                            }
                                                        }

                                                        function removeRow(id) {

                                                            count--;
                                                            if (count == 0)
                                                            {
                                                                document.getElementById("save1").disabled = true;

                                                                document.getElementById('contractTitle').disabled = false;
                                                                document.getElementById('contractCategory').disabled = false;
                                                                document.getElementById('contStartDate').disabled = false;
                                                                document.getElementById('contEndDate').disabled = false;
                                                                document.getElementById('contReviewDate').disabled = false;
                                                                document.getElementById('contClassification').disabled = false;
                                                                document.getElementById('contStatus').disabled = false;
                                                                document.getElementById('insuranceTagged').disabled = false;
                                                                document.getElementById('remarks').disabled = false;
                                                                document.getElementById('classificationId').disabled = false;
                                                                document.getElementById('insuranceId').disabled = false;
                                                                //document.getElementById('contraHardcoded').disabled = false;
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
                                                            alert(s);
                                                            if (s == "") {
                                                                //$('#sSavesnoedu').val(discount);
                                                                document.getElementById("deleteRows").value = discount;
                                                            } else {
                                                                $('#deleteRows').val(s + '//' + discount);
                                                            }

                                                            deleteRowedu(this);
                                                        });

                                                        function deleteRowedu(row) {
                                                            var rowCount = $('#resourcetable tr').length;
                                                            // alert(rowCount);
                                                            if (rowCount > 1) {

                                                                $(row).parents('.item-row').remove();
                                                                return true;
                                                            }
                                                            else {
                                                                alert("You cannot delete this row");
                                                            }
                                                            return false;
                                                        }
                                                    </script>
                                                </table> 
                                            </div>
                                        </div>
                                        <!--for edit-->    

                                        

                                        <div>    
                                            <c:if test="${ action eq 'view' }">
                                                <div class="clearfix"></div>
                                                
                                                <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                    <table id="membertable" class="table table-striped responsive-utilities jambo_table">
                                                        <thead>
                                                            <tr>
                                                                <th style="background:#425567;color:#fff;">Action</th>                                                           
                                                                <th style="background:#425567;color:#fff;"><span style="color: red">*</span>Contract Title</th>
                                                                <th style="background:#425567;color:#fff;"><span style="color: red">*</span>Start Date</th>
                                                                <th style="background:#425567;color:#fff;"><span style="color: red">*</span>End Date</th>    
                                                                <th style="background:#425567;color:#fff;"><span style="color: red">*</span>Contract Classification</th>
                                                                <th style="background:#425567;color:#fff;"><span style="color: red">*</span>Insurance Tagged</th>
                                                            </tr>

                                                        </thead>
                                                        <tbody id="resourcetable">

                                                            <c:forEach items="${contraEditList}" var="type">
                                                                <tr class="item-row"> 
                                                                    <td align="center" onclick=""><button type="button" id="deleteRowcert"><i class="fa fa-trash fa-lg-o"></i></button></td>    
                                                                    <td><input type="hidden" id="sno"  name="sno" value="${type[11]}"/>
                                                                        <input type="hidden" id="sno1"  name="sno1" value="${type[13]}"/>
                                                                        <input type="hidden" id="contractCode"  name="contractCode1" value="${type[6]}"/>
                                                                        <input class="form-control" style="text-align: left;width:200px;" name="contractTitle1" id="contractTitle" readonly="" autocomplete="off" type="text" maxlength="30" value="${type[5]}"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:200px;" name="contStartDate1" id="contStartDate" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type[10]}"/>"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:200px;" name="contEndDate1" id="contEndDate" readonly autocomplete="off" type="text" maxlength="30" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type[1]}"/>"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:200px;"  name="contClassification1" id="contClassification" readonly autocomplete="off" type="text" min="8" maxlength="11" value="${type[9]}">
                                                                        <input class="form-control" style="text-align: left;width:200px;"  name="classificationId1" id="classificationId" readonly autocomplete="off" type="hidden" min="8" maxlength="11" value="${type[0]}"></td>
                                                                    <td><input class="form-control" style="text-align: left;width:200px;" name="insuranceTagged1" id="insuranceTagged" readonly autocomplete="off" type="text" maxlength="30" value="${type[12]}">
                                                                        <input class="form-control" style="text-align: left;width:200px;" name="insuranceId1" id="insuranceId" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[7]}"></td>
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
                                        </c:forEach>
                                        <div class="col-md-12 col-sm-12">                                 
                                                <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                                <input type="hidden" name="count" value="1" />
                                            
                                                <c:forEach items="${attachment}" var="list">
                                                                    <div>
                                                                        <div id="field" class="col-md-12 col-sm-12">

                                                                            <a href="../contract/ContractAttachDownload.htm?SNo=${list.sno}"  >
                                                                                <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > 
                                                                            </a><br><br/>
                                                                        </div>
                                                                    </div>
                                                                </c:forEach>     
                                            
                                        </div>
                                            
                                            <table id="" class="table table-striped responsive-utilities jambo_table" style="">
                                                <thead >
                                                    <tr class="headings">     
                                                        <th >Role</th>
                                                        <!--                                                        <th >Name</th>-->
                                                        <th >Date</th>
                                                        <th >Remarks</th>
                                                    </tr>      
                                                </thead>        
                                                <tbody> 
                                                <c:forEach items="${approvList}" var="type">
                                                    <c:forEach items="${cont}" var="type1">
                                                        <c:if test="${type1.contractCode eq type[6]}">
                                                            <c:set var="approvar2Remark" value="${type1.approvar2Remark}"/>
                                                            <c:set var="approvar3Remark" value="${type1.approvar3Remark}"/>
                                                            <c:set var="userId" value="${type1.userId}"/> 
                                                            <c:set var="lastmodifiedDate" value="${type1.lastmodifiedDate}"/> 
                                                        </c:if>                                           
                                                    </c:forEach> 
                                                </c:forEach>


                                                <c:if test="${approvar2Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;" ><b>GFC</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar2Remark}</td>
                                                    </tr>
                                                </c:if> 
                                                <c:if test="${approvar3Remark ne null}">
                                                    <tr>
                                                        <td class="center" style="text-align: left;"><b>CFO</b></td>

                                                        <td class="center" style="text-align: left;"> <fmt:formatDate pattern="dd-MMM-yyyy" value="${lastmodifiedDate}" /></td>
                                                        <td class="center" style="text-align: left;">${approvar3Remark}</td>
                                                    </tr>
                                                </c:if> 

                                            </tbody>
                                        </table>

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
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

    </body>

</html>

