<%-- 
    Document   : assetDetailsForm
    Created on : Sep 15, 2016, 10:42:18 AM
    Author     : Kondal Reddy N
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
        <title>Arete Iconic</title>
        <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" integrity="sha512-gxWow8Mo6q6pLa1XH/CcH8JyiSDEtiwJV78E+D+QP0EVasFs8wKXq16G8CLD4CJ2SnonHr4Lm/yY2fSI2+cbmw==" crossorigin="anonymous" />
		</head>
    
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               
             <jsp:include page="../login/footer.jsp"/>
                   
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Landlord Details&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Landlord Details</h5></div>
                <form class="row" id="landlordDetail" action="../master/landLordDetailsFormSubmit.htm" method="post" enctype="multipart/form-data">
                    <c:choose>
                        <c:when test="${fn:length(landLord) > 0}">
                            <c:forEach items="${landLord}" var="list">
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
                    <c:forEach items="${test}" var="list">
                        <c:if test="${list[0] eq '22'}">
                            <c:set value="${list[1]}" var="field_1"/>
                            <c:set value="${list[2]}" var="fieldStatus_1"/>
                            <c:set value="${list[3]}" var="mand_status_1"/>
                        </c:if>
                        <c:if test="${list[0] eq '23'}">
                            <c:set value="${list[1]}" var="field_2"/>
                            <c:set value="${list[2]}" var="fieldStatus_2"/>
                            <c:set value="${list[3]}" var="mand_status_2"/>
                        </c:if>
                        <c:if test="${list[0] eq '24'}">
                            <c:set value="${list[1]}" var="field_3"/>
                            <c:set value="${list[2]}" var="fieldStatus_3"/>
                            <c:set value="${list[3]}" var="mand_status_3"/>
                        </c:if>
                        <c:if test="${list[0] eq '25'}">
                            <c:set value="${list[1]}" var="field_4"/>
                            <c:set value="${list[2]}" var="fieldStatus_4"/>
                            <c:set value="${list[3]}" var="mand_status_4"/>
                        </c:if>
                        <c:if test="${list[0] eq '26'}">
                            <c:set value="${list[1]}" var="field_5"/>
                            <c:set value="${list[2]}" var="fieldStatus_5"/>
                            <c:set value="${list[3]}" var="mand_status_5"/>
                        </c:if>
                        <c:if test="${list[0] eq '27'}">
                            <c:set value="${list[1]}" var="field_6"/>
                            <c:set value="${list[2]}" var="fieldStatus_6"/>
                            <c:set value="${list[3]}" var="mand_status_6"/>
                        </c:if>
                        <c:if test="${list[0] eq '242'}">
                            <c:set value="${list[1]}" var="field_7"/>
                            <c:set value="${list[2]}" var="fieldStatus_7"/>
                            <c:set value="${list[3]}" var="mand_status_7"/>
                        </c:if>
                        <c:if test="${list[0] eq '243'}">
                            <c:set value="${list[1]}" var="field_8"/>
                            <c:set value="${list[2]}" var="fieldStatus_8"/>
                            <c:set value="${list[3]}" var="mand_status_8"/>
                        </c:if>
                        <c:if test="${list[0] eq '244'}">
                            <c:set value="${list[1]}" var="field_9"/>
                            <c:set value="${list[2]}" var="fieldStatus_9"/>
                            <c:set value="${list[3]}" var="mand_status_9"/>
                        </c:if>
                        <c:if test="${list[0] eq '245'}">
                            <c:set value="${list[1]}" var="field_10"/>
                            <c:set value="${list[2]}" var="fieldStatus_10"/>
                            <c:set value="${list[3]}" var="mand_status_10"/>
                        </c:if>
                        <c:if test="${list[0] eq '246'}">
                            <c:set value="${list[1]}" var="field_11"/>
                            <c:set value="${list[2]}" var="fieldStatus_11"/>
                            <c:set value="${list[3]}" var="mand_status_11"/>
                        </c:if>
                        <c:if test="${list[0] eq '703'}">
                            <c:set value="${list[1]}" var="field_12"/>
                            <c:set value="${list[2]}" var="fieldStatus_12"/>
                            <c:set value="${list[3]}" var="mand_status_12"/>
                        </c:if>
                        <c:if test="${list[0] eq '704'}">
                            <c:set value="${list[1]}" var="field_13"/>
                            <c:set value="${list[2]}" var="fieldStatus_13"/>
                            <c:set value="${list[3]}" var="mand_status_13"/>
                        </c:if> 
                        <c:if test="${list[0] eq '857'}">
                            <c:set value="${list[1]}" var="field_14"/>
                            <c:set value="${list[2]}" var="fieldStatus_14"/>
                            <c:set value="${list[3]}" var="mand_status_14"/>
                        </c:if>

                    </c:forEach> 
                    <!--<div class="col-md-4 form-floating">-->
