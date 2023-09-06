<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Arete Iconic</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="https://www.areteits.com/images/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <!-- Vendor CSS Files -->
  <link href="../common/theme/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../common/theme/assets/vendor/simple-datatables/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.css" integrity="sha512-DanfxWBasQtq+RtkNAEDTdX4Q6BPCJQ/kexi/RftcP0BcA4NIJPSi7i31Vl+Yl5OCfgZkdJmCqz+byTOIIRboQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- Template Main CSS File -->
  <link href="../common/theme/assets/css/style.css" rel="stylesheet">
  <style>
     .form-control:disabled, .form-control[readonly] {
    background-color: inherit;
    opacity: 1;
}
  </style>
</head>

<body>

  <main>
    <div class="container">
       
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img class="img-fluid" src="../common/theme/images/logo l.png" alt="logo"/>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                    <p class="text-center small">Enter your username & password to login</p>
                  </div>

                  <form class="row g-3 needs-validation" autocomplete="off" novalidate action="../login/fdashboard.htm" id="login-form" method="POST" role="form">

                    <div class="col-12 form-floating">
                      
                        
                        <input class="form-control" onfocus="this.removeAttribute('readonly');" readonly autocomplete="off" id="user" type="text" name="userId" placeholder="Username" required>
                        <label for="yourUsername" class="form-label">Username</label>
                        <div class="invalid-feedback">Please enter your username.</div>
                  
                      
                    </div>

                    <div class="col-12 form-floating">
                      
                      <input class="form-control" autocomplete="false" id="pwd" type="password" name="password" placeholder="Password" required>
                      <label for="yourPassword" class="form-label">Password</label>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    
                    <div class="col-12">
                      <div class="form-check ">
                        <input class="form-check-input" type="checkbox" name="remember" value="true" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">Remember me</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="text-danger" id="errorMsg">${failmsg}</div>
                      <button class="btn btn-primary w-100" type="submit">Login</button>
                    </div>
                    <div class="col-12">
                        <p class="small mb-0">Don't have account? <a href="javascript::" id="create">Create an account</a></p>
                    </div>
                  </form>

                </div>
              </div>

              <div class="credits">
              
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/nprogress/0.2.0/nprogress.min.js" integrity="sha512-bUg5gaqBVaXIJNuebamJ6uex//mjxPk8kljQTdM1SwkNrQD7pjS+PerntUSD+QRWPNJ0tq54/x4zRV8bLrLhZg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- Template Main JS File -->
  <script src="../common/theme/assets/js/main.js"></script>
  <script>
      $(function(){
          if($("#errorMsg").text() != ''){
              var text = $("#errorMsg").text();
              swal({
                title: "Error",
                text: text,
                icon: "error",
                button: "Ok",
              });
          }
         let userStorage = localStorage.getItem('username');
         let pwdStrorage = localStorage.getItem('pwd');
          if(userStorage != '' && pwdStrorage != ''){
              $("#rememberMe").prop('checked', true);
                $("#user").val(userStorage);
                $("#pwd").val(pwdStrorage);
            }
          
          $("#rememberMe").on('change', function(){
              
              let user = $("#user").val();
              let pwd = $("#pwd").val();
               
              if($("#rememberMe").is(":checked") ){
                  if(user == '' || pwd == ''){
                        swal("Please enter username/password");
                        $("#rememberMe").prop('checked', false);
                        return false;
                    }else {
                        
//                  localStorage.setItem('username', user);
//                  localStorage.setItem('pwd', pwd);
              } 
              
        }else {
                  localStorage.setItem('username', '');
                  localStorage.setItem('pwd', '');
              }
          })
          
          $("#create").on('click', function(){
              swal("Please send an email to enquiry@areteits.com");
          })
          
          $('[type="submit"]').click(function(){
              let user = $("#user").val();
              let pwd = $("#pwd").val();
               
              if($("#rememberMe").is(":checked") ){
                  if(user == '' || pwd == ''){
                        swal("Please enter username/password");
                        $("#rememberMe").prop('checked', false);
                        return false;
                    }else {
                        
                  localStorage.setItem('username', user);
                  localStorage.setItem('pwd', pwd);
              }
          }
              
        
          })
      
      })
  </script>
</body>

</html>