<%-- 
    Document   : insuranceDetailsForm
    Created on : 27 Jul, 2016, 4:55:03 PM
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

                        <title>Arete Iconic</title>
                        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>
        
       
    </head>


    <script>
        //method to validate unique category
        function test11() {
            var insuranceNo = document.getElementById("insuranceNo").value;
            //alert(insuranceNo);
            $.ajax
                    ({
                        type: "POST",
                        url: '../insurance/InsuranceAvailabilty.htm',
                        data: {
                            insuranceNo: insuranceNo
                        },
                        success: function (data) {

                            if ($.trim(data) == 'Already Exists.Enter another') {
                                alert("This Record Already Exist");

                                document.getElementById("insuranceNo").value = "";

                                return false;
                            }

                            //test12();
                        }


                    });
        }

        //Alphanumerics validations
        function isNumberKey3(evt) {
            debugger;
            var charCode = (evt.which) ? evt.which : event.keyCode;

            if (charCode > 32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode > 31 && (charCode < 48 || charCode > 57))
            {
                //                    alert("Please Enter Only Alphanumerics");
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
        //pop up to select company name
        function selectCompany() {

            myWindow = window.open("../insurance/insuComNamePopUp.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
        }

        function parent_disable() {
            if (myWindow && !myWindow.closed)
                myWindow.focus();
        }

        //date validation 
        function dateValid()
        {
            var loadingDate = document.getElementById("insValidFrom").value;
            //alert(loadingDate);
            var unloadingDate = document.getElementById("insValidTo").value;
            //alert(unloadingDate);
            var day = 1000 * 60 * 60 * 24;

            var loaddate = loadingDate.split("-");
            var unloaddate = unloadingDate.split("-");
            var ldateday = loaddate[1];
            var ldatemon = loaddate[0];
            var ldateyear = loaddate[2];

            var uldateday = unloaddate[1];
            var uldatemon = unloaddate[0];
            var uldateyear = unloaddate[2];
            var ldate = ldateday + '/' + ldatemon + '/' + ldateyear;
            var uldate = uldateday + '/' + uldatemon + '/' + uldateyear;
            var diff = ((new Date(uldate).getTime()) - (new Date(ldate).getTime())) / (1000 * 24 * 3600);
            if ((diff < 0)) {
                alert("To Date Should Be Greater Than From Date");
                document.getElementById("insValidTo").value = "";
                return false;
            }

            var months = Math.floor(diff / 30.4);
            var years = Math.floor(months / 12);
            var cterms = years + "year," + (months - 12 * years) + "months";

            if (diff > 0)
            {
                document.getElementById("insurTerm").value = cterms;

            }

        }

        function test()
        {
            var insno = document.getElementById("insuranceNo").value;
            var insno1 = document.getElementById("insuranceNo1").value;
            var insfor = document.getElementById("insuranceFor").value;
            var insfor1 = document.getElementById("insuranceFor1").value;
            var instype = document.getElementById("insuranceType").value;
            var instype1 = document.getElementById("insuranceType1").value;
            var remark = document.getElementById("remarks").value;
            var remark1 = document.getElementById("remarks1").value;

            if (document.getElementById("insuranceNo").value == "")
            {
                alert("Enter Insurance No");
                return false;
            }
            else if (document.getElementById("insuranceFor").value == "")
            {
                alert("Enter Insurance For");
                return false;
            } else if (document.getElementById("insuranceCompanyName").value == "")
            {
                alert("Enter Insurance Company");
                return false;
            } else if (document.getElementById("insValidFrom").value == "")
            {
                alert("Enter Insurance Valid From Date");
                return false;
            } else if (document.getElementById("insValidTo").value == "")
            {
                alert("Enter Insurance Valid To Date");
                return false;
            } else if (document.getElementById("insurTerm").value == "")
            {
                alert("Enter Insurance Term");
                return false;
            } else if (document.getElementById("insuranceType").value == "")
            {
                alert("Enter Insurance Type");
                return false;
            }
            else {

                if (insno !== insno1 || insfor !== insfor1 || instype !== instype1 || remark !== remark1) {
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

        }
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

        //        function test()
        //        {
        //            if (document.getElementById("insuranceNo").value == "")
        //            {
        //                alert("Enter Insurance No");
        //                return false;
        //            }
        //            else if (document.getElementById("insuranceFor").value == "")
        //            {
        //                alert("Enter Insurance For");
        //                return false;
        //            } else if (document.getElementById("insuranceCompanyName").value == "")
        //            {
        //                alert("Enter Insurance Company");
        //                return false;
        //            } else if (document.getElementById("insValidFrom").value == "")
        //            {
        //                alert("Enter Insurance Valid From Date");
        //                return false;
        //            } else if (document.getElementById("insValidTo").value == "")
        //            {
        //                alert("Enter Insurance Valid To Date");
        //                return false;
        //            } else if (document.getElementById("insurTerm").value == "")
        //            {
        //                alert("Enter Insurance Term");
        //                return false;
        //            } else if (document.getElementById("insuranceType").value == "")
        //            {
        //                alert("Enter Insurance Type");
        //                return false;
        //            } else {
        //                if (confirm('Do you really want to Save this updated record')) {
        //                    document.forms["userform"].submit();
        //                    return true;
        //                } else {
        //                    return false;
        //                }
        //
        //            }
        //
        //        }

    </script>



    <body class="nav-md">
                        <jsp:include page="../login/menu.htm" />

                        <jsp:include page="../login/footer.jsp" />

                        <main id="main" class="main">
                            <div class="mt-3">
                                <jsp:include page="../login/headerlink.htm?submodule=Insurance Details&tab=Insurance Creation&pagetype=form"/>
                            </div>
                            <div class="pagetitle">

                            </div><!-- End Page Title -->
                            <section class="section">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="card">
                                            <div class="card-body">
                                                <div class="card-title">
                                                    <h5>Insurance Creation Details</h5>
                                                </div>

                                
                                    <form id="userform" class="row" action="../insurance/insuranceDetailsFormSubmit.htm" method="post" enctype="multipart/form-data">
                                        <c:choose>
                                            <c:when test="${fn:length(insurance) > 0}">
                                                <c:forEach items="${insurance}" var="list">
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
                                                                    var textFields = document.getElementsByTagName('textarea')
                                                                    for (i = 0; i < textFields.length; i++)
                                                                    {
                                                                        debugger;
                                                                        if (!(textFields[i].readOnly)) {
                                                                            //console.log("ss" +readOnlyAttr);
                                                                            //$(textFields[i]).css("border-color", "red");
                                                                            $(textFields[i]).focus(function () {
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
                                            <c:if test="${list[0] eq '15'}">
                                                <c:set value="${list[1]}" var="field_15"/>
                                                <c:set value="${list[2]}" var="fieldStatus_15"/>
                                                <c:set value="${list[3]}" var="mand_status_15"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '16'}">
                                                <c:set value="${list[1]}" var="field_16"/>
                                                <c:set value="${list[2]}" var="fieldStatus_16"/>
                                                <c:set value="${list[3]}" var="mand_status_16"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '17'}">
                                                <c:set value="${list[1]}" var="field_17"/>
                                                <c:set value="${list[2]}" var="fieldStatus_17"/>
                                                <c:set value="${list[3]}" var="mand_status_17"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '18'}">
                                                <c:set value="${list[1]}" var="field_18"/>
                                                <c:set value="${list[2]}" var="fieldStatus_18"/>
                                                <c:set value="${list[3]}" var="mand_status_18"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '19'}">
                                                <c:set value="${list[1]}" var="field_19"/>
                                                <c:set value="${list[2]}" var="fieldStatus_19"/>
                                                <c:set value="${list[3]}" var="mand_status_19"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '20'}">
                                                <c:set value="${list[1]}" var="field_20"/>
                                                <c:set value="${list[2]}" var="fieldStatus_20"/>
                                                <c:set value="${list[3]}" var="mand_status_20"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '21'}">
                                                <c:set value="${list[1]}" var="field_21"/>
                                                <c:set value="${list[2]}" var="fieldStatus_21"/>
                                                <c:set value="${list[3]}" var="mand_status_21"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '290'}">
                                                <c:set value="${list[1]}" var="field_290"/>
                                                <c:set value="${list[2]}" var="fieldStatus_290"/>
                                                <c:set value="${list[3]}" var="mand_status_290"/>
                                            </c:if>
                                            <c:if test="${list[0] eq '602'}">
                                                <c:set value="${list[1]}" var="field_602"/>
                                                <c:set value="${list[2]}" var="fieldStatus_602"/>
                                                <c:set value="${list[3]}" var="mand_status_602"/>
                                            </c:if>

                                            <c:if test="${list[0] eq '855'}">
                                                <c:set value="${list[1]}" var="field_855"/>
                                                <c:set value="${list[2]}" var="fieldStatus_855"/>
                                                <c:set value="${list[3]}" var="mand_status_855"/>
                                            </c:if>

                                        </c:forEach> 

                                        <c:if test="${fieldStatus_15 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                            
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="hidden" placeholder="" class="form-control"  name="insuranceId" id="insuranceId" value="${list.insuranceId}">
                                                                    <input type="text" class="form-control" ${mand_status_15} autocomplete="off" id="insuranceNo"  name="insuranceNo" maxlength="20" value="${list.insuranceNo}" onchange="test11();" onkeypress="return isNumberKey(event)">
                                                                    <input type="hidden" class="form-control" ${mand_status_15} autocomplete="off" id="insuranceNo1"  name="insuranceNo1" maxlength="20" value="${list.insuranceNo}" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_15} readonly="" name="insuranceNo" maxlength="20" value="${list.insuranceNo}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>  
                                                        <input type="text" placeholder='fill' class="form-control"${mand_status_15}  autocomplete="off"  name="insuranceNo" id="insuranceNo" maxlength="20" value=""  onchange="test11();" onkeypress="return isNumberKey(event)">
                                                        <input type="hidden"  class="" readonly=""  name="insuranceId" value=""> 
                                                    </c:otherwise>        
                                                </c:choose>
                                            
                                                <label class="control-label">  <c:if test="${mand_status_15 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> ${field_15}</label>
                                            </div>
                                        </c:if>
                                        <!--///Newly Added By Lakshmi-->
                                        <c:if test="${fieldStatus_855 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                              
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="hidden" class="form-control" ${mand_status_855}  name="insuranceCategory" id="insuranceCategory" value="${list.insuranceCategory}" >

                                                                    <select id="insuranceCategory" name="insuranceCategory" ${mand_status_855} class="form-control validate[required]">
                                                                        <option selected>${list.insuranceCategory}</option>
                                                                        <option>Property</option>
                                                                        <option>Asset</option>
                                                                    </select> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" readonly="" id="insuranceCategory" value="${list.insuranceCategory}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <select id="insuranceCategory" name="insuranceCategory" ${mand_status_855} class="form-select validate[required]">
                                                            <option value="" disabled selected>Select your option</option>
                                                            <option>Property</option>
                                                            <option>Asset</option>
                                                        </select> 
                                                    </c:otherwise>        
                                                </c:choose>
 
                                                <label class="control-label"> <c:if test="${mand_status_855 eq 'required'}">
                                                    <a  style="color:red;">*</a>
                                                </c:if> ${field_855}</label>
                                            </div>
                                        </c:if>
                                        <!--//////-->
                                        <c:if test="${fieldStatus_16 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                                                                    
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">

                                                                    <input type="text" class="form-control" ${mand_status_16}  name="insuranceFor" id="insuranceFor" maxlength="50" value="${list.insuranceFor}" >
                                                                    <input type="hidden" class="form-control" ${mand_status_16}  name="insuranceFor1" id="insuranceFor1" maxlength="50" value="${list.insuranceFor}">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control" ${mand_status_16} readonly="" name="insuranceFor" maxlength="50" value="${list.insuranceFor}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="fill" class="form-control" ${mand_status_16} name="insuranceFor" id="insuranceFor" maxlength="50">
                                                    </c:otherwise>        
                                                </c:choose>

                                                <label class="control-label">  <c:if test="${mand_status_16 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> ${field_16}</label>    
                                            </div>
                                        </c:if>
                                     
                                        <c:if test="${fieldStatus_17 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                                                                      
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(compId) > 0}">
                                                        <c:forEach items="${compId}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_17} id="insuranceCompanyName" readonly=""  onclick="selectCompany();" style="cursor: pointer;resize: none;" name="insuranceCompanyName" value="${list[0]}">

                                                                    <input type="hidden" placeholder="" class="form-control"  id="insuranceDesc" name="insuranceDesc">
                                                                    <input type="hidden"  class="form-control" readonly=""  name="insuranceCompId" id="insuranceCompId"  value="${list[1]}">  

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" ${mand_status_17} id="insuranceCompanyName"  readonly=""  style="cursor: pointer;resize: none;" name="insuranceCompanyName" value="${list[0]}">

                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
