<%-- 
    Document   : menu
    Created on : Feb 19, 2016, 11:20:13 AM
    Author     : Sudhanshu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8">
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>arête Assets Management</title>
<!--        <link href="../common/theme/css/bootstrap.min.css" rel="stylesheet">

        <link href="../common/theme/fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="../common/theme/css/animate.min.css" rel="stylesheet">

         Custom styling plus plugins 
        <link href="../common/theme/css/custom.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../common/theme/css/maps/jquery-jvectormap-2.0.1.css" />
        <link href="../common/theme/css/icheck/flat/green.css" rel="stylesheet" />
        <link href="../common/theme/css/floatexamples.css" rel="stylesheet" type="text/css" />

        <script src="../common/theme/js/jquery.min.js"></script>
        <script src="../common/theme/js/nprogress.js"></script>
        <script src="../common/datepicker/jquery-1.10.2.js"></script>
        <script src="../common/datepicker/jquery-ui.js"></script>
        <link rel="stylesheet" href="../common/datepicker/jquery-ui.css">
        <script src="../common/datepicker/MonthPicker.min.js"></script>
        <script src="../common/datepicker/jquery.maskedinput.min.js"></script>
        <link rel="stylesheet" href="../common/datepicker/test.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         Jquery Validation Engine
        <link rel="stylesheet" href="../common/validate/validationEngine.jquery.css" type="text/css"/>	
        <script src="../common/validate/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>

        <link rel="stylesheet" type="text/css" href="../common/Timepicker/jquery.timepicker.css" /> 
        <script type="text/javascript" src="../common/Timepicker/jquery.timepicker.js"></script>  -->



 
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="https://www.areteits.com/images/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<script src="../common/validate/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
    <script src="../common/validate/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
        </script>
        <script src="../common/validate/jquery.validationEngine.js" type="text/javascript" charset="utf-8">
        </script>
  <!-- Vendor CSS Files -->
  <link href="../common/theme/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.css" integrity="sha512-DanfxWBasQtq+RtkNAEDTdX4Q6BPCJQ/kexi/RftcP0BcA4NIJPSi7i31Vl+Yl5OCfgZkdJmCqz+byTOIIRboQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.js" integrity="sha512-bUg5gaqBVaXIJNuebamJ6uex//mjxPk8kljQTdM1SwkNrQD7pjS+PerntUSD+QRWPNJ0tq54/x4zRV8bLrLhZg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
  <!-- Template Main CSS File -->
  <link href="../common/theme/assets/css/style.css" rel="stylesheet">
          <script>
            NProgress.start();
        </script>
        <style>
            @media only screen and (max-width: 600px) {
  .header {
   padding-left: 0px;
  }
}

.copyright{
    font-size: 14px;
}
        </style>
    </head>
    <body>
          <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="../common/theme/assets/img/arete-logo-white.png" class="img-fluid" alt="logo">
<!--        <span class="d-none d-lg-block">arête™</span>-->
      </a>
      <i class="bi bi-list toggle-sidebar-btn text-light"></i>
    </div><!-- End Logo -->


    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

<!--        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li>-->
        <!-- End Search Icon-->
<!--        <ul class="nav navbar-nav">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Occupancy Portrayal
                                <span class=" fa fa-angle-down"></span></a>
                            <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-left">
                                <li><a href="../login/occupencyDashboard.htm?orgCode=1-${orgCode}"><i class="fa "></i>Numeric Dashboard</a></li>                                
                                <li><a href="../login/occupencyDashboardgraph.htm?orgCode=1-${orgCode}"><i class="fa "></i>Pictorial Dashboard</a></li>
                            </ul>
                        </li>
                    </ul>-->
                            
        <li class="nav-item dropdown">

          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
            <i class="bi bi-bell"></i>
            <span class="badge bg-primary badge-number" id="bellvalue"></span>
          </a><!-- End Notification Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
            <li class="dropdown-header">
              You have <span class="badge bg-primary badge-number" id="notification"></span> new notifications
              <a href="../dashboard/notifications.htm?orgCode=1-${orgCode}"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
              
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>
             <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'admin'}">
                                                <c:forEach items="${tenants}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                          <div>
                                                              <a href="../tenant/tenantDetailsList.htm">
                                                                  Total Tenants No. of Pending Approvals ${tenants[0]}
