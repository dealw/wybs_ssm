<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					旅客管理 <small>旅客列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${pageContext.request.contextPath}/travller/findAll.do?page=1&size=4">旅客管理</a></li>
					<li class="active">数据列表</li>
				</ol>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">旅客列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">
							<input type="hidden" id="name" value="${name}">
							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
											<button type="button" class="btn btn-default" title="删除" onclick="delorder()">
												<i class="fa fa-trash-o"></i> 删除
											</button>
										</security:authorize>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
								<div class="has-feedback">
									<input type="text" class="form-control input-sm"
										placeholder="搜索" id="search"> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
								</div>
							</div>
							<!--用于传递选中项的表单/-->
							<form action="${pageContext.request.contextPath}/travller/deleteByIds.do" method="post" id="formCommit">
							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px;"><input
												id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc sorting_asc_disabled">ID</th>
										<th class="sorting_desc sorting_asc_disabled">姓名</th>
										<th class="sorting_asc sorting_asc_disabled">性别</th>
										<th class="sorting_desc sorting_desc_disabled">联系电话</th>
										<th class="sorting_desc sorting_desc_disabled">证件类型</th>
										<th class="sorting_desc sorting_desc_disabled">证件号码</th>
										<th class="sorting_desc sorting_desc_disabled">旅客类型</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="traveller">
										<tr>
											<td><input name="ids" type="checkbox" value="${traveller.id}" id="ids"></td>
											<td>${traveller.id }</td>
											<td>${traveller.name }</td>
											<td>${traveller.sex }</td>
											<td>${traveller.phoneNum }</td>
											<td>${traveller.credentialsTypeStr }</td>
											<td>${traveller.credentialsNum }</td>
											<td>${traveller.travellerTypeStr }</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/travller/findById.do?id=${traveller.id}" class="btn bg-olive btn-xs">修改</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<!--
                            <tfoot>
                            <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            </tr>
                            </tfoot>-->
							</table>
							</form>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->

					<!--分页管理-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages}页，共${pageInfo.total}条数据 每页
								<select class="form-control" id="changePageSize" onchange="changePageSize()">
									<c:forEach begin="1" end="5" var="i">
										<option
												<c:if test="${pageInfo.pageSize==i}">
													selected
												</c:if>
										>${i}</option>
									</c:forEach>
								</select> 条
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul class="pagination">
								<li>
									<c:if test="${flag==1}">
										<a href="${pageContext.request.contextPath}/travller/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
									</c:if>
									<c:if test="${flag==0}">
										<a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
									</c:if>
								</li>
								<li>
									<c:if test="${flag==1}">
										<a href="${pageContext.request.contextPath}/travller/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
									</c:if>
									<c:if test="${flag==0}">
										<a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
									</c:if>
								</li>
								<%--展示页码--%>
								<c:if test="${pageInfo.pageNum+4>pageInfo.pages}">
									<c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pages}" var="cur">
										<li>
											<c:if test="${flag==1}">
												<a href="${pageContext.request.contextPath}/travller/findAll.do?page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
											</c:if>
											<c:if test="${flag==0}">
												<a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
											</c:if>
										</li>
									</c:forEach>
								</c:if>
								<c:if test="${pageInfo.pageNum+4<=pageInfo.pages}">
									<c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="cur">
										<li>
											<c:if test="${flag==1}">
												<a href="${pageContext.request.contextPath}/travller/findAll.do?page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
											</c:if>
											<c:if test="${flag==0}">
												<a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
											</c:if>
										</li>
									</c:forEach>
								</c:if>
								<c:if test="${flag==1}">
									<li><a href="${pageContext.request.contextPath}/travller/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
								</c:if>
								<c:if test="${flag==0}">
									<li><a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
								</c:if>
								<li>
									<c:if test="${flag==1}">
										<a href="${pageContext.request.contextPath}/travller/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
									</c:if>
									<c:if test="${flag==0}">
										<a href="${pageContext.request.contextPath}/travller/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
									</c:if>
								</li>
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->

				</div>

				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->

			<!-- 底部导航 -->
			<footer class="main-footer">
				<jsp:include page="footer.jsp"/></footer>
			<!-- 底部导航 /-->

		</div>

		<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="../plugins/raphael/raphael-min.js"></script>
		<script src="../plugins/morris/morris.min.js"></script>
		<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script src="../plugins/knob/jquery.knob.js"></script>
		<script src="../plugins/daterangepicker/moment.min.js"></script>
		<script src="../plugins/daterangepicker/daterangepicker.js"></script>
		<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
		<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
		<script
			src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script
			src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script src="../plugins/fastclick/fastclick.js"></script>
		<script src="../plugins/iCheck/icheck.min.js"></script>
		<script src="../plugins/adminLTE/js/app.min.js"></script>
		<script src="../plugins/treeTable/jquery.treetable.js"></script>
		<script src="../plugins/select2/select2.full.min.js"></script>
		<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script
			src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
		<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script
			src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
		<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
		<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script src="../plugins/ckeditor/ckeditor.js"></script>
		<script src="../plugins/input-mask/jquery.inputmask.js"></script>
		<script
			src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="../plugins/chartjs/Chart.min.js"></script>
		<script src="../plugins/flot/jquery.flot.min.js"></script>
		<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
		<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
		<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
		<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
		<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script>
			$(function (){
				$("#search").keydown(function (event){
					if(event.keyCode==13){
						location.href="${pageContext.request.contextPath}/travller/searchByName.do?name="+encodeURI(encodeURI($("#search").val()));
					}
				});
			});
			function delorder(){
				if ($("#ids:checked").val()==undefined){
					alert("什么都没选中")
				}else {
					$("#formCommit").submit();
				}
			}
			function changePageSize() {
				//获取下拉框的值
				var pageSize = $("#changePageSize").val();

				//向服务器发送请求，改变没页显示条数
				location.href = "${pageContext.request.contextPath}/travller/searchByName.do?name="+encodeURI($("#name").val())+"&page=1&size="
						+ pageSize;
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

			$(document)
					.ready(
							function() {

								// 激活导航位置
								setSidebarActive("admin-datalist");

								// 列表按钮 
								$("#dataList td input[type='checkbox']")
										.iCheck(
												{
													checkboxClass : 'icheckbox_square-blue',
													increaseArea : '20%'
												});
								// 全选操作 
								$("#selall")
										.click(
												function() {
													var clicks = $(this).is(
															':checked');
													if (!clicks) {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck(
																		"uncheck");
													} else {
														$(
																"#dataList td input[type='checkbox']")
																.iCheck("check");
													}
													$(this).data("clicks",
															!clicks);
												});
							});
		</script>
</body>

</html>