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
        <jsp:include page="../login/headerlink.htm?submodule=AMC Maintenance&tab=AMC Type&pagetype=form"/>
    </div>
    <div class="pagetitle">
        
    </div><!-- End Page Title -->
                <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
                <div class="card-title"><h5>AMC Type</h5></div>
                <form class="row" method="post" action="../master/amcTypeFormSubmit.htm" enctype="multipart/form-data" id="delForm">
                    <c:choose>
                        <c:when test="${fn:length(amcTypeList) > 0}">
                            <c:forEach items="${amcTypeList}" var="list">
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


                    <div class="col-md-4 form-floating mb-3"> 
                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input name="pk" type="hidden" value="${list.SNo}">
                                            <input name="status" type="hidden" value="${list.status}">
                                            <textarea class="form-control validate[required]" rows="1" name="amcType" id="amcType" autocomplete="off" style="resize: none;" maxlength="200">${list.amcType}</textarea>
                                            <input id="amcType1" class="form-control"  rows="1" maxlength="300" type="hidden" value="${list.amcType}">


                                        </c:when>
                                        <c:otherwise>
                                            <textarea class="form-control" rows="1" readonly="" style="resize: none;">${list.amcType}</textarea>
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <textarea class="form-control validate[required]" placeholder="Fill" rows="1" name="amcType" id="amcType" autocomplete="off" style="resize: none;" maxlength="200" onchange="uniqueAddress();">${list.amcType}</textarea>
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label" style="margin-top: -5px;">AMC Type <span style="color: red">*</span></label>
                    </div>                                   

                    <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">

                                            <!--<input class="form-control validate[required]" name="schedule" id="schedule" autocomplete="off" type="tel"  value="${list.schedule}">--> 
                                            <select id="schedule" name="schedule" class="form-control validate[required]">
                                                <option selected >${list.schedule}</option>
                                                <option value="">Select Your Option</option>
                                                <!--<option value="weekly">Weekly</option>-->
                                                <option value="monthly">Monthly</option>
                                                <option value="quarterly">Quarterly </option>
                                                <option value="halfyearly">Half Yearly</option>
                                                <option value="yearly">Yearly</option>
                                            </select>
                                            <input class="form-control validate[required]" name="schedule" id="schedule1" autocomplete="off" type="hidden" value="${list.schedule}" > 
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly type="text" value="${list.schedule}" >
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <select id="schedule" name="schedule" class="form-select validate[required]" >
                                    <option value="">Select Your Option</option>
                                    <!--<option value="weekly">Weekly</option>-->
                                    <option value="monthly">Monthly</option>
                                    <option value="quarterly">Quarterly </option>
                                    <option value="halfyearly">Half Yearly</option>
                                    <option value="yearly">Yearly</option>
                                </select>
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Schedule <span style="color: red">*</span> </label>
                    </div>
                   

                    <div class="col-md-4 form-floating mb-3"> 

                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control validate[required]" name="cost" id="cost" autocomplete="off" maxlength="50" type="text" value="${list.cost}" onkeypress="return isNumberKey(event)">
                                            <input class="form-control" name="cost1" id="cost1" autocomplete="off" maxlength="50" type="hidden" value="${list.cost}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly="" autocomplete="off" type="text" value="${list.cost}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control validate[required]" placeholder="Fill" name="cost" id="cost" autocomplete="off" maxlength="50" type="text" value="" onkeypress="return isNumberKey(event)" onchange="rentCalc();">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Estimated Cost <span style="color: red">*</span></label>
                    </div>


                    <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" name="amcDescription" id="amcDescription" autocomplete="off" maxlength="50" type="text" value="${list.amcDescription}">
                                            <input class="form-control" name="vendor1" id="amcDescription1" autocomplete="off" maxlength="50" type="hidden" value="${list.amcDescription}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly="" autocomplete="off" type="text" value="${list.amcDescription}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" name="amcDescription"  autocomplete="off" maxlength="50" type="text" value="" placeholder="Fill">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">AMC Description</label>
                    </div>
                   
                    <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" name="annualCost" readonly="" id="annualCost" autocomplete="off" maxlength="50" type="text" value="${list.annualCost}" onkeypress="return isNumberKey(event)">
                                            <input class="form-control" name="annualCost1" readonly="" id="annualCost1" autocomplete="off" maxlength="50" type="hidden" value="${list.annualCost}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly="" autocomplete="off" type="text" value="${list.annualCost}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" placeholder="Fill" name="annualCost" readonly="" id="annualCost" autocomplete="off" maxlength="50" type="text" value="" onkeypress="return isNumberKey(event)">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Annual Cost</label>
                    </div>
                    
