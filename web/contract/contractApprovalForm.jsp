<%-- 
    Document   : contractApprovalForm
    Created on : 4 Oct, 2016, 11:52:25 AM
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
<style>
    
 #reviewerComments{
           border: 1px solid #ced4da;
    /* border-top: none; */
    /* border-left: none; */
    /* border-right: none; */
    appearance: none;
    border-radius: 0;
    margin-bottom: 8px; 
    }
 
        #card-title {
    padding: 20px 0 15px 0;
    font-size: 16px;
    font-weight: 400;
     color:#212529 !important; 
    /* font-family: "Poppins", sans-serif; */
}
    
</style>

    <script>
        //Function to reject Contract
        function reject()
        {
            
            var remarks = $('#reviewerComments').val();
            var contractCode = $('#contractTitle').val();
            console.log("contractCode="+contractCode);
            if (remarks == null || remarks == '') {
                 //console.log(ccode);
                //alert("HI");
                alert("Please Write Remarks..!!");
                return  false;
            } else {
//                var contractCode = $('#contractTitle').val();
//                console.log("contractCode="+contractCode);
                //var encodedContractCode = encodeURIComponent(contractCode);
                //console.log("url:"+"../insurance/rejectedContraSubmit.htm?contractCode="+contractCode);
                window.location.href = "../insurance/rejectedContraSubmit.htm?contractCode="+contractCode+"&reviewerRecordStatus="+status+"&reviewerComments=" + remarks + "";

            }
        }

        //Function To recheck contract
        function recheck(contractCod, status)
        {
            var remarks = $('#reviewerComments').val();
            document.getElementById('reviewerRecordStatus').value = status;
            if (remarks == null || remarks == '') {
                alert("Please Write Remarks..!!");
                return  false;
            }
            $('#contractCreation').submit();
        }
    </script>

    <body class="nav-md">

        <div class="">


            <div class="main_container">
                <jsp:include page="../login/menu.htm"/>
                <!-- page content -->
                <div class="main" role="main" id="main">
                    <div class="mt-3">
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-lg-12">
                            
                            <div class="x_panel">
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                      <title>JSP Page</title>
                                      <ul class="nav nav-pills">
                                        <li class="nav-item">
                                          <a class="nav-link active" href="../insurance/contractCreationList.htm">Contract Creation</a>
                                        </li>
                                        <li class="nav-item">
                                          <a class="nav-link " href="../insurance/contractApprovalList.htm">Pending Approval</a>
                                        </li>
<!--                                        <li class="nav-item">
                                          <a class="nav-link" href="../insurance/contractApprove2List.htm">Approval 2</a>
                                        </li>-->
                                        <li class="nav-item">
                                          <a class="nav-link" href="../insurance/approvedContraList.htm">Approved Contract List</a>
                                        </li>
                                        <li class="nav-item">
                                          <a class="nav-link" href="../insurance/rejectedContractList.htm">Rejected Contract List</a>
                                        </li>
