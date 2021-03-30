<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><security:authorize access="hasAnyRole('ADMINISTRATOR','MANAGER','SALESPERSON','EXECUTIVE')">
	企业权限管理系统
</security:authorize>
	<security:authorize access="hasRole('USER')">
		旅游网
	</security:authorize></title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
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
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				用户管理 <small>用户表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
				<li class="active">用户表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form action="${pageContext.request.contextPath}/travller/save.do"
				method="post">
				<input type="hidden" name="productId" value="${productId}">
				<!-- 正文区域 -->
				<section class="content">
				<!--游客信息-->
				<div class="panel panel-default" id="traveller">
					<div class="panel-heading">游客信息</div>
					<div class="row data-type">
						<div class="col-md-2 rowHeight2x title">备注</div>
						<div class="col-md-10 rowHeight2x data">
							<textarea   rows="2" class="form-control" name="desc"
								   placeholder="备注" value="">
							</textarea>
						</div>
						<div class="col-md-2 title">游客姓名</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="travellers[0].name"
								placeholder="游客姓名" value="">
						</div>
						<div class="col-md-2 title">电话号码</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="travellers[0].phoneNum"
								   placeholder="电话号码" value="">
						</div>
						<div class="col-md-2 title">证件类型</div>
						<div class="col-md-4 data">
							<select class="form-control select2" style="width: 100%"
									name="travellers[0].credentialsType">
								<option value="0" selected="selected">身份证</option>
								<option value="1">护照</option>
								<option value="2">军官证</option>
							</select>
						</div>
						<div class="col-md-2 title">证件号码</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="travellers[0].credentialsNum"
								   placeholder="证件号码" value="">
						</div>
						<div class="col-md-2 title">性别</div>
						<div class="col-md-2 data">
							<select class="form-control select2" style="width: 100%"
									name="travellers[0].sex">
								<option value="男" selected="selected">男</option>
								<option value="女">女</option>
							</select>
						</div>
						<div class="col-md-2 title">游客类型</div>
						<div class="col-md-2 data">
							<select class="form-control select2" style="width: 100%"
									name="travellers[0].travellerType">
								<option value="0" selected="selected">成人</option>
								<option value="1">儿童</option>
							</select>
						</div>
						<div class="col-md-2 title">支付方式</div>
						<div class="col-md-2 data">
							<select class="form-control select2" style="width: 100%"
									name="payType">
								<option value="0" selected="selected">支付宝</option>
								<option value="1">微信</option>
								<option value="2">其他</option>
							</select>
						</div>
							<button type="button" class="btn bg-olive btn-success btn-xs col-md-12 title" onclick="addtravel()"><p style="font-size: 18px;font-weight: bold;letter-spacing: 8px">增加游客</p></button>
					</div>
				</div>
				 <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<jsp:include page="footer.jsp"/></footer>
		<!-- 底部导航 /-->

	</div>


	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		 flag=1;
		function addtravel(){
			$("#traveller").append('<div class="row data-type">\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">游客姓名</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<input type="text" class="form-control" name="travellers['+flag+'].name"\n' +
					'\t\t\t\t\t\t\t\t   placeholder="游客姓名" value="">\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">电话号码</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<input type="text" class="form-control" name="travellers['+flag+'].phoneNum"\n' +
					'\t\t\t\t\t\t\t\t   placeholder="电话号码" value="">\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">证件类型</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<select class="form-control select2" style="width: 100%"\n' +
					'\t\t\t\t\t\t\t\t\tname="travellers['+flag+'].credentialsType">\n' +
					'\t\t\t\t\t\t\t\t<option value="0" selected="selected">身份证</option>\n' +
					'\t\t\t\t\t\t\t\t<option value="1">护照</option>\n' +
					'\t\t\t\t\t\t\t\t<option value="2">军官证</option>\n' +
					'\t\t\t\t\t\t\t</select>\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">证件号码</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<input type="text" class="form-control" name="travellers['+flag+'].credentialsNum"\n' +
					'\t\t\t\t\t\t\t\t   placeholder="证件号码" value="">\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">性别</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<select class="form-control select2" style="width: 100%"\n' +
					'\t\t\t\t\t\t\t\t\tname="travellers['+flag+'].sex">\n' +
					'\t\t\t\t\t\t\t\t<option value="男" selected="selected">男</option>\n' +
					'\t\t\t\t\t\t\t\t<option value="女">女</option>\n' +
					'\t\t\t\t\t\t\t</select>\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-2 title">游客类型</div>\n' +
					'\t\t\t\t\t\t<div class="col-md-4 data">\n' +
					'\t\t\t\t\t\t\t<select class="form-control select2" style="width: 100%"\n' +
					'\t\t\t\t\t\t\t\t\tname="travellers['+flag+++'].travellerType">\n' +
					'\t\t\t\t\t\t\t\t<option value="0" selected="selected">成人</option>\n' +
					'\t\t\t\t\t\t\t\t<option value="1">儿童</option>\n' +
					'\t\t\t\t\t\t\t</select>\n' +
					'\t\t\t\t\t\t</div>\n' +
					'\t\t\t\t\t\t<button type="button" class="btn bg-olive btn-success btn-xs col-md-12 title" onclick="addtravel()"><p style="font-size: 18px;font-weight: bold;letter-spacing: 8px">增加游客</p></button>\n' +
					'\t\t\t\t\t</div>');
		}
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}
	</script>


</body>

</html>