<!--                    <input type="text" placeholder="Fill" class="form-control"  value="${type.landlordId}" id="landlordid" name="landlordid" maxlength="35" readonly="">
                    <label class="control-label">Landlord ID</label>-->
                                         
                                        
                    <c:if test="${fieldStatus_14 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_14} name="landlordId" id="landlordId" value="${list.landlordId}" maxlength="50" readonly="">
                                                <input type="hidden" class="form-control" ${mand_status_14} name="landlordId1" id="landlordId1" value="${list.landlordId}" maxlength="50" >
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="landlordId" value="${list.landlordId}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_14} value="${landlordNo}" name="landlordId" readonly="" id="landlordId" maxlength="50" >
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_14}
                            <c:if test="${mand_status_14 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>                          
                    <!--</div>-->                          
                    
                    <c:if test="${fieldStatus_1 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:set var="llId" value="${list.landlordId}"></c:set>
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="hidden" id="pk" name="pk" value="${list.sno}">
                                                   <select id="landlordCategory" name="landlordCategory"  ${mand_status_1}  class="form-control validate[required]">
                                                       <!--<option>${list.landlordCategory}</option>-->
                                                       <option disabled="" value="">Select your option</option>
                                                       <c:forEach items="${Dropdown}" var="list">
                                                           <c:if test="${list[0] eq 'F-06'}">
                                                               <option>${list[1]}</option>                                     
                                                           </c:if>
                                                       </c:forEach>
                                                   </select>  
                                                <!--<input type="text" class="form-control" ${mand_status_1} readonly="" name="landlordCategory" value="${list.landlordCategory}" maxlength="50" onkeypress="return isNumberKey4(event)">-->
                                                <input type="hidden" class="form-control" ${mand_status_1} readonly="" name="landlordCategory1" id="landlordCategory1" value="${list.landlordCategory}" maxlength="50" >
                                                <input type="hidden" name="pk" value="${list.sno}">
                                                <input type="hidden" name="status" value="${list.status}">
                                                <input type="hidden" name="landlordId" value="${list.landlordId}">
                                                <input type="hidden" name="creationDate" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.creationDate}"/>">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" value="${list.landlordCategory}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <select id="landlordCategory" name="landlordCategory" ${mand_status_1} class="form-select">
                                        <option value="" disabled="" selected>Select your option</option>
                                        <c:forEach items="${Dropdown}" var="list">
                                            <c:if test="${list[0] eq 'F-06'}">
                                                <option>${list[1]}</option>                                     
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_1}
                            <c:if test="${mand_status_1 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_2 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_2} name="landlordName" id="landlordName" value="${list.landlordName}" maxlength="50" onkeypress="return isNumberKey4(event)" onchange="fetchllName();">
                                                <input type="hidden" class="form-control" ${mand_status_2} name="landlordName1" id="landlordName1" value="${list.landlordName}" maxlength="50" >
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="landlordName" value="${list.landlordName}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_2} value="" name="landlordName"  id="landlordName" maxlength="50" onkeypress="return isNumberKey4(event)" onchange="fetchllName();">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_2}
                            <c:if test="${mand_status_2 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_3 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <div>${field_3}
                            <c:if test="${mand_status_3 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="tel" class="form-control" ${mand_status_3} name="landlordContactno" id="landlordContactno" value="${list.landlordContactno}" maxlength="15" onkeypress="return isNumberKey(event)" onchange="fetchllCono();">
                                                <input type="hidden" class="form-control" ${mand_status_3} name="landlordContactno1" id="landlordContactno1" value="${list.landlordContactno}" maxlength="11" >
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" readonly="" value="${list.landlordContactno}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="tel" class="form-control" ${mand_status_3} value="" id="landlordContactno" name="landlordContactno" maxlength="15" onkeypress="return isNumberKey(event)" onchange="fetchllCono();">
                                </c:otherwise>        
                            </c:choose>
                            
                        </div>
                    </c:if>
                        
                    <c:if test="${fieldStatus_4 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            <div> ${field_4}
                            <c:if test="${mand_status_4 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="tel" class="form-control" ${mand_status_4} id="landlordWorkContactno" name="landlordWorkContactno" value="${list.landlordWorkContactno}" maxlength="15" onkeypress="return isNumberKey(event)" onchange="fetchllWcono();">
                                                <input type="hidden" class="form-control" ${mand_status_4} id="landlordWorkContactno1" name="landlordWorkContactno1" value="${list.landlordWorkContactno}" maxlength="11" >
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" readonly="" value="${list.landlordWorkContactno}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="tel" class="form-control" ${mand_status_4} value="" id="landlordWorkContactno" name="landlordWorkContactno" maxlength="15" onkeypress="return isNumberKey(event)" onchange="fetchllWcono();">
                                </c:otherwise>        
                            </c:choose>
                            
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_5 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_5} id="landlordEmailid" name="landlordEmailid" value="${list.landlordEmailid}" maxlength="35" onchange="return validateEmail(this);">
                                                <input type="hidden" class="form-control" ${mand_status_5} id="landlordEmailid1" name="landlordEmailid1" value="${list.landlordEmailid}" maxlength="35">
                                            </c:when>
                                            <c:otherwise>

                                                <input type="text" class="form-control" readonly="" id="landlordEmailid" value="${list.landlordEmailid}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_5} value="" id="landlordEmailid" name="landlordEmailid" maxlength="35" onchange="return validateEmail(this);">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">Email ID
                            <c:if test="${mand_status_5 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if>
                    
                    <c:if test="${fieldStatus_7 eq 'y'}">
                        <div class="col-md-4 form-floating mb-3">
                            
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_7} id="crIdNo" maxlength="15" name="crIdNo" value="${list.crIdNo}" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                                <input type="hidden" class="form-control" ${mand_status_7} id="crIdNo1" maxlength="15" name="crIdNo1" value="${list.crIdNo}" >
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="crIdNo" value="${list.crIdNo}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_7} name="crIdNo" id="crIdNo" maxlength="15" onkeypress="return isNumberKey3(event)" onchange="fetchCrno();">
                                </c:otherwise>        
                            </c:choose>
                            <label class="control-label">${field_7}
                            <c:if test="${mand_status_7 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            </label>
                        </div>
                    </c:if> 

                        <div class="col-md-12 col-sm-12">                                 
                            
                            <input type="hidden" name="count" value="1" />
                        <c:choose>
                            <c:when test="${fn:length(landLord) > 0}">
                                <c:forEach items="${landLord}" var="list">

                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">   
                                            <c:set var="i" value="1"/> 
                                            <c:forEach items="${landLordAttach}" var="list">


                                                <div class="row removeattach" id="del${i}">
                                                    <div id="field" class="col-md-4 col-sm-12">
                                                        <button type="button" style="display: inline!important;" id="r1${i}" class="btn btn-danger r1">-</button>
                                                        <a href="../master/landlordAttachDownload.htm?sno=${list.sno}"  >
                                                            <input type="text" id="imgtxt" name="imgtxt" readonly="" class="form-control capitalize " value="${list.filename}" > <span> </span>
                                                        </a>                                                                        
                                                        <input type="hidden" id="attsno${i}" name="attsno" value="${list.sno}">
                                                    </div>
                                                </div>

                                            </c:forEach>
                                            <c:set var="i" value="${i+1}"/>
                                            <input type="hidden" id="tobedel" name="tobedel" value="">
                                            <input type="hidden" name="count" value="1" />
                                            <div class="row">
                                                <div id="adiv1" class="col-md-4 mb-3 d-flex align-items-center">
                                                    <div class="input-group">
                                                    <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                                    <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                                    <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                            setAttachName(1);"> 
                                                    <div class="input-group-append">
                                                    <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                                    <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->

                                                </div>   </div>
                                             <div class="d-flex ms-1 flex-column">
                                              <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>

                                                <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn btn-primary add-more mt-1" type="button">+</button>
                                               
                                            </div>    </div> 
                                                 <span class="nowrap">(Click press + to add another attachment)</span>
  </div> 

                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${landLordAttach}" var="list">
                                                <div class="row">
                                                    <div id="field" class="col-md-4 col-sm-12">

                                                        <a href="../master/landlordAttachDownload.htm?sno=${list.sno}"  >
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
                                <div class="row">
                                    <div id="adiv1"  class="col-md-4 mb-3 d-flex align-items-center">
                                      <div class="input-group">
                                        <input style="display: inline!important;" class="form-control" type="text" id="attachname1" name="documentname"  class="form-control" maxlength="20" value="" placeholder="Attachment Name" >
                                        <!--<input style="display: inline!important;" id="field1" name="attachments" type="file" value="" onchange="readURL1(this);">-->
                                        <input style="display: none;" id="field1" class="filecls" name="attachments" type="file"  value="" onchange="readURL1(this);
                                                setAttachName(1);"> 
                                            <div class="input-group-append">
                                            
                                     
                                        <input type="button" id="btnb1" class="btn btn-primary" value="Browse..." onclick="browseFile(1);" />
                                        
                                            </div>   <!--<span id="error7" style="color: red; font: bold; display: none; text-align: right;margin-left: 160px;">Please enter Atleast One Attachment....</span>-->
                                     
                                    </div>
                                          <div class="d-flex ms-1 flex-column">
                                       <button type="button" style="display: inline!important;opacity: 0.65;cursor: not-allowed;" id="1remove" class="btn btn-danger remove-me1">-</button>

                                       <button style="display: inline!important;color: white;font-weight: bold;" id="b1" class="btn btn-primary add-more mt-1" type="button">+</button>

                                        </div>
                                    </div>
                                    <span class="nowrap">(Click press + to add another attachment)</span>
                                </div>                                                </c:otherwise>        
                        </c:choose>