<!--                                        <li class="nav-item">
                                          <a class="nav-link" href="../insurance/expiredContractList.htm">Expired Contracts</a>
                                        </li>-->
                                      </ul>
                                      <br>
                                      <div class="text-end">
                                        <a class="btn btn-primary btn-sm " href="../insurance/contractApprovalList.htm">
                                          <i class="bi bi-plus"></i> show Pending Approval </a>
                                      </div>
                            </div>
                          

                                <div class="x_title">
                                    <h3>Contract Creation Approval Form</h3>

                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                               
                                    <br/>
  <div class="card">
      <div class="card-body">
          <div class="card-title" id="card-title">

                                    <form id="contractCreation" class="form-inline row" action="../insurance/approvedContraList.htm" method="post" enctype="multipart/form-data">
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
                                        <c:forEach items="${approvList}" var="type">
                                            <c:set var="contractCode" value="${type[6]}"/> 
                                            <c:set var="contractTitle" value="${type[18]}"/> 
                                            <c:set var="contractCategoryId" value="${type[8]}"/> 
                                            <c:set var="contStartDate" value="${type[10]}"/> 
                                            <c:set var="contEndDate" value="${type[1]}"/>
                                            <c:set var="contReviewDate" value="${type[2]}"/>
                                            <c:set var="contractTerm" value="${type[14]}"/>
                                            <c:set var="contStatus" value="${type[3]}"/>
                                            <c:set var="contClassification" value="${type[9]}"/>
                                            <c:set var="remarks" value="${type[15]}"/>
                                            <c:set var="assetCode" value="${type[16]}"/>
                                            <c:set var="subAssetCod" value="${type[17]}"/>
                                            <c:forEach items="${subAssetDetail}" var="type1">
                                                <c:if test="${type[16] eq type1.assetCode && type[17] eq type1.subAssetCode }">
                                                    <c:set var="assetName" value="${type1.assetName}"/>  
                                                    <c:set var="subAssetName" value="${type1.subAssetName}"/>  
                                                </c:if>                                           
                                            </c:forEach>
                                        </c:forEach>

                                        <c:if test="${fieldStatus_95 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                                  
                                                   
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_95}  id="contractTitle" name="contractTitle" readonly="" value="${list.contractode}">
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" placeholder="Fill" ${mand_status_95}  id="contractTitle" name="contractTitle" readonly="" value="${list.contractode}">
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                       <input type="text"  class="form-control" placeholder="Fill" ${mand_status_95}  id="contractTitle" name="contractTitle" readonly="" value="${list.contractode}">
                                                    </c:otherwise>        
                                                </c:choose>
                                                 <label class="control-label">${field_95}
                                                     <c:if test="${mand_status_95 eq 'required'}">
                                                    <a class="text-danger">*</a>
                                                </c:if>
                                                </label>  
                                                       
                                                <input  type="hidden" name="contractCode" value="${contractCode}">               
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_96 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                                                                                                                                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text"  class="form-control" ${mand_status_96}  id="contractCategoryId" name="contractCategoryId" readonly="" value="${list.contractCategory}">                                               
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text"  class="form-control" ${mand_status_96}  id="contractCategoryId" name="contractCategoryId" readonly="" value="${list.contractCategory}">                                               
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                       <input type="text"  class="form-control" placeholder="Fill" ${mand_status_96}  id="contractCategoryId" name="contractCategoryId" readonly="" value="${list.contractCategory}">                                               
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">${field_96}
                                                     <c:if test="${mand_status_96 eq ''}">
                                                   
                                                </c:if>
                                                    </label>          
                                                
                                            </div>
                                        </c:if>

                               

                                        
                                        <c:if test="${fieldStatus_97 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_97} name="contStartDate" id="contStartDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" >                                                  
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_97} name="contStartDate" id="contStartDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" >                                                  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                       <input class="form-control  input-xlarge" placeholder="Fill" ${mand_status_97} name="contStartDate" id="contStartDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.startDate}"/>" >                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                                 <label class="control-label" for="selectError">${field_97}
                                                 <c:if test="${mand_status_97 eq ''}">
                                                   
                                                </c:if> 
                                                </label>

                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_98 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                              
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input class="form-control  input-xlarge" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>" >                                                                                                          
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input class="form-control  input-xlarge" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>" >                                                                                                          
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                      <input class="form-control  input-xlarge" placeholder="Fill" ${mand_status_98} name="contEndDate" id="contEndDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.endDate}"/>" >                                                                                                          
                                                    </c:otherwise>        
                                                </c:choose>
                                                   <label class="control-label" for="selectError">${field_98}
                                                 <c:if test="${mand_status_98 eq ''}">
                                                  

                                                </c:if> 
                                                </label>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_99 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                                                              

                                               
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input  class="form-control  input-xlarge" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.renewalDate}"/>">                                                                                                            
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input  class="form-control  input-xlarge" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.renewalDate}"/>">                                                                                                            
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                     <input style="margin-top:-10px;" class="form-control  input-xlarge" placeholder="Fill" ${mand_status_99} name="contReviewDate" id="contReviewDate" readonly type="text" value="<fmt:formatDate pattern="dd-MMM-yyyy" value="${list.renewalDate}"/>">                                                                                                            
                                                    </c:otherwise>        
                                                </c:choose>
                                                 <label class="control-label" for="selectError">${field_99}
                                              
                                                </label>
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_291 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                    <input type="text" class="form-control" ${mand_status_291} readonly="" id="contractTerm" name="contractTerm" value="${list.contractPeriod}">                                                                                            
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_291} readonly="" id="contractTerm" name="contractTerm" value="${list.contractPeriod}">                                                                                            
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <input type="text" class="form-control" ${mand_status_291} placeholder="Fill" readonly="" id="contractTerm" name="contractTerm" value="${list.contractPeriod}">                                                                                            
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label ">${field_291}
                                                 <c:if test="${mand_status_291 eq ''}">
                                                
                                                </c:if>
                                               </label>   
                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_100 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                                                    
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                   <input type="text" class="form-control" ${mand_status_291} readonly="" id="contStatus" name="contStatus" value="${list.status}">                                                  
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="text" class="form-control" ${mand_status_291} readonly="" id="contStatus" name="contStatus" value="${list.status}">                                                  
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <input type="text" class="form-control" ${mand_status_291}  placeholder="Fill" readonly="" id="contStatus" name="contStatus" value="${list.status}">                                                  
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label ">${field_100}
                                                
                                                  <c:if test="${mand_status_100 eq ''}">
                                                      
                                                </c:if>    
                                                </label>    
                                            </div>
                                        </c:if>  

                                        <c:if test="${fieldStatus_101 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                              
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                   <input type="text" class="form-control" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${list.contractType}">                                                                 
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                   <input  type="text" class="form-control" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${list.contractType}">                                                                 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <input  type="text" class="form-control" placeholder="Fill" ${mand_status_101} readonly="" id="contClassification" name="contClassification" value="${list.contractType}">                                                                 
                                                    </c:otherwise>        
                                                </c:choose>
                                                  <label class="control-label">${field_101}
                                                 <c:if test="${mand_status_101 eq ''}">
                                                  
                                                </c:if>
                                                </label>    
                                            </div>
                                        </c:if>
                                        <c:if test="${fieldStatus_614 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                   <input  type="text" class="form-control" ${mand_status_614} readonly="" id="contClassification" name="contClassification" value="${list.propertyName}">                                                                 
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                   <input  type="text" class="form-control" ${mand_status_614} readonly="" id="contClassification" name="contClassification" value="${list.propertyName}">                                                                 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <input  type="text" class="form-control" placeholder="Fill" ${mand_status_614} readonly="" id="contClassification" name="contClassification" value="${list.propertyName}">                                                                 
                                                    </c:otherwise>        
                                                </c:choose>
                                                 
                                                <label class="control-label">${field_614}
                                                  <c:if test="${mand_status_614 eq ''}">
                                                  
                                                </c:if>
                                                </label>    
                                            </div>
                                        </c:if>
                                        <p>&nbsp</p>
                                        <c:if test="${fieldStatus_615 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">
                                               
                                                
                                                <c:choose>
                                                    <c:when test="${fn:length(unitContractDetailsList) > 0}">
                                                        <c:forEach items="${unitContractDetailsList}" var="list">
                                                            <c:choose>
                                                                <c:when test="${action eq 'edit'}">
                                                                   <input  type="text" class="form-control" ${mand_status_615} readonly="" id="contClassification" name="contClassification" value="${list.unitNo}">                                                                 
                                                                    <input type="hidden" class="form-control" ${mand_status_96}  id="contractCategoryId1" name="contractCategoryId1" value="${list.assetBuilding}" maxlength="40" >
                                                                </c:when>
                                                                <c:otherwise>
                                                                   <input  type="text" class="form-control" ${mand_status_615} readonly="" id="contClassification" name="contClassification" value="${list.unitNo}">                                                                 
                                                                </c:otherwise> 
                                                            </c:choose>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                    <input  type="text" placeholder="Fill"  class="form-control" ${mand_status_615} readonly="" id="contClassification" name="contClassification" value="${list.unitNo}">                                                                 
                                                    </c:otherwise>        
                                                </c:choose>
                                                <label class="control-label">${field_615}
                                                
                                                 <c:if test="${mand_status_615 eq ''}">
                                                   
                                                </c:if>
                                                </label>     
                                            </div>
                                        </c:if>

                                        <c:if test="${fieldStatus_106 eq 'y'}">
                                            <div class="col-md-4 col-sm-12 col-xs-12 form-floating mb-3">     
                                              
                                                <label style="margin-top:-15px;" class="control-label">${field_106}
                                                   
                                                </label>                                                                      
                                                <textarea name="remarks" id="remarks" class="form-control" readonly maxlength="300" rows="1" style="resize: none">${remarks}</textarea>                                                    
                                            </div>
                                        </c:if>

                                        <div id = "FileUploadContainer">

                                            <!--FileUpload Controls will be added here -->

                                        </div>

                                       
