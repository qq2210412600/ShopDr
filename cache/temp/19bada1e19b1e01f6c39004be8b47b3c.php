<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:30:"./tpl/admin\publics_login.html";i:1487237020;}*/ ?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>后台管理</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="__STATICS_PLUGINS__/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="__STATICS_CSS__/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="__STATICS_CSS__/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="__ADMIN_CSS__/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="__STATICS_PLUGINS__/iCheck/square/blue.css">  
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="__STATICS_JS__/html5shiv.min.js"></script>
  <script src="__STATICS_JS__/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-box-body">
    <p class="login-box-msg"><b>ShopDr</b>-管理系统</p>
    <form action="<?php echo url('publics/doLogin'); ?>" method="post">
      <div class="form-group has-feedback">
        <input type="text" name="username" class="form-control" placeholder="帐号">
        <span class="fa fa-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="密码">
        <span class="fa fa-lock form-control-feedback"></span>
      </div>
        <div class="row">
            <div class="col-xs-8">
                <input type="text" name="verify" class="form-control" placeholder="验证码" />
                <i class="icon-fire"></i>
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
              <img title="点击刷新验证码" src="/index.php/admin/publics/getCaptcha" class="code-img" onClick="this.src='/index.php/admin/publics/getCaptcha?d='+Math.random();" />
            </div>
            <!-- /.col -->
        </div>        
      <div class="row">
        <div class="col-xs-12">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 下次自动登录
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登 录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="__STATICS_PLUGINS__/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="__STATICS_PLUGINS__/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="__STATICS_PLUGINS__/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