<!--                  <div class="col-md-4 form-floating mb-3"> 
                        
                        <c:choose>
                            <c:when test="${fn:length(amcTypeList) > 0}">
                                <c:forEach items="${amcTypeList}" var="list">
                                    <c:choose>
                                        <c:when test="${action eq 'edit'}">
                                            <input class="form-control" name="vendor" id="vendor" autocomplete="off" maxlength="50" type="text" value="${list.vendor}">
                                            <input class="form-control" name="vendor1" id="vendor1" autocomplete="off" maxlength="50" type="hidden" value="${list.vendor}">
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" readonly="" autocomplete="off" type="text" value="${list.vendor}">
                                        </c:otherwise> 
                                    </c:choose>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <input class="form-control" placeholder="Fill" name="vendor"  autocomplete="off" maxlength="50" type="text" value="">
                            </c:otherwise>        
                        </c:choose>
                        <label class="control-label">Vendor</label>
                    </div>
-->

                    <br/>
                    <c:if test="${action ne 'view'}">

                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">

                            <button type="submit" class="btn btn-primary" style=""> Save</button>
                            <a href="../master/amcTypeList.htm"><button type="button" class="btn btn-danger" style="">Cancel</button></a> 

                        </div>
                
            </c:if>
            <c:if test="${action eq 'view'  }">

                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-4">
                    <a href="../master/amcTypeList.htm" class="btn btn-danger">Cancel</a>
                </div>

            </c:if>
            <br/>

            <div class="clearfix"></div>

            <div class="clearfix"></div>                

            <!-- /page content -->

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
    });

    jQuery(document).ready(function () {
        jQuery("#contDetForm").validationEngine();
        $("input").on("keypress", function (e) {
            if (e.which === 32 && !this.value.length)
                e.preventDefault();
        });
        $("textarea").on("keypress", function (e) {
            if (e.which === 32 && !this.value.length)
                e.preventDefault();
        });

    });

    function test()
    {

        var addr = document.getElementById("amcType").value;
        var addr1 = document.getElementById("amcType1").value;
        var cno = document.getElementById("schedule").value;
        var cno1 = document.getElementById("schedule1").value;
        var mail = document.getElementById("vendor").value;
        var mail1 = document.getElementById("vendor1").value;

        if (document.getElementById("amcType").value == "")
        {
            alert("Enter AMCType");
            return false;
        } else if (document.getElementById("schedule").value == "")
        {
            alert("Enter Schedule");
            return false;
        }
        else if(document.getElementById("cost").value=="")
        {
            alert("Enter the Cost");
            return false;
        }
        else {

            if (addr !== addr1 || cno !== cno1 || mail !== mail1) {
                if (confirm('Do you really want to Save this updated record')) {
                    document.forms["delForm"].submit();
                    return true;
                } else {
                    return true;
                }

            } else {
                document.forms["delForm"].submit();
            }
        }

    }

    function change(val1, val2) {
        var res = val1.substring(0, 3).toString();
        if (val1 != "") {
            document.getElementById("contactRefNo").value = res + "-" + val2.toString();
        } else {
            document.getElementById("contactRefNo").value = "";
        }
    }
