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
        <jsp:include page="../login/headerlink.htm?submodule=Utility Master&tab=Common Utilities&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>Individual Uitilities </h5></div>
                <form id="requiForm" class="row" method="post" action="../master/commonUtilityFormSubmit.htm" enctype="multipart/form-data" onsubmit="return checkGrid();">
                            
                    <div class="col-md-4 form-floating mb-3">
                       

                        <c:choose>
                            <c:when test="${fn:length(comUtilList) > 0}">
                                <c:forEach items="${comUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge validate[required]" name="comUtility" id="comUtility" value="${type.comUtility}"> 
                                            <input type="hidden"  id="SNo" name="SNo" maxlength="30" value="${type.SNo}">
                                            <input type="hidden"  id="comUtilityCode" name="comUtilityCode" maxlength="30" value="${type.comUtilityCode}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.comUtility}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="fill" class="form-control  input-xlarge validate[required]"  id="comUtility" name="comUtility"  value="" onchange="test11();">                                                                                                         
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
                                            <input class="form-control input-xlarge" readonly="true" type="text" value="${type.remarks}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="fill" class="form-control  input-xlarge validate[required]"  id="remarks" name="remarks"  value="" onchange="test11();">                                                                                                         
                            </c:otherwise>        
                        </c:choose>
                                <label class="control-label"><span style="color: red">*</span> Remarks</label>
                    </div>
                    <%-- <div class="col-md-4 col-sm-12 col-xs-12 form-inline">
                        <label class="control-label"><span style="color: red">*</span> Utility Bill Type</label>

                        <c:choose>
                            <c:when test="${fn:length(inUtilList) > 0}">
                                <c:forEach items="${inUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge validate[required]" name="comUtilityBillType" id="comUtilityBillType" value="${type.comUtilityBillType}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.comUtilityBillType}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>                                                    
                                <select class="form-control input-large validate[required]" id="comUtilityBillType" name="comUtilityBillType" style="">
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
                            <c:when test="${fn:length(comUtilList) > 0}">
                                <c:forEach items="${comUtilList}" var="type">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input type="text" class="form-control  input-xlarge" name="comutilityBill" id="comutilityBill" value="${type.comutilityBill}" onkeypress="return isNumberKey(event)"> 
                                            <input type="hidden" class="form-control  input-xlarge" name="comutilityBill1" id="comutilityBill1" value="${type.comutilityBill}" onkeypress="return isNumberKey(event)"> 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control  input-xlarge" readonly type="text" value="${type.comutilityBill}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input type="text" placeholder="" class="form-control  input-xlarge" name="comutilityBill" id="comutilityBill" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
</div>--%>
                    <c:if test="${action ne 'view'}">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">        
                                <button type="submit" class="btn btn-primary" style="" onclick="return test();">Save</button>
                                <a href="../master/commonUtilityList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                           
                        </div>
                    </c:if>
                    <c:if test="${action eq 'view'}">
                         <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">        
                                <a href="../master/commonUtilityList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                         
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
        var basementBill = parseInt($('#basementBill').val());
        var parkingBill = parseInt($('#parkingBill').val());
        var mezzanineBill = parseInt($('#mezzanineBill').val());
        var swimmingBill = parseInt($('#swimmingBill').val());
        var pentHouseBill = parseInt($('#pentHouseBill').val());
        var gymBill = parseInt($('#gymBill').val());
        var Amount = parseFloat(0);
        //alert(gasBill);
        if (isNaN(basementBill))
        {
            basementBill = parseFloat(0);
        }
        if (isNaN(parkingBill))
        {
            parkingBill = parseFloat(0);
        }
        if (isNaN(mezzanineBill))
        {
            mezzanineBill = parseFloat(0);
        }
        if (isNaN(swimmingBill))
        {
            swimmingBill = parseFloat(0);
        }
        if (isNaN(pentHouseBill))
        {
            pentHouseBill = parseFloat(0);
        }
        if (isNaN(gymBill))
        {
            gymBill = parseFloat(0);
        }
        Amount = basementBill + parkingBill + mezzanineBill + swimmingBill + pentHouseBill + gymBill;

        $('#comTotalAmount').val(Amount);
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
        var comUtility = document.getElementById("comUtility").value;
        var utilityBillType = document.getElementById("comUtilityBillType").value;
        var comutilityBill = document.getElementById("comutilityBill").value;
        if (document.getElementById("comUtility").value == "")
        {
            alert("Enter Utility Name");
            return false;
        } else if (document.getElementById("comUtilityBillType").value == "")
        {
            alert("Enter  Utility Bill Type");
            return false;
        } else if (document.getElementById("comutilityBill").value == "")
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

        var comUtility = document.getElementById("comUtility").value;

        $.ajax
                ({
                    type: "POST",
                    url: '../master/utilityName.htm',
                    data: {
                        comUtility: comUtility
                    },
                    success: function (data) {

                        if ($.trim(data) == 'Already Exists.Enter another') {
//                            alert("This Record Already Exist");
                            document.getElementById("comUtility").value = "";
                            return false;
                        }

                    }


                });
    }

    function test12()
    {
        var comutilityBill = document.getElementById("comutilityBill").value;
        var comutilityBill1 = document.getElementById("comutilityBill1").value;
        if (document.getElementById("comUtility").value == "")
        {
            alert("Enter utility");
            return false;
        }
        else
        if (document.getElementById("comutilityBill").value == "")
        {
            alert("Enter utilityBill");
            return false;
        }
        else
        if (comutilityBill !== comutilityBill1) {
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
