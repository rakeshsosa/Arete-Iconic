<%-- 
    Document   : utlitiesTaggingListForm
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
        <script type="text/javascript" src="../common/datepicker/datetimepicker_css.js"></script>


        <title>Arete Iconic</title>
                     <link rel="icon" href="../common/theme/images/arete-logo.png" type="image/png" sizes="16x16">
    </head>
    
    <script>
                                function selectAssetDetails()
            {
                myWindow = window.open("../assets/selectUtilityPropertyCode.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
                //window.close();
            }
            
//             function selectUnitNumberDetails(e)
//            {
//                debugger
//              //  myWindow = window.open("../assets/selectUnitNumbers.htm?", "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
//               var row_index = $(this).closest("tr").index();
//               var sdfgh =$(e.currentTarget).parent().parent().parent().find('tr').index() + 1
//               
//             var sdfgthj= $(e.target).parent().parent().parent().find('tr')
//             var oijhv= sdfgthj.index(this)
//   var col_index = $(this).index();
//        // window.close();
//            }
            
  
        
            
                                
                                </script>
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
        <jsp:include page="../login/footer.jsp"/>


        <main id="main" class="main">
            <div class="mt-3">
                <jsp:include page="../login/headerlink.htm?submodule=Utlities Tagging&tab=Utlities Tagging&pagetype=form"/>
            </div>
            <div class="pagetitle">

            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="card">
                            <div class="card-body">
                                <div class="card-title"><h5>Utilities Tagging Form</h5></div>
                                <form class="row validateForm" id="userform" action="../assets/utlitiesTaggingFormSubmit.htm" enctype="multipart/form-data" method="post">
                                    <div class="col-md-4 form-floating mb-3">
                                        <c:choose>
                                            <c:when test="${fn:length(utlitiesTaggingList) > 0}">
                                                <c:forEach items="${utlitiesTaggingList}" var="list">
                                                   
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" readonly class="form-control" ${mand_status_1}  id="assetCode" name="assetCode" maxlength="40" value="${list.assetCode}" onclick="return selectAssetDetails();">

                                                        </c:when>
                                                        <c:otherwise>
                                                            <input class="form-control" placeholder="Fill" type="text" id="classroomType" name="classroomType" value="${list.assetCode}" readonly required>
                                                            <!--<input type="hidden" id="assetCode" name="assetCode" value="">-->
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" readonly placeholder="Fill" class="form-control"  id="assetCode" name="assetCode" maxlength="40" value=""  required onclick="return selectAssetDetails();">
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Property Code <a  style="color:red;">*</a></label>      
                                    </div>

                                    <div class="col-md-4 form-floating mb-3">
                                        <c:choose>
                                            <c:when test="${fn:length(utlitiesTaggingList) > 0}">
                                                <c:forEach items="${utlitiesTaggingList}" var="list">
                                                    <%--<c:set value="${list.assetCode}" var="assetCode"/>--%>
                                                    <c:choose>
                                                        <c:when test="${action eq 'edit'}">
                                                            <input type="text" readonly class="form-control" id="assetName" name="assetName" maxlength="40" value="${list.assetName}" onkeypress="return isNumberKey3(event)">
                                                            <input type="hidden" readonly id="pk" name="pk" class="form-control" maxlength="500" value="${list.SNo}" required>
                                                            <!--<input type="hidden" name="pk" value="">-->
                                                            <!--<input type="hidden" id="assetCode" name="assetCode" value="${list.assetCode}">-->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" class="form-control" id="assetName" readonly="" value="${list.assetName}">
                                                            <!--<input type="hidden" id="assetCode" name="assetCode" value="">-->
                                                        </c:otherwise> 
                                                    </c:choose>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>                                                    
                                                <input type="text" readonly placeholder="Fill" class="form-control" id="assetName" name="assetName" maxlength="40" value="" onkeypress="return isNumberKey3(event)" required>
                                            </c:otherwise>        
                                        </c:choose>
                                        <label class="control-label">Property Name <a  style="color:red;">*</a></label>      
                                    </div>
                                    
                                    

                                   
                                    <fieldset>

                                        <div id="menuDiv">

                                            <div class="x_panel">                                

                                                <ul class="nav nav-tabs mt-3">
                                                    <li  class="active"><h5>Rental Utility Details</h5></li>


                                                </ul>


                                                <div class="table-responsive" style="margin-top: 20px;overflow: scroll;height: auto;border: 1px solid gray;background:#f5f6f7;" >
                                                    <table  class="table table-striped responsive-utilities jambo_table" id="enquirytable" style="width:1100px">
                                                        <thead>
                                                            <tr>                                
                                                                <th><i class="fa fa-trash"></i></th>                                                
                                                                <th style="width:210px;"><span style="color:red">*</span>Utility Category</th>
                                                                <th style="width:210px;"><span style="color:red">*</span>Utility Code</th>
                                                              <th style="width:210px;"><span style="color:red">*</span>Utility Name</th>
                                                              <th>Select Units</th>
                                                              <th>Utility Number</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="utilityBody">                                                            
                                                            <c:if test="${action eq null}">
                                                                <tr class="item-enquiry">
                                                                    <td align="center" onclick="" style="width: 50px"><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>
                                                                     <td>
                                                                        <select onchange="getUtilityCode(event)" class="form-select input-large validate[required]" id="utilityCategory" name="utilityCategory" >
                                                                            <option value="">Select Utility Category</option>
                                                                           
                                                                            <option value="Individual Utility">Individual Utility</option>
                                                                            <option value="Common Utility">Common Utility</option>
                                                                                                                                                           
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <select onchange="getUtilityName(event)" class="form-select input-large validate[required]" id="utilityCode" name="utilityCode" >
                                                                            <option value="">Select Utility Code</option>
                                                                            <c:forEach items="${utilityDetails}" var="product">
                                                                                <option>${product}</option>
                                                                            </c:forEach>                                                                                
                                                                        </select>
                                                                    </td>
                                                                        <td style="white-space: nowrap;width: 500px">
                                                                            <select class="form-control validate[required] req" id="utility" name="utility"></select>
<!--                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <input class="form-control" id="utility" type="text" name="utilityName">
                                                                                </div>
                                                                               
                                                                            </div>-->
                                                                        </td> 
                                                                       <td style="white-space: nowrap;width: 300px">
                                                                            <div class="row wrap-nowrap">
                                                                               
                                                                                <input type="text" placeholder="Select Units" class="form-control unitNumbers" id="unitsNumbers" readonly="" name="unitsNumbers" maxlength="40" >
                                                                                   
                                                                                </div>
                                                                        </td> 
                                                                        <td style="white-space: nowrap;width: 200px">
                                                                            <input class="form-control" type="text" name="utiltyNumbers" placeholder="Enter meter no">
                                                                        </td>
                                                                    
                                                                </tr>

                                                            </c:if>
                                                            <c:if test="${action eq 'edit'}">
                                                                <c:forEach items="${utlitiesTaggingList}" var="item">
                                                                <tr class="item-enquiry">
                                                                    <td align="center" onclick="" style="width: 50px"><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>
                                                                     <td>
                                                                         <select onchange="getUtilityCode(event)" class="form-select input-large validate[required]" id="utilityCategory" name="utilityCategory">
                                                                            <option value="${item.utilityCategory}" selected="">${item.utilityCategory}</option>
                                                                           
                                                                            <option value="Individual Utility">Individual Utility</option>
                                                                            <option value="Common Utility">Common Utility</option>
                                                                                                                                                           
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <select onchange="getUtilityName(event)" class="form-select input-large validate[required]" id="utilityCode" name="utilityCode" >
                                                                            <option value="${item.utilityCode}" selected="">${item.utilityCode}</option>
                                                                            <c:forEach items="${utilityDetails}" var="product">
                                                                                <option>${product}</option>
                                                                            </c:forEach>                                                                                
                                                                        </select>
                                                                    </td>
                                                                        <td style="white-space: nowrap;width: 500px">
                                                                            <select class="form-control validate[required] req" id="utility" name="utility" value="${item.utility}">
                                                                            <option value="${item.utility}" selected="">${item.utility}</option>
                                                                            </select>
<!--                                                                            <div class="row">
                                                                                <div class="col-md-6">
                                                                                    <input class="form-control" id="utility" type="text" name="utilityName">
                                                                                </div>
                                                                               
                                                                            </div>-->
                                                                        </td> 
                                                                       <td style="white-space: nowrap;width: 300px">
                                                                            <div class="row wrap-nowrap">
                                                                               
                                                                                <input type="text" placeholder="Select Area Code" class="form-control unitNumbers" id="unitsNumbers" readonly="" name="unitsNumbers" value="${item.unitNumbers}" maxlength="40" >
                                                                                   
                                                                                </div>
                                                                        </td> 
                                                                        <td style="white-space: nowrap;width: 200px">
                                                                            <input class="form-control" type="text" name="utiltyNumbers" placeholder="Enter meter no" value="${item.utilityNumbers}">
                                                                        </td>
                                                                    
                                                                </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${action eq 'view'}">
                                                                <c:forEach items="${utlitiesTaggingList}" var="item">

                                                                    <tr class="item-enquiry">
                                                                        <td align="center" onclick=""> </td>
                                                                        <td><input class="form-control  right validate[required,custom[notzero]]" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityCategory}" readonly="" style=""></td>  
                                                                        <td><input class="form-control  right validate[required,custom[notzero]]" name="utilityBillType" id="utilityBillType" type="text" value="${item.utilityCode}" readonly="" style=""></td>                                                                        
                                                                        <td><input class="form-control  right validate[required,custom[notzero]]" name="utility" id="utility" type="text" value="${item.utility}" readonly="" style=""></td> 
                                                                        <td><input class="form-control  right validate[required,custom[notzero]]" name="utility" id="utility" type="text" value="${item.unitNumbers}" readonly="" style=""></td> 
                                                                        <td><input class="form-control  right validate[required,custom[notzero]]" name="utility" id="utility" type="text" value="${item.utilityNumbers}" readonly="" style=""></td> 
                                                                        
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>        

                                                        </tbody>

                                                    </table>
                                                   <c:if test="${action eq null}">
                                                        <div style="margin-top: 10px;">
                                                            <div class="col-md-4 ms-1 col-sm-12 col-xs-12 form-group">
                                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                                    <a href="#" id="addEnquiryBtnX1" class="btn btn-primary" tabindex=""><i class="fa fa-plus-circle"></i> Add Utility</a>

                                                                </div>
                                                            </div>
                                                        </div>                                        
                                                    </c:if>
                                                </div>
                                                

                                            </div>

                                        </div>

                                    </fieldset>                                         
                                    
                                   <c:if test="${action ne 'view'}">
                                            <div class="col-md-9 col-sm-9 mt-3 col-xs-12 col-md-offset-5">
                                                <button type="submit" class="btn btn-primary" style="">Save</button>
                                                <a href="../assets/utlitiesTaggingList.htm" class="btn btn-danger">Cancel</a>
                                            </div>
                                        </c:if>

                                        <c:if test="${action eq 'view'}">

                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4 mt-2">
                                                <a href="../assets/utlitiesTaggingList.htm" class="btn btn-danger">Cancel</a>
                                            </div>

                                        </c:if>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->

        <script>
            $(function(){
                
                 if( $("#utilityCat").val() != 'Common Utility'){
                        $("#unitNameContainer").show()
                    } else {
                        $("#unitNameContainer").hide()
                    }
                $("#utilityCat").change(function(){
                    if( $("#utilityCat").val() != 'Common Utility'){
                        $("#unitNameContainer").show()
                    } else {
                        $("#unitNameContainer").hide()
                    }
                })
            })
        </script>
                <script>
            $(document).ready(function () {

                //individualinventorysum();

                $(document).on("click", "#addEnquiryBtnX1", function (e) {

                    addindividualutility();
                    e.preventDefault();
                });
                $(document).on("click", "#addEnquiryBtnX2", function (e) {

                    addcommonutility();
                    e.preventDefault();
                });

                //debugger;
                function addindividualutility() {

                    var rowCount1 = $('#enquirytable tr:visible').length;
                    var tablerow = "";
                    var addup;
                    var addup1;
                    // var addup;
                    try {
                        addup = callcategory();
                        addup1 = callcategory2();
                    } catch (error) {
                        addup;
                        addup1;
                    }
            <c:if test="${action eq null}">
                    tablerow = ['<tr class="item-enquiry">'
                                + '<td style="text-align: left;" align="center" onclick=""><button type="button" id="deleteEnquiry"><i class="fa fa-trash-o"></i></button></td>'
                + '<td><select onchange="getUtilityCode(event)" class="form-select input-large validate[required]" id="utilityCategory" name="utilityCategory" > <option value="">Select Utility Category</option> <option value="Individual Utility">Individual Utility</option> <option value="Common Utility">Common Utility</option> </select></td>'               
                + '<td>' + addup + '</td>'                
                                + '<td>' + addup1 + '</td>'
                        +' <td style="white-space: nowrap;width: 300px"><div class="row wrap-nowrap"> <input type="text" placeholder="Select Area Code" class="form-control unitNumbers" id="unitsNumbers" readonly="" name="unitsNumbers" maxlength="40"  onchange="return changeFloor();" onblur="return changeFloor();"></div></td>'
                                                                               
                                +' <td style="white-space: nowrap;width: 200px"> <input class="form-control" type="text" name="utiltyNumbers" placeholder="Enter meter no"></td>'
                                                                        
                                + ' </tr>'].join('');
            </c:if>


                    var $utilityTable1 = $('#enquirytable');
                    var $row1 = $(tablerow);
                    $('.item-enquiry:last', $utilityTable1).after($row1);
                    var $itemRow = $(this).closest('tr');
                    $itemRow.find().focus();
                }

                function addcommonutility() {
                    debugger;
                    var rowCount1 = $('#enquirytable1 tr:visible').length;
                    var tablerow = "";
                    var addup2;
                    var addup3;
                    var addupCat;
                    // var addup;
                    try {
                         //addupCat = callcategory4();
                        addup2 = callcategory1();
                        addup3 = callcategory3();
                    } catch (error) {
                        addup2;
                        addup3;
                    }
            <c:if test="${action eq null}">
                    tablerow = ['<tr class="item-enquiry">'
                                + '<td style="text-align: left;" align="center" onclick=""><button type="button" id="deleteEnquiry1"><i class="fa fa-trash-o"></i></button></td>'
                                 + '<td><select onchange="getUtilityCode(event)" class="form-select input-large validate[required]" id="utilityCategory" name="utilityCategory" > <option value="">Select Utility Category</option> <option value="Individual Utility">Individual Utility</option> <option value="Common Utility">Common Utility</option> </select></td>'
                + '<td>' + addup2 + '</td>'
                                 + '<td>' + addup3 + '</td>'
                                + ' </tr>'].join('');
            </c:if>

                    var $utilityTable1 = $('#enquirytable1');
                    var $row1 = $(tablerow);
                    $('.item-enquiry:last', $utilityTable1).after($row1);
                    var $itemRow = $(this).closest('tr');
                    $itemRow.find().focus();
                }

                individualinventorysum();
                commoninventorysum();
            });
 function callcategory() {
                var x = '<select  onchange="getUtilityName(event)" class="form-control validate[required] req" id="utilityCode" name="utilityCode"><option value="">Select Utility Name</option><c:forEach items="${utilityDetails}" var="utility"><option value="${utility}">${utility}</option></c:forEach></select>';
                return x;
            }
            function callcategory2() {
                var x = '<select class="form-control validate[required] req" id="utility" name="utility"></select>';
                return x;
            }
            function callcategory1() {
                var x = '<select onchange="getcommonUtilityName(event)" class="form-control validate[required] req" id="comUtility" name="comUtilityCode"><option value="">Select Utility Name</option><c:forEach items="${comUtilityDetails}" var="comUtility"><option value="${comUtility}">${comUtility}</option></c:forEach></select>';
                return x;
            }
            function callcategory3() {
                var x = '<select class="form-control validate[required] req" id="comUtilityBillType" name="comUtility"><option value="">Select Utility Bill Type</option><option value="Monthly">Monthly</option><option value="Quarterly">Quarterly</option><option value="Yearly">Yearly</option></select>';
                return x;
            }
             function callcategory4() {
                var x = '<select onchange="getUtilityCode(event)" class="form-select input-large validate[required]" id="utilityCategory" name="utilityCategory" > <option value="">Select Utility Category</option> <option value="Individual Utility">Individual Utility</option> <option value="Common Utility">Common Utility</option> </select>';
                return x;
            }
            function individualinventorysum() {
                //debugger;
                //alert('sum');
                var sum = 0;
                $('#enquirytable').find('.item-enquiry').each(function () {
                    $(this).find("td:nth-child(" + 4 + ")").each(function (rowindex) {
                        newval = $(this).find("input").val();

                        if (isNaN(newval)) {
                            //$(this).html(sum);
                        } else {
                            sum += parseFloat(newval);
                        }
                        console.log(sum);

                    });

                });
                $('#totalitemAmount').html(sum);
                $('#itmTot').val(sum);
            }

            function commoninventorysum() {
                debugger;
                var sum = 0;
                $('#enquirytable1').find('.item-enquiry').each(function () {
                    $(this).find("td:nth-child(" + 4 + ")").each(function (rowindex) {
                        newval = $(this).find("input").val();

                        if (isNaN(newval)) {
                            $(this).html(sum);
                        } else {
                            sum += parseFloat(newval);
                        }
                        console.log(sum);

                    });

                });
                $('#commontotalitemAmount').html(sum);
                $('#commonitmTot').val(sum);
            }

            $(document).on('click', '#deleteEnquiry', function () {
                //mioInvoice.deleteRow4(this);
                var rowCount2 = $('#enquirytable tr:visible').length;
                //alert(rowCount2);
                if (rowCount2 != 2) {
                    //alert('inside');
                    $(this).parents('.item-enquiry').remove();
                    $("tr.item-enquiry").each(function () {
                        var $itemRow = $(this).closest('tr');
                        var rowCount2 = ($(this).closest("tr")[0].rowIndex);
                        $itemRow.attr('id', "row" + rowCount2);


                    });
                    individualinventorysum();
                } else {
                    alert('You cannot delete this row');
                }



            });

            $(document).on('click', '#deleteEnquiry1', function () {
                //mioInvoice.deleteRow4(this);
                var rowCount2 = $('#enquirytable1 tr:visible').length;
                //alert(rowCount2);
                if (rowCount2 != 2) {
                    //alert('inside');
                    $(this).parents('.item-enquiry').remove();
                    $("tr.item-enquiry").each(function () {
                        var $itemRow = $(this).closest('tr');
                        var rowCount2 = ($(this).closest("tr")[0].rowIndex);
                        $itemRow.attr('id', "row" + rowCount2);


                    });
                    commoninventorysum();
                } else {
                    alert('You cannot delete this row');
                }



            });
  function getUtilityName(e) {
      e.preventDefault()
     
     
               var utilityCode =$(e.target).parent().parent().find("#utilityCode").val()
               var utilityCategory =$(e.target).parent().parent().find("#utilityCategory").val()

        $(e.target).parent().parent().find("#utility").empty()
//                    utility
                     
                        
                    //     alert("hbhjbjh");
                    $.ajax
                            ({
                                
                               
                                type: "POST",
                                url: '../assets/fetchRentalUtilityName.htm',
                                data: {
                                    utilityCode: utilityCode,
                                    utilityCategory: utilityCategory
                                },
                                success: function (data) {
                                     console.log(data)
                                      debugger
                                   utilityName = data.split(",,,");
                                   console.log(utilityName[0])
                                    //                                                                        
                                    if (data === 'No Data') {
                                        alert("Data is Not Available please Check");
                                       
                                    } else {
                                         debugger
                                          var utilityappend = $('<option>').val(utilityName[0]).text(utilityName[0]);
                                         $(e.target).parent().parent().find("#utility").append(utilityappend);
//                               
                                       // document.getElementById("utility").childNodes[0].innerHTML = data[0];
                                        //console.log(data[0]);
                                    }
                                }
                            });
                            
      
                            
                            
                }
  
                
                
   function getcommonUtilityName(e) {
      e.preventDefault()
      debugger
     
               var utilityCode =$(e.target).parent().parent().find("#comUtility").val()
                  $(e.target).parent().parent().find("#comUtilityBillType").empty()
//                    utility
                     
                        
                    //     alert("hbhjbjh");
                    $.ajax
                            ({
                                
                               
                                type: "POST",
                                url: '../assets/fetchComUtilityName.htm',
                                data: {
                                    comUtility: utilityCode
                                },
                                success: function (data) {
                                     console.log(data)
                                      debugger
                                   utilityName = data.split(",,,");
                                   console.log(utilityName[0])
                                    //                                                                        
                                    if (data === 'No Data') {
                                        alert("Data is Not Available please Check");
                                       
                                    } else {
                                          var utilityappend = $('<option>').val(utilityName[0]).text(utilityName[0]);
                                         $(e.target).parent().parent().find("#comUtilityBillType").append(utilityappend);
//                               
                                       // document.getElementById("utility").childNodes[0].innerHTML = data[0];
                                        //console.log(data[0]);
                                    }
                                }
                            });
                            
      
                            
                            
                }
             
                
                
                function getUtilityCode(e) {
                    debugger
                    e.preventDefault();
                   var tmpUtilCat = $(e.target).parent().parent().find("#utilityCategory").val();
                     $(e.target).parent().parent().find("#utilityCode").empty()
                   if(tmpUtilCat == "Common Utility") {
                        var  utilityappend = '<option value="">Select Utility Name</option><c:forEach items="${comUtilityDetails}" var="comUtility"><option value="${comUtility}">${comUtility}</option></c:forEach>';

                             $(e.target).parent().parent().find("#utilityCode").append(utilityappend);
                    
                } else if(tmpUtilCat == "Individual Utility") {
                    var utilityappend = '<option value="">Select Utility Name</option><c:forEach items="${utilityDetails}" var="utility"><option value="${utility}">${utility}</option></c:forEach>';
                      $(e.target).parent().parent().find("#utilityCode").append(utilityappend);
                }
                }
                
                
 
$("table tbody").on("click", ".unitNumbers", function(e) {
            let testval = document.getElementById("assetCode").value;
            console.log("test log"+testval);
            var myUtilityWindow = window.open("../assets/selectUnitNumbers.htm?assetCode="+testval, "PopWindow", "width=1000, height=550, menubar=no,location=no,top=20,left=150,scrollbars=yes,titlebar=no,toolbar=no,directories=0");
    
       var curIndex = $(e.currentTarget).parent().parent().parent().index(); 
        myUtilityWindow.currIndexFromOpener = curIndex;
       
      
    
});


    function addUnitNumbers(uno,idx) {
                var tmpUno = uno;
                var tmpInx = idx;
                $('.utilityBody tr').eq(tmpInx).children().find("#unitsNumbers").val(tmpUno);
                
            }

                </script>
    </body>

</html>