//        function rentPMonth() {
//            var itmTot = parseFloat(document.getElementById("itmTot").value);
//            var commonitmTot = parseFloat(document.getElementById("commonitmTot").value);
//            var rentpMonth = parseFloat(document.getElementById("cost").value);
//            var billgCycle = document.getElementById("schedule").value;
//            if (isNaN(rentpMonth) === false && billgCycle !== '') {
//                if (billgCycle == "Monthly") {
//                    document.getElementById("annualCost").value = (rentpMonth);
//                }
//                else if (billgCycle == "Quarterly") {
//                    document.getElementById("annualCost").value = (rentpMonth) * 3;
//                }
//                else if (billgCycle == "Half Yearly") {
//                    document.getElementById("annualCost").value = (rentpMonth) * 6;
//                }
//                else if (billgCycle == "Yearly") {
//                    document.getElementById("annualCost").value = (rentpMonth) * 12;
//                }
//            } else {
//                document.getElementById("annualCost").value = '0';
//            }
//        }


    $(document).ready(function () {
        $('#cost').change(function () {
            var schedule = document.getElementById("schedule").value;
            var cost = document.getElementById("cost").value;
            var rentpMonth = parseFloat(cost);
//                alert("schedule" + schedule);
//                alert("Enter AMCType");
//                alert("cost" + cost);
//                alert("rentpMonth" + rentpMonth);

            if (cost !== '' && schedule !== '') {
//                    alert("cute pavi");
                if (schedule == "monthly") {
//                        alert("cute pavi");
                    document.getElementById("annualCost").value = (rentpMonth) *12;
                }
                else if (schedule == "quarterly") {
                    document.getElementById("annualCost").value = (rentpMonth) * 4;
                }
                else if (schedule == "halfyearly") {
                    document.getElementById("annualCost").value = (rentpMonth) * 2;
                }
                else if (schedule == "yearly") {
                    document.getElementById("annualCost").value = (rentpMonth);
                } else {
//                        alert("Enter AMCTypejbhjhjh");
                    document.getElementById("annualCost").value = '0';
                }
            } else {
//                    alert("Enter AMCTypejbhjhjh");
                document.getElementById("annualCost").value = '0';
            }

        });

    });
    
    $(document).ready(function () {
        $('#schedule').change(function () {
            var schedule = document.getElementById("schedule").value;
            var cost = document.getElementById("cost").value;
            var rentpMonth = parseFloat(cost);
//                alert("schedule" + schedule);
//                alert("Enter AMCType");
//                alert("cost" + cost);
//                alert("rentpMonth" + rentpMonth);

            if (cost !== '' && schedule !== '') {
//                    alert("cute pavi");
                if (schedule == "monthly") {
//                        alert("cute pavi");
                    document.getElementById("annualCost").value = (rentpMonth) *12;
                }
                else if (schedule == "quarterly") {
                    document.getElementById("annualCost").value = (rentpMonth) * 4;
                }
                else if (schedule == "halfyearly") {
                    document.getElementById("annualCost").value = (rentpMonth) * 2;
                }
                else if (schedule == "yearly") {
                    document.getElementById("annualCost").value = (rentpMonth);
                } else {
//                        alert("Enter AMCTypejbhjhjh");
                    document.getElementById("annualCost").value = '0';
                }
            } else {
//                    alert("Enter AMCTypejbhjhjh");
                document.getElementById("annualCost").value = '0';
            }

        });

    });



//    function isNumberKey(evt) {
//        debugger;
//        var charCode = (evt.which) ? evt.which : event.keyCode;
//        if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
//            return false;
//        }
//        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
//            return false;
//        return true;
//    }
    function uniqueAddress() {
        var divisionName = document.getElementById("divisionName").value;
        var address = document.getElementById("address").value;
        $.ajax({
            type: "POST",
            url: '../master/getDelLoc.htm',
            data: {
                divisionName: divisionName,
                address: address,
            },
            success: function (data) {
                if ($.trim(data) == 'Already Exists.') {
                    alert("Address Already Exist");
                    document.getElementById("address").value = "";
                    return false;
                }
            }
        });
    }
</script>
<script>
    NProgress.done();


    $(document).ready(function () {
        jQuery("#delForm").validationEngine();
    }
    );
</script>
</body>

</html>
