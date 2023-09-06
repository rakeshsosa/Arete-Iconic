<%-- 
    Document   : ledgerSubGroup2Form
    Created on : Nov 21, 2017, 3:28:00 PM
    Author     : EBS
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
<jsp:include page="../login/menu.htm" />
  <jsp:include page="../login/footer.jsp" />
<main id="main" class="main">
    <div class="mt-3">
    
       <jsp:include page="../login/headerlink.htm?submodule=Masters&tab=Lead Referral&pagetype=form"/>
    </div>
    <div class="pagetitle"></div>
    <!-- End Page Title -->
    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">
                            <h5>Liabilities Form</h5>
                        </div>
                        <form class="" id="coustmermnForm" accept-charset="UTF-8" method="post" action="../master/leadFormSubmit.htm" enctype="multipart/form-data" commandName="ledgersg2">
                            <div class="row">
                                <div class="col-md-4 form-floating mb-3">
                                    <select onchange="hideAgencyName(event)" id="sub_groupName" name="subGroupName" class="form-select capitalize validate[required]">
                                        <option value="" selected="">Select an Option</option>
                                        <option value="Direct">Direct</option>
                                        <option value="Booking">Booking</option>
                                        <option value="Agency">Agency</option>
                                        <option value="Others">Others</option>
                                    </select>
                                    <label class="control-label"><span style="color: red;">*</span>Sub Group Name</label>
                                </div>
<!--                                <div class="col-md-4 form-floating mb-3" id="hideAgency">
                                    <input class="form-control validate[required]" id="agentName" name="agentName" type="text" value="" maxlength="50" autocomplete="off" autocomplete="off" placeholder="Automap" />
                                    <label class="control-label"><span style="color: red;">*</span>Agent Name</label>
                                </div>-->
                                <div class="col-md-4 form-floating mb-3">
                                    <input class="form-control validate[required]" id="agentName" name="leadDescription" type="text" autocomplete="off" autocomplete="off" placeholder="Automap" />
                                    <label class="control-label"><span style="color: red;">*</span>Description</label>
                                </div>

                            <c:if test="${action ne 'view'}">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                    <button type="submit" class="btn btn-primary" id="savebtn">Save</button>
                                    <a href="../master/leadReferalList.htm" class="btn btn-danger">Cancel</a>
                                </div>
                            </c:if>
                            <c:if test="${action eq 'view'}">
                                <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5 mt-3">
                                    <a href="../master/leadReferalList.htm" class="btn btn-danger">Cancel</a>
                                </div>
                            </c:if>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>                                       

    <script>
        $(document).ready(function () {
            $("#hideAgency").hide()
        })
         function hideAgencyName(e) {
            if(e.target.value == "Agency") {
                $("#hideAgency").show()
            } else {
                $("#hideAgency").hide()
            }
        }

    </script>    
         
    </body>
</html>