<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Adopets</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/background/css/adminlte.min.css">
  
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  
<body class="hold-transition login-page">
<div class="login-box">
  <div class="card card-outline card-primary">
    <div class="card-header text-center">
      <a href="<%=request.getContextPath()%>/views/background_login/backstage_login.jsp" class="h1"><img src="<%=request.getContextPath()%>/resources/background/img/Adopets.svg"></a>
    </div>
    <div class="card-body">
      <p class="login-box-msg">你忘記密碼了？ 在這裡您可以輕鬆找回新密碼。</p>
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" id="email" name="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <label style="color: red">${errors.nonexistent}</label>
        <div class="row">
          <div class="col-12">
            <button type="button" class="btn btn-primary btn-block" id="resetbtn" onclick="onAdminSubmit();">重置密碼</button>
          </div>
          <!-- /.col -->
        </div>
      <p class="mt-3 mb-1">
        <a href="<%=request.getContextPath()%>/views/background_login/backstage_login.jsp">Login</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/background/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/background/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/background/js/adminlte.min.js"></script>

<script>
function onAdminSubmit() {



	  Swal.fire(
	    '密碼重置成功!',
	    '請您至email，盡快更改您的密碼 !',
	    'success'
	  ),2000;

	  let email = $("#email").val();
	  $.ajax({
	    url: "<%=request.getContextPath()%>/ForgotPwdServlet",
	    data: {
	      "email": email
	    },
	    type: "post",
	    success: function () {

	      window.location.href = '<%=request.getContextPath()%>/views/background_login/backstage_login.jsp';

	    }
	  });

	}
</script>
</body>
</html>
