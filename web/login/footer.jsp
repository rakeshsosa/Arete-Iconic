<%-- 
    Document   : footer
    Created on : Dec 28, 2021, 10:03:19 PM
    Author     : ITSUPPORT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .card-title h5 {
    display: none;
}
        </style>
    </head>
    <body>
          <!-- ======= Footer ======= -->
          <footer id="footer" style="float:right; margin-right: 10px;" class="mt-1">
<!--    <div class="copyright">
        &copy; Copyright <strong class="brandName"><span><i>arête™</i></span></strong>. All Rights Reserved
    </div>-->
    <div class="credits">
      
    </div>
  </footer><!-- End Footer -->
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<script src="../common/theme/assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="../common/theme/assets/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/autosize.js/3.0.20/autosize.min.js" integrity="sha512-EAEoidLzhKrfVg7qX8xZFEAebhmBMsXrIcI0h7VPx2CyAyFHuDvOAUs9CEATB2Ou2/kuWEDtluEVrQcjXBy9yw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css" integrity="sha256-FAOaXTpl90/K8cXmSdsskbQN3nKYulhCpPbcFzGTWKI=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha256-bqVeqGdJ7h/lYPq6xrPv/YGzMEb6dNxlfiTUHSgRCp8=" crossorigin="anonymous"></script>
  <!-- Vendor JS Files -->
<!--  <script src="../common/theme/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../common/theme/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../common/theme/assets/vendor/chart.js/chart.min.js"></script>
  <script src="../common/theme/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../common/theme/assets/vendor/quill/quill.min.js"></script>
  <script src="../common/theme/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../common/theme/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../common/theme/assets/vendor/php-email-form/validate.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  
   Template Main JS File 
  <script src="../common/theme/assets/js/main.js"></script>-->
  <script>
      // from a NodeList
autosize(document.querySelectorAll('textarea'));
    NProgress.done();
</script>
<script>
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

$(function () {
    $(".datatable").DataTable();
    $('.toast').toast('show');

                   $('[title="View"], [title="Send Email"], [title="Payment History"], [title="Pay Amount"], [title="Update Milestone"]')
                           .attr('data-toggle', 'tooltip');
                  $('[title="Edit"]').attr('data-toggle', 'tooltip');
                  $('[title="Print"]').attr('data-toggle', 'tooltip');
                  $('[title="Inactive"]').attr('data-toggle', 'tooltip');
                  $('[title="InActive"]').attr('data-toggle', 'tooltip');
                  $('[title=" Process Lead  "]').attr('data-toggle', 'tooltip');
                  $('[title=" Process To Project "]').attr('data-toggle', 'tooltip');
                  $('[title=" Process To Project"]').attr('data-toggle', 'tooltip');
                  $('[title="Create Goods Receipt Note"], [title="Active"]').attr('data-toggle', 'tooltip');
                  $('[title="Upload"], [title="Generate Statement"], [title="Add Amount"], [title="Print Preview"], [title="Convert to Tenant"], [title="Resolution"], [title="Update"], [title="Approval"]').attr('data-toggle', 'tooltip');
                  $('.list-view').attr('title', 'View').attr('data-toggle', 'tooltip')
                  
                  
                  
                    $('[data-toggle="tooltip"]').tooltip();
                    })
                    
</script>
    </body>
</html>
