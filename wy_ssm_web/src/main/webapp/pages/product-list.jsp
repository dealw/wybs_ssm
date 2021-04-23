<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
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
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

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
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">
        <security:authorize access="hasAnyRole('ADMINISTRATOR','MANAGER','SALESPERSON','EXECUTIVE')">
            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    数据管理 <small>数据列表</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">数据管理</a></li>
                    <li class="active">数据列表</li>
                </ol>
            </section>
        </security:authorize>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">产品列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">
                        <input type="hidden" id="name" value="${name}">
                        <!--工具栏-->
                        <security:authorize access="hasAnyRole('ADMINISTRATOR','MANAGER','EXECUTIVE')">
                            <div class="pull-left">
                                <div class="form-group form-inline">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-default" title="新建"
                                                onclick="location.href='${pageContext.request.contextPath}/pages/product-add.jsp'">
                                            <i class="fa fa-file-o"></i> 新建
                                        </button>
                                        <security:authorize access="hasRole('ADMINISTRATOR')">
                                        <button type="button" class="btn btn-default" title="删除" onclick="delorder()">
                                            <i class="fa fa-trash-o"></i> 删除
                                        </button>
                                        </security:authorize>
                                    </div>
                                </div>
                            </div>
                        </security:authorize>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm"
                                       placeholder="搜索" id="search"> <span
                                    class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->
                        <form action="${pageContext.request.contextPath}/product/deleteProduct.do" method="post" id="formCommit">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <security:authorize
                                            access="hasAnyRole('ADMINISTRATOR','MANAGER','SALESPERSON','EXECUTIVE')">
                                        <th class="" style="padding-right: 0px;"><input
                                                id="selall" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                    </security:authorize>
                                    <th>ID</th>
                                    <th>编号</th>
                                    <th>产品名称</th>
                                    <th>出发城市</th>
                                    <th>出发时间</th>
                                    <th>产品价格</th>
                                    <th>产品描述</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>


                                <c:forEach items="${pageInfo.list}" var="product">

                                    <tr>
                                        <security:authorize
                                                access="hasAnyRole('ADMINISTRATOR','MANAGER','SALESPERSON','EXECUTIVE')">
                                            <td><input name="ids" type="checkbox" value="${product.id}" id="ids"></td>
                                        </security:authorize>
                                        <td>${product.id }</td>
                                        <td>${product.productNum }</td>
                                        <td>${product.productName }</td>
                                        <td>${product.cityName }</td>
                                        <td>${product.departureTimeStr }</td>
                                        <td class="text-center">${product.productPrice }</td>
                                        <td>${product.productDesc }</td>
                                        <td class="text-center">${product.productStatusStr }</td>
                                        <td class="text-center">
                                            <security:authorize
                                                    access="hasAnyRole('ADMINISTRATOR','MANAGER','SALESPERSON','EXECUTIVE')">
                                                <button type="button" class="btn bg-olive btn-xs"
                                                        onclick="location.href='${pageContext.request.contextPath}/product/revise.do?id=${product.id}'">
                                                    编辑</button>
                                            </security:authorize>
                                            <security:authorize access="hasRole('USER')">
                                                <c:choose>
                                                    <c:when test="${product.productStatus==0}">
                                                        <button type="button" class="btn bg-gray btn-xs">未开放</button>
                                                    </c:when>
                                                    <c:when test="${product.productStatus==1}">
                                                        <button type="button" class="btn bg-olive btn-xs"
                                                                onclick="location.href='${pageContext.request.contextPath}/product/travelleradd.do?id=${product.id}'">
                                                            订购
                                                        </button>
                                                    </c:when>
                                                </c:choose>

                                            </security:authorize>
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
                            <!--数据列表/-->
                            <!--工具栏/-->
                        </form>
                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

                <!-- 分页管理-->
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
                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                </c:if>
                                <c:if test="${flag==0}">
                                    <a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
                                </c:if>
                            </li>
                            <li>
                                <c:if test="${flag==1}">
                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
                                </c:if>
                                <c:if test="${flag==0}">
                                    <a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>
                                </c:if>
                            </li>
                            <%--展示页码--%>
                            <c:if test="${pageInfo.pageNum+4>pageInfo.pages}">
                                <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pages}" var="cur">
                                    <li>
                                        <c:if test="${flag==1}">
                                            <a href="${pageContext.request.contextPath}/product/findAll.do?page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
                                        </c:if>
                                        <c:if test="${flag==0}">
                                            <a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pageInfo.pageNum+4<=pageInfo.pages}">
                                <c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="cur">
                                    <li>
                                        <c:if test="${flag==1}">
                                            <a href="${pageContext.request.contextPath}/product/findAll.do?page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
                                        </c:if>
                                        <c:if test="${flag==0}">
                                            <a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${cur}&size=${pageInfo.pageSize}">${cur}</a>
                                        </c:if>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${flag==1}">
                                <li><a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            </c:if>
                            <c:if test="${flag==0}">
                                <li><a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                            </c:if>
                            <li>
                                <c:if test="${flag==1}">
                                    <a href="${pageContext.request.contextPath}/product/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
                                </c:if>
                                <c:if test="${flag==0}">
                                    <a href="${pageContext.request.contextPath}/product/searchByName.do?name=<%=URLEncoder.encode(request.getParameter("name"))%>&page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
        <jsp:include page="footer.jsp"/>
    </footer>
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
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(function (){
        $("#search").keydown(function (event){
            if(event.keyCode==13){
                location.href="${pageContext.request.contextPath}/product/searchByName.do?name="+encodeURI(encodeURI($("#search").val()));
            }
        });
    });
    function delorder() {
        if ($("#ids:checked").val() == undefined) {
            alert("什么都没选中")
        } else {
            $("#formCommit").submit();
        }
    }

    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/product/searchByName.do?name="+encodeURI($("#name").val())+"&page=1&size="
            + pageSize;
    }

    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
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

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>