<!--                                            <div style="overflow: scroll;height: auto;width: 98%;border: 1px solid gray;margin-left:10px;margin-right:10px;background:#f5f6f7;">
                                                <table  class="table table-striped responsive-utilities jambo_table" id="membertable">
                                                    <thead>
                                                        <tr>
                                                            <th style=" ">Action</th>                                                           
                                                            <th style=" ">Contract Term <span style="color: red">*</span></th>
                                                            <th style=" ">Start Date <span style="color: red">*</span></th>
                                                            <th style=" ">End Date <span style="color: red">*</span></th>    
                                                            <th style=" ">Contract Type <span style="color: red">*</span></th>                                                    
                                                            <th style=" ">Insurance Tagged</th>

                                                        </tr>

                                                    </thead>
                                                    <tbody id="resourcetable">

                                                        <c:forEach items="${contraEditList}" var="type">                                                          
                                                            <tr class="item-row"> 
                                                                <td align="center" onclick=""><button type="button" id=""><input type="hidden" id="sno"  value="${type[11]}"/><i class="fa fa-trash fa-lg-o"></i></button></td>    
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
                                                                                                                                            <input class="form-control" style="text-align: center;" name="contraHardcoded1" id="contraHardcoded" readonly autocomplete="off" type="hidden" maxlength="30" value="">
                                                                    <input class="form-control" style="text-align: left;width:200px;" name="contStatus1" id="contStatus" readonly autocomplete="off" type="hidden" maxlength="30" value="${type[3]}"></td>

                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>


                                                </table> 
                                            </div>-->

                                        </div>
                                        <!--for edit-->    

                                        <p>&nbsp;</p>

                                        <div>    

                                        </div>                                      

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


                                        <div class="col-md-4 col-sm-12 col-xs-12 form-group">
                                            <label class="control-label"> Remarks</label>
                                            <input type="hidden" id="reviewerRecordStatus"  name="reviewerRecordStatus" value=""/>
                                            <textarea  rows="2" class="form-control reviewerComments" id="reviewerComments" required="" style="resize: none" name="reviewerComments" maxlength="120"></textarea> 
                                        </div>

                                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                            <button type="submit" id="save1" class="btn btn-primary" style="" >Approve</button>
                                            <button type="button" class="btn btn-dark" style="" href="../insurance/tenantContractFormEdit.htm" onclick="recheck('${contractCode}', 'RECHECK');">Recheck</button>
                                            <button type="button" class="btn btn-warning" style="" onclick="reject();">Reject</button>
                                            <a href="../insurance/contractApprovalList.htm" class="btn btn-danger">Cancel</a>
                                        </div>
                                    </form>
          </div>                
      </div>
                                 </div>
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
        <script src="../common/theme/js/custom.js"></script>

    </body>

</html>

