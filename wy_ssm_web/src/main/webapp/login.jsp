<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>旅游网|登录</title>

<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<%--	<link rel="stylesheet" href="assets/libs/particles/css/style.css">--%>
<%--	<link rel="stylesheet" href="assets/libs/sweetalert2/sweetalert2.min.css">--%>
<%--	<link rel="stylesheet" href="assets/css/base.css">--%>
	<link rel="stylesheet" href="assets/css/login.css">
	<style>
		#particles-js{
			width: 100%;
			height: 100%;
			position:absolute;z-index:0;
		}
		#regist{
			width: 30%;
			text-align: left;
			position:absolute;z-index:1;
		}
	</style>
</head>
<body style="background-color: #002B5A">
<div id="particles-js"></div>
<div class="login-box" >
	<div class="login-logo">
		<a href="all-admin-index.html" style="color: white">旅游网|登录</a>
	</div>
	<!-- /.login-logo -->
	<div class="login-box-body">
		<p class="login-box-msg" id="error">登录系统</p>

		<form action="${pageContext.request.contextPath}/login.do" method="post" id="loginform">
			<div class="form-group has-feedback">
				<input type="text" name="username" class="form-control"
					   placeholder="用户名" id="username"> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" name="password" class="form-control"
					   placeholder="密码" id="password"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-xs-2">

				</div>
				<!-- /.col -->
				<div class="col-xs-8">
					<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
				</div>
				<!-- /.col -->
			</div>
		</form>

		<div id="regist">
			<a href="${pageContext.request.contextPath}/pages/regist.jsp">会员注册</a>
			<a href="${pageContext.request.contextPath}/product/findAllFromVisitor.do?page=1&size=4" style="padding-left: 45%">游客访问</a>
		</div><br>

	</div>
	<!-- /.login-box-body -->
</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<!-- Bootstrap 3.3.6 -->
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="assets/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="assets/libs/particles/particles.min.js"></script>
<script src="assets/libs/particles/js/app.js"></script>
<script>
	$(function (){
		$("#loginform").submit(function (){
			if(checkUsername()&&checkPassword()){
				return true;
			}else {
				return false;
			}
		});
	})
	function checkUsername(){
		var username = $("#username").val();
		//	用户名不为空
		var flag=username.length!=0;
		if (flag){
			$("#username").css("border","")
		}else {
			$("#username").css("border","2px red solid")
			$("#error").html("<p style='color: red'>请完整输入用户名和密码</p>")
		}
		return flag;
	}
	function checkPassword(){
		var pass = $("#password").val();
		//	密码不为空
		var flag=pass.length!=0;
		if (flag){
			$("#password").css("border","")
		}else {
			$("#password").css("border","2px red solid")
			$("#error").html("<p style='color: red'>请完整输入用户名和密码</p>")
		}
		return flag;
	}
	$(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' // optional
		});
	});
</script>
</body>

</html>