<!--                                                        <textarea name="insuranceCompanyName" id="insuranceCompanyName" class="form-control" ${mand_status_17} Placeholder="Click to select Company Name"  style="cursor: pointer;resize: none;" readonly="" onclick="selectCompany();" rows="1" style="resize: none"></textarea>-->
                                                        <input type="text"  class="form-control" ${mand_status_17} id="insuranceCompanyName" required="" readonly Placeholder="Select Company Name" onclick="selectCompany();" style="cursor: pointer;resize: none;" name="insuranceCompanyName">
                                                        <input type="hidden" placeholder="" class=""  id="insuranceDesc" name="insuranceDesc">
                                                        <input type="hidden"  class="" readonly=""  name="insuranceCompId" id="insuranceCompId"  value="">  
                                                    </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label "> <c:if test="${mand_status_17 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>    ${field_17}</label>
                                            </div>

                                        </c:if>

                                        <c:if test="${fieldStatus_18 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3 pick1">
                                               
                                                

                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="status" type="hidden" value="${type.status}">
                                                                    <input class="form-control  input-xlarge  datepicker1" ${mand_status_18} name="insValidFrom" id="insValidFrom" readonly="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.insValidFrom}"/>" onchange="dateValid();"onkeypress="firstToUpperCase1(event);" > 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_18} readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.insValidFrom}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge datepicker1" ${mand_status_18} id="insValidFrom" readonly name="insValidFrom" placeholder="Select Date" required="" type="text" onchange="dateValid();"  onchange="dateValid();" onkeypress="firstToUpperCase1(event);">                                                    
                                                    </c:otherwise>        
                                                </c:choose>
                                                        <label class="control-label" for="selectError"> <c:if test="${mand_status_18 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>  ${field_18}</label>
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_19 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3 pick2">
                                              
                                               

                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="type">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control  input-xlarge datepicker2" ${mand_status_19} name="insValidTo" readonly="" id="insValidTo" required="" type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.insValidTo}"/>" onchange="dateValid();"> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_19} readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${type.insValidTo}"/>">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input class="form-control  input-xlarge datepicker2" ${mand_status_19} id="insValidTo" readonly name="insValidTo" placeholder="Select Date"  type="text" onchange="dateValid();" > </c:otherwise>        
                                                </c:choose>
                                                         <label class="control-label" for="selectError">  <c:if test="${mand_status_19 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if>  ${field_19}</label>
                                            </div>
                                        </c:if>
                                      
                                        <c:if test="${fieldStatus_602 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                              
                                                                                       
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_602} readonly="" id="insurTerm" name="insurTerm" value="${list.insurTerm}">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_602} readonly="" name="insurTerm" value="${list.insurTerm}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder='fill' class="form-control" ${mand_status_602}  id="insurTerm" name="insurTerm" readonly="">
                                                    </c:otherwise>        
                                                </c:choose>
 <label class="control-label">  <c:if test="${mand_status_602 eq 'required'}">
                                                    <a class="control-label-required"style="color:red;">*</a>  
                                                </c:if> ${field_602}</label>  
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_290 eq 'y'}">
                                            <div class="col-md-4 form-floating mb-3">
                                               
                                                                                     
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">

                                                                    <input type="text" class="form-control" ${mand_status_290} id="insuranceType" name="insuranceType" maxlength="50" value="${list.insuranceType}">
                                                                    <input type="hidden" class="form-control" ${mand_status_290} id="insuranceType1" name="insuranceType1" maxlength="50" value="${list.insuranceType}">
                                                                </c:when>
                                                                <c:otherwise>

                                                                    <input type="text" class="form-control" ${mand_status_290} readonly="" name="insuranceType" maxlength="50" value="${list.insuranceType}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>                                                    
                                                        <input type="text" placeholder="fill" class="form-control text-capitalize" ${mand_status_290} id="insuranceType" name="insuranceType" maxlength="50">
                                                    </c:otherwise>        
                                                </c:choose>
  <label class="control-label"> <c:if test="${mand_status_290 eq 'required'}">
                                                    <a style="font-size: 15px;color:red;font-weight: bold;">*</a>
                                                </c:if> ${field_290}</label>   
                                            </div>
                                        </c:if>

                                        <div class="col-md-4 form-floating mb-3">
                                          
                                            <c:choose>
                                                <c:when test="${fn:length(insurance) > 0}">
                                                    <c:forEach items="${insurance}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input type="text" class="form-control"  id="insuredAmount" name="insuredAmount" maxlength="50" value="${list.insuredAmount}" onkeypress="return isNumberKey(event)">
                                                                <input type="hidden" class="form-control"  id="insuredAmount" name="insuredAmount" maxlength="50" value="${list.insuredAmount}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" name="insuredAmount" maxlength="50" value="${list.insuredAmount}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="fill" class="form-control" id="insuredAmount" name="insuredAmount" maxlength="50" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
  <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Insured Amount For Property</label>
                                        </div>
              

                                        <div class="col-md-4 form-floating mb-3">
                                           
                                            <c:choose>
                                                <c:when test="${fn:length(insurance) > 0}">
                                                    <c:forEach items="${insurance}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <input type="text" class="form-control"  id="premiumAmount" name="premiumAmount" maxlength="50" value="${list.premiumAmount}" onkeypress="return isNumberKey(event)">
                                                                <input type="hidden" class="form-control"  id="premiumAmount" name="premiumAmount" maxlength="50" value="${list.premiumAmount}">
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" name="premiumAmount" maxlength="50" value="${list.premiumAmount}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <input type="text" placeholder="fill" class="form-control" id="premiumAmount" name="premiumAmount" maxlength="50" onkeypress="return isNumberKey(event)">
                                                </c:otherwise>        
                                            </c:choose>
 <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Premium Amount</label>
                                        </div>
                                        <div class="col-md-4 form-floating mb-3">
                                         
                                            <c:choose>
                                                <c:when test="${fn:length(insurance) > 0}">
                                                    <c:forEach items="${insurance}" var="list">
                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">

                                                                <select class="form-control"  autocomplete="off" name="frequency" id="frequency" required="">
                                                                    <option selected="" value="${list.frequency}">${list.frequency}</option>
                                                                    <option  disabled="">Select Your Option</option>
                                                                    <option value="Monthly">Monthly</option>
                                                                    <option value="Quarterly">Quarterly</option>
                                                                    <option value="Half Yearly">Half Yearly</option>
                                                                    <option value="Yearly">Yearly</option>


                                                                </select>
                                                            </c:when>
                                                            <c:otherwise>

                                                                <input type="text" class="form-control" readonly="" name="frequency" maxlength="50" value="${list.frequency}">
                                                            </c:otherwise> 
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <select class="form-select"  autocomplete="off" name="frequency" id="frequency" required="">
                                                        <option selected="" disabled="">Select Your Option</option>
                                                        <!--                                                        <option value="days">Monthly</option>
                                                                                                                <option value="weeks">Quarterly</option>
                                                                                                                <option value="months">Half Yearly</option>
                                                                                                                <option value="Years">Yearly</option>-->
                                                        <option value="Monthly">Monthly</option>
                                                        <option value="Quarterly">Quarterly</option>
                                                        <option value="Half Yearly">Half Yearly</option>
                                                        <option value="Years">Yearly</option>

                                                    </select>
                                                </c:otherwise>        
                                            </c:choose>
   <label class="control-label"><span style="font-size: 15px;color:red;font-weight: bold;">*</span>Frequency</label>
                                        </div>

                                        <c:if test="${fieldStatus_20 eq 'y'}">
                                            <div class="col-md-4 form-floating mt-1"> 
                                                                                     
                                                <c:choose>
                                                    <c:when test="${fn:length(insurance) > 0}">
                                                        <c:forEach items="${insurance}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input name="pk" type="hidden" value="${list.sno}">
                                                                    <textarea name="remarks" placeholder="Fill" id="remarks" class="form-control"  rows="1" maxlength="300" style="resize: none">${list.remarks}</textarea>
                                                                    <input id="remarks1" placeholder="Fill" class="form-control"  rows="1" maxlength="300" style="resize: none" type="hidden" value="${list.remarks}">

                                                                </c:when>
                                                                <c:otherwise>
                                                                    <textarea readonly="" placeholder="Fill" class="form-control"  name="remarks" rows="1" maxlength="300" style="resize: none">${list.remarks}</textarea>
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <textarea name="remarks" placeholder="Fill" class="form-control" maxlength="300" rows="1" style="resize: none"></textarea>
                                                    </c:otherwise>        
                                                </c:choose>
                                            <a style="font-size: 15px;color:transparent;font-weight: bold;">*</a>
                                                <label class="control-label">${field_20}</label>     
                                            </div>
                                        </c:if>

                                      
                                        <div class="col-md-12 col-sm-12 mb-3">                                 
                                            <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>
                                            <input type="hidden" name="count" value="1" />
                                            <c:choose>
                                                <c:when test="${fn:length(insurance) > 0}">
                                                    <c:forEach items="${insurance}" var="list">

                                                        <c:choose>
                                                            <c:when test="${action eq 'edit'}">   
                                                                <c:set var="i" value="1"/> 
                                                                <c:forEach items="${attachment}" var="list1">


                                                                    <div class="removeattach" id="del${i}">
                                                                        <div id="field" class="col-md-12 col-sm-12">
                                                                            <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                                            <a href="../insurance/AttachDownload.htm?SNo=${list1.sno}"  >
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

                                                                            <a href="../insurance/AttachDownload.htm?SNo=${list.sno}"  >
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
                                                    <div class='row'>
                                                        <div id="adiv1"  class="col-md-4 col-sm-12">
                                                            <div class="input-group mb-3">
                                                                 <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" >
                                                            <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                            <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                                    setAttachName(1);"> 
                                                                <div class='input-group-text py-0 ps-0 pe-2' style="align-items: end; background: none; border: none;">
                                                                 <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                                
                                                                </div>
                                                             <div class="my-auto">
                                                                      <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-sm btn-danger remove-me1">-</button>
                                                        <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn btn-sm btn-primary add-more" type="button">+</button>
                                                       
                                                                 </div>
                                                            </div>
                                                           
                                                           
                                                            <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                        </div>
                                                          <span class="nowrap">(Click press + to add another attachment)</span>
                                                    </div>                                                
                                                </c:otherwise>        
                                            </c:choose>
                                        </div>

                                    
                                        <c:if test="${action ne 'view' && action ne 'edit'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                                <button type="submit" class="btn btn-primary" style="" >Save</button>
                                                <a href="../insurance/insuranceDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>

                                        <c:if test="${action eq 'edit'  }">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4 mt-3">
                                                <button type="button" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                                <a href="../insurance/insuranceDetailsList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>
                                    </form>
                               </div>
                                    </div>

                                </div>
                                </div>
                            </section>

                        </main><!-- End #main -->

                        
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
                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 mb-3 col-sm-12 "><div class="input-group mb-3"><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><div class="input-group-text py-0 ps-0 pe-2" style="align-items: end; background: none; border: none;"><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /></div><div class="d-flex align-items-end"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger btn-sm remove-me">-</button></div><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div></div></div>';
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
            
                 $('.datepicker1').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick1'
                }).datepicker('update', new Date());
                
                     $('.datepicker2').datepicker({
                    format: 'dd-mm-yyyy',
                    startDate: '0m +0m',
                    autoclose: true,
                    todayHighlight: true,
                   
                    container: '.pick2'
                }).datepicker('update', new Date());
        </script>
      
         <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
        <script src="../CRM/scripts/general-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/general-sales_scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-menu-scripts.js" type="text/javascript"></script>
        <script src="../CRM/scripts/mioinvoice-sales-scripts.js" type="text/javascript"></script>

        <script src="../master/scripts/general-attach-script.js" type="text/javascript"></script>
        <script src="../master/scripts/mioinvoice-attach-script.js" type="text/javascript"></script>
    </body>

</html>