<!--                                                                <h4>Total Tenants No. of Pending Approvals </h4>
                                                                <p>${tenants[0]}</p>-->
                                                              </a>
                                                          </div>
                                                        </li>
                                                        
                                                    </c:if>
                                                </c:forEach>

            
           <c:forEach items="${pdc1}" var="dept">
                                                    <c:if test="${dept >'0'}"> 
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                          <div>
                                                              <a href="../tenant/billPaymentList.htm?chequeType=PDC">
                                                                <h4>Total No Of PDC is  </h4>
                                                                <p>${pdc1[0]}</p>
                                                              </a>
                                                          </div>
                                                        </li>
                                                        
                                                    </c:if>
                                                        
                                                </c:forEach>
                                                <c:forEach items="${contract}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../insurance/contractCreationList.htm">
                                                                
                                                                No.Of Contracts Going to Expire ${contract[0]}
                                                            </a>
                                                        </li>
                                                        <li><hr class="dropdown-divider"></li>
                                                    </c:if>
                                                        
                                                </c:forEach>
                                                <c:forEach items="${vacate}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../CRM/vacatingList.htm">
                                                                
                                                                Total Vacating Tenants ${vacate[0]}                                                

                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach items="${poprder}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                       <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../purchase/poList.htm">
                                                                
                                                                Purchase Order Pending Approvals  ${poprder[0]}                                                

                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Approval 2'}">
                                                <c:forEach items="${tenants}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>

                                                            <a href="../tenant/tenantDetailsAppList1.htm">
                                                                Total No. of Pending Approvals ${tenants[0]}
                                                            </a>

                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Approval 1'}">
                                                <c:forEach items="${tenants}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                       <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>

                                                            <a href="../tenant/tenantDetailsAppList.htm">
                                                                Total Tenants No. of Pending Approvals ${tenants[0]}
                                                            </a>

                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Purchase Manager'}">
                                                <c:forEach items="${poprder}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>

                                                            <a href="../purchase/POApproveList.htm">
                                                                Purchase Order Pending Approvals ${poprder[0]}
                                                            </a>

                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Finance Manager'}">
                                                <c:forEach items="${poprder}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                       <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>

                                                            <a href="../purchase/POApprove2List.htm">
                                                                Purchase Order Pending Approvals ${poprder[0]}
                                                            </a>

                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Purchase Officer'}">
                                                <c:forEach items="${poprder}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>

                                                            <a href="../purchase/poList.htm">
                                                                Purchase Order Pending Approvals ${poprder[0]}
                                                            </a>

                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Property Manager'}">
                                                <c:forEach items="${vacate}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-danger"></i>
                                                            <a href="../CRM/vacatingList.htm">
                                                                Total Vacating Tenants ${vacate[0]}                                                

                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${tenant}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                       <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenantPortal/tenantDetailList.htm">
                                                                The Tenant detail is modified, Approval is pending ${tenant[0]}                                                

                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${service}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../serviceReq/serviceRequestList1.htm">
                                                                The Service detail is modified, approval is pending ${service[0]}                                                

                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${pdc}" var="dept">
                                                    <c:if test="${dept >'0'}">
                                                        <%--<c:set value="${dept.pdc}" var="pdc"/>--%>
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenant/billPaymentList1.htm?chequeType=PDC">
                                                                The PDC will be payable after ${pdc[0]} days
                                                                <input type="hidden" id="fwdSection11" name="fwdSection11" value="${pdc[0]}">
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${cdc}" var="dept">
                                                    <c:if test="${dept >'0'}">  
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenant/billPaymentList1.htm?chequeType=CDC">
                                                                Total No Of CDC is ${cdc[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${cash}" var="dept">
                                                    <c:if test="${dept >'0'}">  
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenant/billPaymentList1.htm?">
                                                                Total No Of CDC is ${cash[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${pdcDues}" var="dept">
                                                    <c:if test="${dept >'0'}"> 
                                                       <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenant/billPaymentList1.htm?chequeType=PDC">
                                                                Total No Of pending due is ${pdcDues[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${cdcDues}" var="dept">
                                                    <c:if test="${dept >'0'}"> 
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                            <a href="../tenant/billPaymentList1.htm?chequeType=CDC">
                                                                Total No Of pending due is ${cdcDues[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${cashdues}" var="dept">
                                                    <c:if test="${dept >'0'}"> 
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-danger"></i>
                                                            <a href="../tenant/billPaymentList1.htm?">
                                                                Total No Of pending due is ${cashdues[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${roleName}" var="user">
                                            <c:if test="${user eq 'Tenant'}">
                                                <c:forEach items="${utility}" var="dept">
                                                    <c:if test="${dept >'0'}"> 
                                                        <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          
                                                            <a href="../tenantPortal/tenantDetailList.htm?">
                                                                <i class="btn btn-xs btn-primary fa fa-user"></i>
                                                                Total No Of pending utilities are ${utility[0]}
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
                                        <c:forEach items="${defaultRent}" var="dept">
                                            <c:if test="${dept >'0'}">
                                                <li><hr class="dropdown-divider"></li>
                                                        <li class="notification-item">
                                                          <i class="bi bi-exclamation-circle text-warning"></i>
                                                    <a href="../insurance/defaultRentalPayments.htm">
                                                        
                                                        No.Of Defaulted Rental Payments ${defaultRent[0]}
                                                    </a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

            <li>
              <hr class="dropdown-divider">
            </li>
            <li class="dropdown-footer">
              <a href="../dashboard/notifications.htm?orgCode=1-${orgCode}">Show all notifications</a>
            </li>

          </ul><!-- End Notification Dropdown Items -->

        </li><!-- End Notification Nav -->
 <li class="nav-item">
            <a id="information" class="nav-link nav-icon" href="#">
            <i class="bi bi-info-circle"></i>
          </a>
        
</li>   
       
 <li class="nav-item">
            <a class="nav-link nav-icon" href="../login/faq.htm">
            <i class="bi bi-question-circle"></i>
          </a>
        
</li>   

<li class="nav-item">
   
          <a class="nav-link nav-icon" href="../login/logout.htm">
            <i class="bi bi-box-arrow-right"></i>
          </a>
</li>   

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="../common/theme/assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Welcome ${userFName} </span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>${userFName} ${userLName}</h6>
<!--              <span>Web Designer</span>-->
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="../login/userProfileDetails.htm">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

<!--            <li>
              <a class="dropdown-item d-flex align-items-center" href="../login/faq.htm">
                <i class="bi bi-gear"></i>
                <span>FAQ</span>
              </a>
            </li>-->
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="../login/help.htm">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

<!--            <li>
              <a class="dropdown-item d-flex align-items-center" href="../login/logout.htm">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>-->

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>

    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

                 <!-- ======= Sidebar ======= -->
                 <aside id="sidebar" class="sidebar">  
                       <ul class="sidebar-nav" id="sidebar-nav">
                         <li class="nav-item">
                                <a class="nav-link collapsed" data-bs-target="#dashboard-nav" data-bs-toggle="collapse" href="#">
                                  <i class="bi bi-grid"></i>
                                 <span>Dashboard</span><i class="bi bi-chevron-down ms-auto"></i>
                                </a>
                                  <ul id="dashboard-nav" class="nav-content collapse" data-bs-parent="#dashboard-nav">
                                      <li>
                                          <a class="nav-link collapsed" href="../login/dashboard.htm?orgCode=1-${orgCode}"><span>Dashboard</span></a>
                                      </li>
                                      <li>
                                          <a class="nav-link collapsed" href="../dashboard/managerDashboard.jsp"><span>Manager Dashboard</span></a>
                                      </li>
                                      <li>
                                          <a class="nav-link collapsed" href="../dashboard/accountantDashboard.jsp"><span>Accountant Dashboard</span></a>
                                      </li>
                                  </ul>
                              </li>
                              
                              <!-- End Dashboard Nav -->
                            <c:forEach items="${deptlist}" var="dept">

                                 <li class="nav-item"> 
                                     <c:if test="${dept eq 'Masters'}">
                                        <a class="nav-link collapsed" data-bs-target="#master-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-briefcase-fill"></i><span>Masters</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="master-nav" class="nav-content collapse" data-bs-parent="#master-nav">
                                          <li><a href="../master/insuranceMasterList.htm"><i class="bi bi-circle"></i><span>Masters</span></a></li>
                                            <li><a href="../master/serviceRequestTypeList.htm"><i class="bi bi-circle"></i><span>Service Request Master</span></a></li>
                                            <li><a href="../master/penaltyTypeList.htm"><i class="bi bi-circle"></i><span>Penalty Master</span></a></li>
                                            <li><a href="../master/storeMasterList.htm"><i class="bi bi-circle"></i><span>Store Master</span></a></li>
                                            <li><a href="../master/deliverylocList.htm"><i class="bi bi-circle"></i><span>Location Master</span></a></li>
                                            <li><a href="../master/paytermList.htm"><i class="bi bi-circle"></i><span>Terms and Conditions</span></a></li>
                                            <li><a href="../master/individualUtilityList.htm"><i class="bi bi-circle"></i><span>Utility Master</span></a></li>
                                            <li><a href="../master/amcTypeList.htm"><i class="bi bi-circle"></i><span>AMC Maintenance</span></a></li>
                                            <li><a href="../master/documentCategoryList.htm"><i class="bi bi-circle"></i><span>Document Category</span></a></li>
                                            <li><a href="../master/documenTypeList.htm"><i class="bi bi-circle"></i><span>Document Type</span></a></li>
<!--                                           <li><a href="../master/leadReferalList.htm"><i class="bi bi-circle"></i><span>Masters</span></a></li>-->
                                        </ul>
                                    </c:if>

                                
                                <%--     <c:if test="${dept eq 'User Management'}">
                                        <a class="nav-link collapsed" data-bs-target="#user-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-people-fill"></i><span>User Management</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="user-nav" class="nav-content collapse" data-bs-parent="#user-nav">
                                    <c:forEach items="${permlist}" var="list">
                                            <c:if test="${dept eq list[2]}">
                                                <c:choose>
                                                    <c:when test="${list[13] ne 'n'}">
                                                        <li><a  href="${list[13]}"><i class="bi bi-circle"></i><span>${list[4]}</span></a></li>
                                                        </c:when>    
                                                        <c:otherwise>
                                                        <li><i class="bi bi-circle"></i><span>${list[4]}</span></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                         </li>
                                    </c:if>  --%>
                                
                                    <c:if test="${dept eq 'Property Management'}">
                                        <a class="nav-link collapsed" data-bs-target="#asset-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-building"></i><span>Property Tracking</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="asset-nav" class="nav-content collapse" data-bs-parent="#asset-nav">
                                            <li><a href="../assets/assetsDetailsList.htm"><i class="bi bi-circle"></i><span>Property Profiling</span></a></li>
                                            <li><a href="../assets/areaManagementList.htm"><i class="bi bi-circle"></i><span>Property Area Management</span></a></li>
                                            <li><a href="../assets/subAssetsDetailsList.htm"><i class="bi bi-circle"></i><span>Property Segment</span></a></li>
                                            <li><a href="../assets/propertyWiseSegmentList.htm"><i class="bi bi-circle"></i><span>Property Wise Segment</span></a></li>
                                            <li><a href="../assets/utlitiesTaggingList.htm"><i class="bi bi-circle"></i><span>Utilities Tagging</span></a></li>
                                            <li><a href="../assets/documentsTrackingList.htm"><i class="bi bi-circle"></i><span>Property Document</span></a></li>
                                            <li><a href="../assets/buildingHistoryManagementList.htm"><i class="bi bi-circle"></i><span>Building History Management</span></a></li>
                                        </ul>
                                    </c:if>
                                         
                                        <c:if test="${dept eq 'Asset Maintenance'}">
                                        
                                        <a class="nav-link collapsed" data-bs-target="#asset-maintainance-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-card-list"></i><span>Maintenance Tracking</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="asset-maintainance-nav" class="nav-content collapse" data-bs-parent="#asset-maintainance-nav">                                        
                                            <li><a href="../AMC/generalMaintenanceMgmtList.htm"><i class="bi bi-circle"></i><span>General Maintenance Management</span></a></li>
                                            <li><a href="../AMC/AMCMaintenanceList.htm"><i class="bi bi-circle"></i><span>AMC Management</span></a></li>
                                            <li><a href="../AMC/amcJobPendingJobsList.htm"><i class="bi bi-circle"></i><span>AMC Job Tracking</span></a></li>
                                        </ul>
                                        </c:if>
                                        <c:if test="${dept eq 'Contract Management'}">
                                        
                                      <a class="nav-link collapsed" data-bs-target="#booking-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-book"></i><span>Booking Management</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                         <ul id="booking-nav" class="nav-content collapse" data-bs-parent="#booking-nav">     
<!--                                              <li><a href="../tenant/bookingDetailsList.htm"><i class="bi bi-circle"></i><span>OverView</span></a></li>-->
                                               <li><a href="../tenant/bookingManagmentList.htm"><i class="bi bi-circle"></i><span>Occupancy Overview</span></a></li>

                                            <li><a href="../tenant/newEnquiryList.htm"><i class="bi bi-circle"></i><span>Enquiries</span></a></li>
<!--                                            <li><a href="../tenant/bookingPropertyDetailsList.htm"><i class="bi bi-circle"></i><span>Quotations</span></a></li>-->
  <li><a href="../tenant/bookingDetailsList.htm"><i class="bi bi-circle"></i><span>Quotations</span></a></li>
       <li><a href="../tenant/bookingPropertyDetailsList.htm"><i class="bi bi-circle"></i><span>Bookings</span></a></li>
<!--                                              <li><a href="../tenant/bookingDetailsList.htm"><i class="bi bi-circle"></i><span>Bookings</span></a></li>-->
                                        </ul>
                                        </c:if>
                                        
                                        <c:if test="${dept eq 'Contract Management'}">
                                        
                                        <a class="nav-link collapsed" data-bs-target="#contract-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-journal-text"></i><span>Contract Tracking</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="contract-nav" class="nav-content collapse" data-bs-parent="#contract-nav">                                        
<!--                                            <li><a href="../insurance/insuranceDetailsList.htm"><i class="bi bi-circle"></i><span>Insurance Details</span></a></li>-->
                                            <li><a href="../insurance/tenantContractList.htm"><i class="bi bi-circle"></i><span>Units Contracts Manager</span></a></li>
                                        </ul>
                                        </c:if>
                                        
                                        <c:if test="${dept eq 'Tenant Management'}">
                                        <a class="nav-link collapsed" data-bs-target="#tenant-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-house-fill"></i><span>Tenant Management</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="tenant-nav" class="nav-content collapse" data-bs-parent="#tenant-nav">       
                                               <li><a href="../management/tenantProfilingList.htm"><i class="bi bi-circle"></i><span>Tenant Profiling</span></a></li>
                                            <li><a href="../management/tenantServicesList.htm"><i class="bi bi-circle"></i><span>Tenant Services</span></a></li>
                                            <li><a href="../management/utilityManagementList.htm"><i class="bi bi-circle"></i><span>Utility Management</span></a></li>
                                            <li><a href="../management/pendingDuesList.htm"><i class="bi bi-circle"></i><span>Charges Tracking</span></a></li>
<!--                                            <li><a href="../management/tenantExitList.htm"><i class="bi bi-circle"></i><span>Tenant Exit Process</span></a></li>-->
                                         
                                        </ul>
                                        </c:if>
                                 </c:forEach>
                                     
                                     
                        
                                     
                                     
                                      <%--   <a class="nav-link collapsed" data-bs-target="#booking-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-book"></i><span>Booking Management</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="booking-nav" class="nav-content collapse" data-bs-parent="#booking-nav">                                        
                                            <li><a href="../tenant/bookingManagmentList.htm"><i class="bi bi-circle"></i><span>Booking Management</span></a></li>
                                        </ul>--%>
                                        
                                        <%--   <c:if test="${dept eq 'Finance & Accounting'}">
                                           
                                    
                                        <a class="nav-link collapsed" data-bs-target="#finance-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-currency-exchange"></i><span>Finance & Accounting</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="finance-nav" class="nav-content collapse" data-bs-parent="#finance-nav">
                                        
                                        <c:forEach items="${permlist}" var="list">
                                            <c:if test="${dept eq list[2]}">
                                                <c:choose>
                                                    <c:when test="${list[13] ne 'n'}">
                                                        <li><a  href="${list[13]}"><i class="bi bi-circle"></i><span>${list[4]}</span></a></li>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <li><a  href="#"><i class="bi bi-circle"></i><span>${list[4]}</span></a></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                        </li>
</c:if>--%>
                                    <c:forEach items="${deptlist}" var="dept">    
                                        <c:if test="${dept eq 'Finance & Billing'}">                                    
                                        <a class="nav-link collapsed" data-bs-target="#finance-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-currency-exchange"></i><span>Finance & Billing</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="finance-nav" class="nav-content collapse" data-bs-parent="#finance-nav">
<!--                                            <li><a href="../finance/ledgerList.htm"><i class="bi bi-circle"></i><span>Masters</span></a></li>-->
                                            <li><a href="../tenant/receivablesList.htm"><i class="bi bi-circle"></i><span>Receivables Manager</span></a></li>
                                            <li><a href="../finance/rentInvoicesPDCList.htm"><i class="bi bi-circle"></i><span>Manage Invoice</span></a></li>
                                            <li><a href="../tenant/pettyCashList.htm"><i class="bi bi-circle"></i><span>Petty Cash Manager</span></a></li>
<!--                                            <li><a href="../tenant/expensesList.htm"><i class="bi bi-circle"></i><span>Expenses Manager</span></a></li>-->
<!--                                            <li><a href="../tenant/taxList.htm"><i class="bi bi-circle"></i><span>Tax Manager</span></a></li>-->
                                            <li><a href="../tenant/incomeExpenseList.htm"><i class="bi bi-circle"></i><span>Income and Expense Tracking</span></a></li>
<!--                                            <li><a href="../tenant/serviceChargeList.htm"><i class="bi bi-circle"></i><span>Service Charges Management</span></a></li>-->
<!--                                            <li><a href="../taxManager/openChequesList.htm"><i class="bi bi-circle"></i><span>Cheque Manager</span></a></li>-->
<!--                                            <li><a href="../finance/voucherList.htm"><i class="bi bi-circle"></i><span>Voucher</span></a></li>-->
                                        </ul>
                                         </c:if>
                                    
                                    
                                        <c:if test="${dept eq 'Tax Payable'}">
                                       
                                        
                                     <a class="nav-link collapsed" data-bs-target="#tax-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-journal-text"></i><span>Tax Payable</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="tax-nav" class="nav-content collapse" data-bs-parent="#tax-nav">
                                        
                                        <c:forEach items="${permlist}" var="list">
                                            <c:if test="${dept eq list[2]}">
                                                <c:choose>
                                                    <c:when test="${list[13] ne 'n'}">
                                                        <li><a  href="${list[13]}"><i class="bi bi-circle"></i><span>${list[4]}</span></a></li>
                                                        </c:when>    
                                                        <c:otherwise>
                                                        <li><i class="bi bi-circle"></i><span>${list[4]}</span></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                        </li>
                                         </c:if>

                                    <c:if test="${dept eq 'Purchase Management'}">                                            
                                        <a class="nav-link collapsed" data-bs-target="#purchase-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-handbag-fill"></i><span>Purchase Tracking</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="purchase-nav" class="nav-content collapse" data-bs-parent="#purchase-nav">
                                            <li><a href="../purchase/poList.htm"><i class="bi bi-circle"></i><span>Purchase Order</span></a></li>
                                            <li><a href="../purchase/supplierDetailsList.htm"><i class="bi bi-circle"></i><span>Vendor Details</span></a></li>
                                        </ul>
                                    </c:if>
                                        
                                        <c:if test="${dept eq 'Inventory Management'}">
                                        
                                            
<!--                                       <a class="nav-link collapsed" data-bs-target="#inventory-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-cart-fill"></i><span>Inventory & Stores</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>-->
                                        <ul id="inventory-nav" class="nav-content collapse" data-bs-parent="#inventory-nav">
                                        
                                        <c:forEach items="${permlist}" var="list">
                                            <c:if test="${dept eq list[2]}">
                                                 <c:if test="${list[4] ne 'Inventory List' && list[4] ne 'Quality Inspection'}">
                                                
                                                <c:choose>
                                                    <c:when test="${list[13] ne 'n'}">
                                                        <li><a  href="${list[13]}"><i class="bi bi-circle"></i><span>${list[4]}</span></a></li>
                                                        </c:when>    
                                                        <c:otherwise>
                                                        <li><i class="bi bi-circle"></i><span>${list[4]}</span></li>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </c:if>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                        </li>
                                         </c:if>

                                <%--    <c:if test="${dept eq 'Correspondence Management'}">                                            
                                        <a class="nav-link collapsed" data-bs-target="#sales-nav" data-bs-toggle="collapse" href="#">
                                            <i class="bi bi-graph-up"></i><span>Sales & C.R.M</span><i class="bi bi-chevron-down ms-auto"></i>
                                          </a>
                                        <ul id="sales-nav" class="nav-content collapse" data-bs-parent="#sales-nav">                                        
                                            <li><a href="../CRM/quoteList.htm"><i class="bi bi-circle"></i><span>Rent Quote</span></a></li>
                                            <li><a href="../CRM/complaintList.htm"><i class="bi bi-circle"></i><span>Complaints</span></a></li>
                                            <li><a href="../tenant/bookingManagmentList.htm"><i class="bi bi-circle"></i><span>Booking Management</span></a></li>
                                            <li><a href="../CRM/noticeAndRemainder.htm"><i class="bi bi-circle"></i><span>Notices and Reminders</span></a></li>
                                            <li><a href="../CRM/commissionCalculation.htm"><i class="bi bi-circle"></i><span>Commission Calculation</span></a></li>
                                            <li><a href="../login/occupencyDashboardgraph.htm?orgCode=1-AreteTms"><i class="bi bi-circle"></i><span>Occupancy Chart</span></a></li>
                                        </ul>
                                    </c:if>  --%>
                                        
                                    <c:if test="${dept eq 'Reports'}">
                                    <a class="nav-link collapsed" data-bs-target="#report-nav" data-bs-toggle="collapse" href="#">
                                        <i class="bi bi-file-earmark-fill"></i><span>Reports & MIS</span><i class="bi bi-chevron-down ms-auto"></i>
                                    </a>
                                    <ul id="report-nav" class="nav-content collapse" data-bs-parent="#report-nav">
                                        <li><a href="../reports/tenantReport.htm"><i class="bi bi-circle"></i><span>Tenant</span></a></li>
<!--                                        <li><a href="../reports/correspondenceReport.htm"><i class="bi bi-circle"></i><span>Correspondence</span></a></li>-->
<!--                                        <li><a href="../reports/inventoryReport.htm"><i class="bi bi-circle"></i><span>Inventory</span></a></li>-->
                                        <li><a href="../reports/purchaseReport.htm"><i class="bi bi-circle"></i><span>Purchase Order</span></a></li>
                                        <li><a href="../reports/financeReport.jsp"><i class="bi bi-circle"></i><span>Finance</span></a></li>
                                    </ul>
                                    </c:if>
                                 
                            </c:forEach>

                                
                                <li class="nav-heading">Others</li>

                                    <li class="nav-item">
                                      <a class="nav-link collapsed" href="../login/userProfileDetails.htm">
                                        <i class="bi bi-person"></i>
                                        <span>Profile</span>
                                      </a>
                                    </li> <!-- End Profile Page Nav -->

                                    <li class="nav-item">
                                      <a class="nav-link collapsed" href="../login/faq.htm">
                                        <i class="bi bi-question-circle"></i>
                                        <span>F.A.Q</span>
                                      </a>
                                    </li> <!--End F.A.Q Page Nav -->

                                    <!-- <li class="nav-item">
                                        <a class="nav-link collapsed" href="#" title="Coming Soon">
                                        <i class="bi bi-envelope"></i>
                                        <span>Contact</span>
                                      </a>
                                    </li> End Contact Page Nav -->

                                    <li class="nav-item">
                                      <a class="nav-link collapsed" href="../login/help.htm">
                                        <i class="bi bi-card-list"></i>
                                        <span>Help</span>
                                      </a>
                                    </li> <!--End Register Page Nav -->

                                    <li class="nav-item">
                                      <a class="nav-link collapsed" href="../login/logout.htm">
                                        <i class="bi bi-box-arrow-in-right"></i>
                                        <span>Logout</span>
                                      </a>
                                    </li> <!--End Login Page Nav -->

                          
                        </ul>
                                     <div class="copyright">
        &copy; Copyright <strong class="brandName"><span><i>arête™</i></span></strong>. All Rights Reserved
    </div>
                 </aside>
                                  <!-- Vendor JS Files -->
  <script src="../common/theme/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../common/theme/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../common/theme/assets/vendor/chart.js/chart.min.js"></script>
  <script src="../common/theme/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../common/theme/assets/vendor/quill/quill.min.js"></script>
  <script src="../common/theme/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../common/theme/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../common/theme/assets/vendor/php-email-form/validate.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script type="text/javascript" src="../common/theme/js/moment.min.js"></script>
  <!-- Template Main JS File -->
<!--  <script src="../common/theme/assets/js/main.js"></script>-->
                            <script>
                                $(document).ready(function () {
                                    if (${pdc[0]} <= 0) {
//                                        console.log(${tenants[0]} + ${contract[0]} + ${pdc1[0]} + ${vacate[0]} + ${poprder[0]} + ${tenant[0]} + ${service[0]} + ${cdc[0]} + ${cash[0]} + ${pdcDues[0]} + ${cdcDues[0]} + ${cashdues[0]} + ${utility[0]});
                                        var notifyvalue = (${tenants[0]} + ${contract[0]} + ${pdc1[0]} + ${vacate[0]} + ${poprder[0]} + ${tenant[0]} + ${service[0]} + ${cdc[0]} + ${cash[0]} + ${pdcDues[0]} + ${cdcDues[0]} + ${cashdues[0]} + ${utility[0]});
                                        var txt = '<i class="ace-icon fa fa-exclamation-triangle"></i>';
                                    } else {
                                        var fwdSection11 = document.getElementById("fwdSection11").value;

                                        if (fwdSection11 > 0) {
                                            var pdc = '1';
//                                            console.log(${tenants[0]} + pdc + ${contract[0]} + ${pdc1[0]} + ${vacate[0]} + ${poprder[0]} + ${tenant[0]} + ${service[0]} + ${cdc[0]} + ${cash[0]} + ${pdcDues[0]} + ${cdcDues[0]} + ${cashdues[0]} + ${utility[0]});
                                            var notifyvalue = (${tenants[0]} + pdc + ${contract[0]} + ${pdc1[0]} + ${vacate[0]} + ${poprder[0]} + ${tenant[0]} + ${service[0]} + ${cdc[0]} + ${cash[0]} + ${pdcDues[0]} + ${cdcDues[0]} + ${cashdues[0]} + ${utility[0]});
                                            var txt = '<i class="ace-icon fa fa-exclamation-triangle"></i>';
                                        }
                                    }

                                    if (notifyvalue > 1) {
                                        txt = txt + " " + notifyvalue + " Notifications";
                                    }
                                    else {
                                        txt = txt + " " + notifyvalue + " Notification";
                                    }

                                    document.getElementById('notification').innerHTML = txt;

                                    document.getElementById('bellvalue').innerHTML = notifyvalue;

                                });
                                
                                
                            </script>
                            <script>
$(document).ready(function() {
  $('.nav-link').click(function() {
    // Close all open sidebars
    $('.nav-content').collapse('hide');

    // Open the clicked sidebar
    var target = $(this).data('bs-target');
    $(target).collapse('show');
  });
});
</script>
                            <!--
                            <script src="../common/theme/js/custom.js"></script>-->


<!--                            <script src="../common/theme/js/bootstrap.min.js"></script>

                             gauge js 
                            <script type="text/javascript" src="../common/theme/js/gauge/gauge.min.js"></script>
                            <script type="text/javascript" src="../common/theme/js/gauge/gauge_demo.js"></script>
                             chart js 
                            <script src="../common/theme/js/chartjs/chart.min.js"></script>
                             bootstrap progress js 
                            <script src="../common/theme/js/progressbar/bootstrap-progressbar.min.js"></script>
                            <script src="../common/theme/js/nicescroll/jquery.nicescroll.min.js"></script>
                             icheck 
                            <script src="../common/theme/js/icheck/icheck.min.js"></script>
                             daterangepicker 
                            <script type="text/javascript" src="../common/theme/js/moment.min.js"></script>
                            <script type="text/javascript" src="../common/theme/js/datepicker/daterangepicker.js"></script>

                            <script src="../common/theme/js/custom.js"></script>

                             flot js 
                            
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.pie.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.orderBars.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.time.min.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/date.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.spline.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.stack.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/curvedLines.js"></script>
                            <script type="text/javascript" src="../common/theme/js/flot/jquery.flot.resize.js"></script>

                            <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-2.0.1.min.js"></script>
                            <script type="text/javascript" src="../common/theme/js/maps/gdp-data.js"></script>
                            <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-world-mill-en.js"></script>
                            <script type="text/javascript" src="../common/theme/js/maps/jquery-jvectormap-us-aea-en.js"></script>-->
                            </body>
                            </html>
