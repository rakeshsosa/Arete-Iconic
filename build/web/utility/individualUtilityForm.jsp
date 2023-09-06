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
		</head>
       
    <body class="nav-md">
        <jsp:include page="../login/menu.htm"/>
               
        <jsp:include page="../login/footer.jsp"/>
                        
    <main id="main" class="main">
        <div class="mt-3">
        <jsp:include page="../login/headerlink.htm?submodule=Utility Master&tab=Individual Utilities&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Individual Uitilities</h5></div>
                <form id="requiForm" class="row" method="post" action="../master/individualUtilityFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                                
                    <div class="col-md-4 form-floating mb-3">
                      

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge validate[required]" name="utility" id="utility" value="${type.utility}"> 
                                            <input type="hidden"  id="SNo" name="SNo" maxlength="30" value="${type.SNo}">
                                            <input type="hidden"  id="utilityCode" name="utilityCode" maxlength="30" value="${type.utilityCode}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.utility}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="fill" class="form-control  input-xlarge validate[required]"  id="utility" name="utility"  value="" onchange="test11();">                                                                                                         
                            </c:otherwise>        
                        </c:choose>
                                  <label class="control-label"><span style="color: red">*</span> Utility Name</label>
                    </div>
                    
                      <div class="col-md-4 form-floating mb-3">
                       

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge validate[required]" name="remarks" id="remarks" value="${type.remarks}"> 
                                            <input type="hidden"  id="SNo" name="SNo" maxlength="30" value="${type.SNo}">
                                            <input type="hidden"  id="utilityCode" name="utilityCode" maxlength="30" value="${type.utilityCode}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.remarks}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="fill"  class="form-control  input-xlarge validate[required]"  id="remarks" name="remarks"  value="" onchange="test11();">                                                                                                         
                            </c:otherwise>        
                        </c:choose>
                                 <label class="control-label"><span style="color: red">*</span> Remarks</label>
                    </div>
                    <%--  <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red">*</span> Utility Bill Type</label>

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <!--<input type="text" class="form-control  input-xlarge validate[required]" readonly name="utilityBillType" id="utilityBillType" value="${type.utilityBillType}">-->
                                            <select class="form-control input-xlarge validate[required]" id="utilityBillType" name="utilityBillType" style="">
                                                <!--                                                        <option value="">Select Utility Bill </option>-->
                                                <option value="Monthly">Monthly</option>
                                                <!--                                                        <option value="Quarterly"> Quarterly Utility Bill </option>
                                                                                                        <option value="Yearly">Yearly Utility Bill </option>-->

                                            </select>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.utilityBillType}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>                                                    
                                <select class="form-control input-xlarge validate[required]" id="utilityBillType" name="utilityBillType" style="">
                                    <!--                                                        <option value="">Select Utility Bill </option>-->
                                    <option value="Monthly">Monthly</option>
                                    <!--                                                        <option value="Quarterly"> Quarterly Utility Bill </option>
                                                                                            <option value="Yearly">Yearly Utility Bill </option>-->

                                </select>
                            </c:otherwise>        
                        </c:choose>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red">*</span> Utility Bill</label>

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge" name="utilityBill" id="utilityBill" value="${type.utilityBill}" onkeypress="return isNumberKey(event)"> 
                                            <input type="hidden" class="form-control  input-xlarge" name="utilityBill1" id="utilityBill1" value="${type.utilityBill}" onkeypress="return isNumberKey(event)"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.utilityBill}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="" class="form-control  input-xlarge" name="utilityBill" id="utilityBill" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
                    </div>
                    <%--<div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red"></span> Utility Bill Quarterly</label>

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge" name="utilityBillQuarter" id="utilityBillQuarter" value="${type.utilityBillQuarter}" onkeypress="return isNumberKey(event)"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.utilityBillQuarter}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="" class="form-control  input-xlarge" name="utilityBillQuarter" id="utilityBillQuarter" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
                    </div>
                    <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red"></span> Utility Bill Yearly</label>

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge" name="utilityBillYear" id="utilityBillYear" value="${type.utilityBillYear}" onkeypress="return isNumberKey(event)"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.utilityBillYear}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="" class="form-control  input-xlarge" name="utilityBillYear" id="utilityBillYear" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
                    </div>--%>
                    <c:if test="${action ne 'view'}">
                          <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">                                                 
                                <button type="submit" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                <a href="../master/individualUtilityList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                            </div>
                     
                    </c:if>
                    <c:if test="${action eq 'view'}">
                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">                                                
                                <a href="../master/individualUtilityList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                           
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

    $(document).ready(function () {
        $('#priceStartValidDate').datepicker({
            autoclose: true,
            format: 'dd-M-yyyy',
            orientation: "bottom left"
        });
        jQuery("#requiForm").validationEngine();
    });

    function isNumberKey(evt) {
        debugger;
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
            return false;
        }
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }

    function calTotal() {
        var electricBill = parseInt($('#electricBill').val());
        var waterBill = parseInt($('#waterBill').val());
        var gasBill = parseInt($('#gasBill').val());
        var maintainceBill = parseInt($('#maintainceBill').val());
        var Amount = parseFloat(0);
        //alert(gasBill);
        if (isNaN(electricBill))
        {
            electricBill = parseFloat(0);
        }
        if (isNaN(waterBill))
        {
            waterBill = parseFloat(0);
        }
        if (isNaN(gasBill))
        {
            gasBill = parseFloat(0);
        }
        if (isNaN(maintainceBill))
        {
            maintainceBill = parseFloat(0);
        }
        Amount = electricBill + waterBill + gasBill + maintainceBill;

        $('#inTotalAmount').val(Amount);
    }