<!--                        <label class="control-label" ><span style="color:transparent"></span>Attachment(s)</label>-->
                    </div>

                    
                    <!--                                            <div class="x_title">
                                                                    <h2>Contact person 1</h2>                                        
                                                                    <div class="clearfix"></div>
                                                                </div>-->
                    <fieldset>

                        <div id="menuDiv">

                            <div class="x_panel">                                

                                <ul class="nav nav-pills mt-3 my-3">
                                    <li class="nav-item"><a class="nav-link active" href="#">Contact Person's Details </a></li>

                                </ul>


                                <div class="mb-3" style="height: auto;width: 100%;border: 1px solid grey;overflow-x: scroll;" >
                                    <table  class="table table-striped responsive-utilities jambo_table" id="enquirytable">
                                        <thead>
                                            <tr>                                
                                                <!--                                                                        <th><i class="fa fa-trash"></i></th>                                                -->
                                                <th>Person Name</th>
                                                <th>Contact Number </th>
                                                <th>Email ID</th>                                                               

                                            </tr>
                                        </thead>
                                        <tbody >                                                            
                                            <c:if test="${action eq null}">
                                                <tr class="item-enquiry">
                                                    <!--                                                                        <td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>-->
                                                    <td><input class="form-control" ${mand_status_7} autocomplete="off" name="personName1" id="personName1" type="text" value="" style=""></td>
                                                    <td><input class="form-control  right validate[]" autocomplete="off" maxlength="15" name="contactNumber1" id="contactNumber1" type="tel" value="" style="" onkeypress="isNumberKey(event)"></td>    
                                                    <td><input class="form-control  right validate[]" autocomplete="off" name="mailId1" id="mailId1" type="text" value="" style="" onblur="validateEmail(this)"></td>        
                                                </tr>

                                            </c:if>
                                            <c:if test="${action eq 'edit'}">
                                                <c:forEach items="${landLord}" var="item">


                                                    <tr class="item-enquiry">
                                                        <!--                                                                            <td align="center" onclick=""> </td>-->
                                                        <td><input class="form-control  right validate[]"  autocomplete="off" name="personName1" id="personName1" type="text" value="${item.personName1}" style="">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="personName11" id="personName11" type="hidden" value="${item.personName1}" style=""></td> 
                                                        <td><input class="form-control  right validate[]" maxlength="15" name="contactNumber1" id="contactNumber1" type="tel" value="${item.contactNumber1}" style="" onkeypress="isNumberKey(event)">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="contactNumber11" id="contactNumber11" type="hidden" value="${item.contactNumber1}" style=""></td>                                                                        
                                                        <td><input class="form-control  right validate[]" name="mailId1" id="mailId1" type="text" value="${item.mailId1}" style="" onblur="validateEmail(this)">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="mailId11" id="mailId11" type="hidden" value="${item.mailId1}" style=""></td>                                                                        
                                                    </tr>

                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${action eq 'view'}">
                                                <c:forEach items="${landLord}" var="item">

                                                    <tr class="item-enquiry">
                                                        <!--                                                                            <td align="center" onclick=""> </td>-->
                                                        <td><input class="form-control  right validate[]" name="personName1" id="personName1" type="text" value="${item.personName1}" readonly="" style=""></td> 
                                                        <td><input class="form-control  right validate[]" maxlength="10" name="contactNumber1" id="contactNumber1" type="text" value="${item.contactNumber1}" readonly="" style=""></td>                                                                        
                                                        <td><input class="form-control  right validate[]" name="mailId1" id="mailId1" type="text" value="${item.mailId1}" readonly="" style=""></td>                                                                        
                                                    </tr>
                                                </c:forEach>
                                            </c:if>        

                                        </tbody>
                                        <tbody >                                                            
                                            <c:if test="${action eq null}">
                                                <tr class="item-enquiry">
                                                    <!--                                                                        <td align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>-->
                                                    <td><input class="form-control  right validate[]" autocomplete="off" name="personName2" id="personName2" type="text" value="" style=""></td>
                                                    <td><input class="form-control  right validate[]" autocomplete="off" name="contactNumber2" id="contactNumber2" type="tel" maxlength="15" onkeypress="isNumberKey(event)" value="" style=""></td>    
                                                    <td><input class="form-control  right validate[]" autocomplete="off" name="mailId2" id="mailId2" type="text" value="" style="" onblur="validateEmail(this)"></td>        
                                                </tr>

                                            </c:if>
                                            <c:if test="${action eq 'edit'}">
                                                <c:forEach items="${landLord}" var="item">


                                                    <tr class="item-enquiry">
                                                        <!--                                                                            <td align="center" onclick=""> </td>-->
                                                        <td><input class="form-control  right validate[]"  autocomplete="off" name="personName2" id="personName2" type="text" value="${item.personName2}" style="">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="personName22" id="personName22" type="hidden" value="${item.personName2}" style=""></td> 
                                                        <td><input class="form-control  right validate[]" name="contactNumber2" id="contactNumber2" type="tel" onkeypress="isNumberKey(event)" value="${item.contactNumber2}" style="">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="contactNumber22" id="contactNumber22" type="hidden" value="${item.contactNumber2}" style=""></td>                                                                        
                                                        <td><input class="form-control  right validate[]" name="mailId2" id="mailId2" type="text" value="${item.mailId2}" style="" onblur="validateEmail(this)">
                                                            <input class="form-control  right validate[]"  autocomplete="off" name="mailId22" id="mailId22" type="hidden" value="${item.mailId2}" style=""></td>                                                                        
                                                    </tr>

                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${action eq 'view'}">
                                                <c:forEach items="${landLord}" var="item">

                                                    <tr class="item-enquiry">
                                                        <!--                                                                            <td align="center" onclick=""> </td>-->
                                                        <td><input class="form-control  right validate[]" name="personName2" id="personName2" type="text" value="${item.personName2}" readonly="" style=""></td> 
                                                        <td><input class="form-control  right validate[]" name="contactNumber2" id="contactNumber2" type="text" value="${item.contactNumber2}" readonly="" style=""></td>                                                                        
                                                        <td><input class="form-control  right validate[]" name="mailId2" id="mailId2" type="text" value="${item.mailId2}" readonly="" style=""></td>                                                                        
                                                    </tr>
                                                </c:forEach>
                                            </c:if>        

                                        </tbody>

                                    </table>

                                </div>                                                        
                                <div class="clearfix"></div>

                            </div>

                        </div>

                    </fieldset>                                         
                    <%--<c:if test="${fieldStatus_8 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_8 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            <label class="control-label">${field_8}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_8}  id="personName1" name="personName1" value="${list.personName1}">
                                                <input type="hidden" class="form-control" ${mand_status_8}  id="personName11" name="personName11" value="${list.personName1}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" value="${list.personName1}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_8} id="personName1" name="personName1">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>
                    <c:if test="${fieldStatus_9 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_9 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if><a style="color:transparent;">*</a>
                            <label class="control-label">${field_9}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_9} id="contactNumber1" name="contactNumber1" value="${list.contactNumber1}">
                                                <input type="hidden" class="form-control" ${mand_status_9} id="contactNumber11" name="contactNumber11" value="${list.contactNumber1}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="contactNumber1" value="${list.contactNumber1}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_9} id="contactNumber1" name="contactNumber1">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>
                    <c:if test="${fieldStatus_10 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_10 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if><a style="color:transparent;">*</a>
                            <label class="control-label">${field_10}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_10} id="mailId1" name="mailId1" value="${list.mailId1}">
                                                <input type="hidden" class="form-control" ${mand_status_10} id="mailId11" name="mailId11" value="${list.mailId1}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="mailId1" value="${list.mailId1}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_10} id="mailId1"  name="mailId1">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>
                        <p>&nbsp;</p>
                        <div class="x_title">
                            <h2>Contact person 2</h2>                                         
                            <div class="clearfix"></div>
                        </div>
                        <p>&nbsp;</p> 
                    <c:if test="${fieldStatus_11 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_11 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if>
                            <label class="control-label">${field_11}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_11} id="personName2"  name="personName2" value="${list.personName2}">
                                                <input type="hidden" class="form-control" ${mand_status_11} id="personName22"  name="personName22" value="${list.personName2}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="personName2" value="${list.personName2}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_11} id="personName2" name="personName2">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>
                    <c:if test="${fieldStatus_12 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_12 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if><a style="color:transparent;">*</a>
                            <label class="control-label">${field_12}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_12} id="contactNumber2"  name="contactNumber2" value="${list.contactNumber2}">
                                                <input type="hidden" class="form-control" ${mand_status_12} id="contactNumber22"  name="contactNumber22" value="${list.contactNumber2}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="contactNumber2" value="${list.contactNumber2}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_12} id="contactNumber2" name="contactNumber2">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>
                    <c:if test="${fieldStatus_13 eq 'y'}">
                        <div class="col-md-4 form-floating">
                            <c:if test="${mand_status_13 eq 'required'}">
                                <a style="color:red;">*</a>
                            </c:if><a style="color:transparent;">*</a>
                            <label class="control-label">${field_13}</label>
                            <c:choose>
                                <c:when test="${fn:length(landLord) > 0}">
                                    <c:forEach items="${landLord}" var="list">
                                        <c:choose>
                                            <c:when test="${action eq 'edit'}">
                                                <input type="text" class="form-control" ${mand_status_13} id="mailId2"  name="mailId2" value="${list.mailId2}">
                                                <input type="hidden" class="form-control" ${mand_status_13} id="mailId22"  name="mailId22" value="${list.mailId2}">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" readonly="" id="mailId2" value="${list.mailId2}">
                                            </c:otherwise> 
                                        </c:choose>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>                                                    
                                    <input type="text" placeholder="Fill" class="form-control" ${mand_status_13} id="mailId2" name="mailId2">
                                </c:otherwise>        
                            </c:choose>
                        </div></c:if>--%>                                          

                    <br/>
                    <c:if test="${action ne 'view'}">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                            <button type="submit" class="btn btn-primary" style="">Save</button>
                            <a href="../master/landLordDetailsList.htm" class="btn btn-danger">Cancel</a>
                        </div>
                    </c:if>

                    <c:if test="${action eq 'view'  }">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                            <a href="../master/landLordDetailsList.htm" class="btn btn-danger">Cancel</a>
                        </div>

                    </c:if>
                </form>   
            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->

    <script type="text/javascript">
            $(document).ready(function () {
                $("#landlordDetail").validationEngine();
                $("input").on("keypress", function (e) {

                    if (e.which === 32 && !this.value.length)
                        e.preventDefault();
                });
                $("#landlordContactno").change(function () {
                    var phone = $('input[name="landlordContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#landlordContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
                $("#landlordWorkContactno").change(function () {
                    var phone = $('input[name="landlordWorkContactno"]').val();
                    intRegex = /[0-9 -()+]+$/;
                    if ((phone.length < 8) || (!intRegex.test(phone)))
                    {
                        $('#landlordWorkContactno').val('');
                        alert('Please enter a valid phone number.');
                        return false;
                    }
                });
            });

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

            function fetchllName() {
                var landlordName = document.getElementById("landlordName").value;
                var landlordCategory = document.getElementById("landlordCategory").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchllName.htm',
                            data: {
                                landlordName: landlordName,
                                landlordCategory: landlordCategory
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("landlordName").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchllCono() {
                var landlordContactno = document.getElementById("landlordContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchllCono.htm',
                            data: {
                                landlordContactno: landlordContactno
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("landlordContactno").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchllWcono() {
                var landlordWorkContactno = document.getElementById("landlordWorkContactno").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchllWcono.htm',
                            data: {
                                landlordWorkContactno: landlordWorkContactno
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("landlordWorkContactno").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function fetchCrno() {
                var crIdNo = document.getElementById("crIdNo").value;
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchCrno.htm',
                            data: {
                                crIdNo: crIdNo
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("crIdNo").value = "";
                                    return false;
                                }
                            }
                        });
            }
            function validateEmail() {
                var landlordEmailid = document.getElementById("landlordEmailid").value;
                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                if (landlordEmailid.match(mailformat)) {
//                    return true;
                } else {
                    alert("You have entered an invalid email address!");
                    document.getElementById('landlordEmailid').value = "";
                }
                $.ajax
                        ({
                            type: "POST",
                            url: '../master/fetchllEmail.htm',
                            data: {
                                landlordEmailid: landlordEmailid
                            },
                            success: function (data) {
                                if ($.trim(data) == 'Already Exists.Enter another') {
                                    alert("This Record Already Exist");
                                    document.getElementById("landlordEmailid").value = "";
                                    return false;
                                }
                            }
                        });
            }

//            function test()
//            {
//                if (document.getElementById("landlordName").value == "")
//                {
//                    alert("Enter Landlord Name");
//                    return false;
//                }
//                else if (document.getElementById("crIdNo").value == "")
//                {
//                    alert("Enter crId No");
//                    return false;
//                } else if (document.getElementById("personName1").value == "")
//                {
//                    alert("Enter Person Name 1");
//                    return false;
//                } else if (document.getElementById("personName2").value == "")
//                {
//                    alert("Enter Person Name 2");
//                    return false;
//                } else {
//                    if (confirm('Do you really want to Save this updated record')) {
//                        document.forms["landlordDetail"].submit();
//                        return true;
//                    } else {
//                        return false;
//                    }
//
//                }
//
//            }

            function test()
            {
                var land = document.getElementById("landlordName").value;
                var land1 = document.getElementById("landlordName1").value;
                var landcon = document.getElementById("landlordContactno").value;
                var landcon1 = document.getElementById("landlordContactno1").value;
                var landworcon = document.getElementById("landlordWorkContactno").value;
                var landworcon1 = document.getElementById("landlordWorkContactno1").value;
                var landmail = document.getElementById("landlordEmailid").value;
                var landmail1 = document.getElementById("landlordEmailid1").value;
                var crno = document.getElementById("crIdNo").value;
                var crno1 = document.getElementById("crIdNo1").value;
                var per1 = document.getElementById("personName1").value;
                var per11 = document.getElementById("personName11").value;
                var cno1 = document.getElementById("contactNumber1").value;
                var cno11 = document.getElementById("contactNumber11").value;
                var mail1 = document.getElementById("mailId1").value;
                var mail11 = document.getElementById("mailId11").value;
                var per2 = document.getElementById("personName2").value;
                var per22 = document.getElementById("personName22").value;
                var cno2 = document.getElementById("contactNumber2").value;
                var cno22 = document.getElementById("contactNumber22").value;
                var mail2 = document.getElementById("mailId2").value;
                var mail22 = document.getElementById("mailId22").value;
                var lanlosd1 = document.getElementById("landlordCategory").value;
                
                if (document.getElementById("landlordCategory").value == "")
                {
                    alert("Enter Landlord Category");
                    return false;
                }
                else

                if (document.getElementById("landlordName").value == "")
                {
                    alert("Enter Landlord Name");
                    return false;
                }
                else if (document.getElementById("crIdNo").value == "")
                {
                    alert("Enter crId No");
                    return false;
                } else if (document.getElementById("personName1").value == "")
                {
                    alert("Enter Person Name");
                    return false;
                }
                else {

                    if (land !== land1 || landcon !== landcon1 || landworcon !== landworcon1 ||
                            landmail !== landmail1 || crno !== crno1 || per1 !== per11 ||
                            cno1 !== cno11 || mail1 !== mail11 || per2 !== per22 || cno2 !== cno22 || mail2 !== mail22) {
                        if (confirm('Do you really want to Save this updated record')) {
                            document.forms["landlordDetail"].submit();
                            return true;
                        } else {
                            return true;
                        }

                    } else {
                        document.forms["landlordDetail"].submit();
                    }
                }

            }

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
                var newIn = '<div id="adiv' + (next) + '" class="col-md-4 mb-3 d-flex align-items-center"><div class="input-group"><input style="display: inline!important;margin-left: 5px;margin-right: 3px;" class="form-control capitalize  validate[required]" id="attachname' + next + '" name="documentname" type="text" placeholder="Attachment Name" required=""><input style="display: none;"  id="field' + next + '" class="filecls" name="attachments" type="file" onchange="readURL1(this);setAttachName(\'' + next + '\');" ><div class="input-group-append"><input type="button" id="btnb' + next + '" class="btn btn-primary" value="Browse..." onclick="browseFile(\'' + next + '\');" /><p id="field' + next + 'Error" style="color: red; font: bold; display: none; text-align: right;">Upload your valid attachment</p></div></div> <div class="d-flex ms-1 flex-column"><button type="button" style="display: inline!important;" id="remove' + (next) + '" class="btn btn-danger remove-me">-</button></div></div>';
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
    $(function (){
        var input = document.querySelector("#landlordContactno");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#landlordContactno").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#landlordContactno").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#landlordContactno").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script>
    $(function (){
        var input = document.querySelector("#landlordWorkContactno");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#landlordWorkContactno").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#landlordWorkContactno").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#landlordWorkContactno").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script>
    $(function (){
        var input = document.querySelector("#contactNumber1");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#contactNumber1").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#contactNumber1").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#contactNumber1").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script>
    $(function (){
        var input = document.querySelector("#contactNumber2");
        var myinput = window.intlTelInput(input, {
            initialCountry: "om",
            onlyCountries: ["om", "in", "ae"],
            hiddenInput: "full",
            separateDialCode: true,
            autoHideDialCode: false,
            utilsScript: "//cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.3/js/utils.js",
        });
        $("#contactNumber2").change(function () {
            var full_number = myinput.getNumber(intlTelInputUtils.numberFormat.E164);
            $("#contactNumber2").val(full_number);
            if (myinput.isValidNumber() == false) {
                $("#contactNumber2").val("");
                swal("Please enter valid mobile number");
                return false;
            }
        });
    });                   
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js" integrity="sha512-DNeDhsl+FWnx5B1EQzsayHMyP6Xl/Mg+vcnFPXGNjUZrW28hQaa1+A4qL9M+AiOMmkAhKAWYHh1a+t6qxthzUw==" crossorigin="anonymous"></script>
<script src="../common/theme/js/custom.js"></script>

    </body>

</html>