</script>
<script type="text/javascript">
    function Validate($this)
    {
        var fl = document.getElementById("attachmentReference").value;
        var fileSize = $this.files[0];
        var sizeInMb = fileSize.size / 1024;
        var sizeLimit = 1024 * 2;
        if (sizeInMb > sizeLimit) {
            alert("File size exceeded(Only 2MB allowed)");
            $($this).val('');
            return;
        }
        var fmt = /^.*\.(jpg|JPG|gif|GIF|png|PNG|jpeg|JPEG|xls|XLS|xlsx|XLSX|doc|DOC|docx|DOCX|pdf|PDF)$/;
        if (!fl.match(fmt))
        {
            alert('Invalid file');
            $($this).val('');
            return false;
        }

        else {
            return true;
        }

    }

    function selectdate(val) {

        NewCssCal(val, 'ddMMMyyyy', '', '', '', '', 'future');
//                NewCssCal(val, 'ddMMMyyyy', 'dropdown', true, '12', '', 'future');
        //$('#test').attr();
        //document.getElementById("hiddentr").value=$itemRow.index();

    }
    function test()
    {
        var utility = document.getElementById("utility").value;
        var utilityBillType = document.getElementById("utilityBillType").value;
        var utilityBill = document.getElementById("utilityBill").value;
        if (document.getElementById("utility").value == "")
        {
            alert("Enter Utility Name");
            return false;
        } else if (document.getElementById("utilityBillType").value == "")
        {
            alert("Enter  Utility Bill Type");
            return false;
        } else if (document.getElementById("utilityBill").value == "")
        {
            alert("Enter Utility Bill ");
            return false;
        } else {
            document.forms["requiForm"].submit();
        }
    }

</script>
<script>
    //method to validate unique category
    function test11() {

        var utility = document.getElementById("utility").value;

        $.ajax
                ({
                    type: "POST",
                    url: '../master/utility.htm',
                    data: {
                        utility: utility
                    },
                    success: function (data) {

                        if ($.trim(data) == 'Already Exists.Enter another') {
                            alert("This Record Already Exist");
                            document.getElementById("comUtility").value = "";
                            return false;
                        }

                    }


                });
    }

    function test12()
    {
        var utilityBill = document.getElementById("utilityBill").value;
        var utilityBill1 = document.getElementById("utilityBill1").value;
        if (document.getElementById("utility").value == "")
        {
            alert("Enter utility");
            return false;
        }
        else
        if (document.getElementById("utilityBill").value == "")
        {
            alert("Enter utilityBill");
            return false;
        }
        else

        if (utilityBill !== utilityBill1) {
            if (confirm('Do you really want to Save this updated record')) {
                document.forms["requiForm"].submit();
                return true;
            } else {
                return true;
            }

        } else {
            document.forms["requiForm"].submit();

        }

    }

</script>
<script>
    NProgress.done();
</script>
    </body>

</html>
