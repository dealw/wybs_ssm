<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        旅游网</title>

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
    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 内容头部 /-->
        <form action="${pageContext.request.contextPath}/register/save.do"
              method="post" id="registerForm">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default">
                    <div class="panel-heading">用户信息</div>
                    <div class="row data-type">

                        <div class="col-md-2 title">用户名</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="username"
                                   placeholder="用户名" value="" id="username">
                        </div>
                        <div class="col-md-2 title">密码</div>
                        <div class="col-md-4 data">
                            <input type="password" class="form-control" name="password"
                                   placeholder="密码" value="" id="password">
                        </div>
                        <div class="col-md-2 title">邮箱</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="email"
                                   placeholder="邮箱" value="" id="email">
                        </div>
                        <div class="col-md-2 title">真实姓名</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="realName"
                                   placeholder="真实姓名" value="" id="realName">
                        </div>
                        <div class="col-md-2 title">联系电话</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="phoneNum"
                                   placeholder="联系电话" value="" id="phoneNum">
                        </div>
                        <div class="box-tools text-center col-md-6 title">
                            <button type="submit" class="btn bg-maroon col-md-12">注册</button>
                        </div>
                    </div>

                </div>
            </section>
            <!-- 正文区域 /-->

        </form>
    </div>
    <footer class="main-footer">
        <jsp:include page="footer.jsp"/>
    </footer>
</div>

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
<%--    前台校验--%>
$(function (){
    //表单提交验证
    $("#registerForm").submit(function (){
        //如果所有表单内容校验都通过则使用ajax异步处理数据
        if(checkUsername()&&checkPassword()&&checkEmail()&&
            checkName()&&checkPhoneNumber()){
          return true;
        }
        return false;
    });
    /**
     * 设置输入框脱焦事件
     */
    //用户名输入框脱焦事件
    $("#username").blur(checkUsername);
    //密码输入框脱焦事件
    $("#password").blur(checkPassword);
    //email输入框脱焦事件
    $("#email").blur(checkEmail);
    //姓名框脱焦事件
    $("#realName").blur(checkName);
    //电话号码脱焦事件
    $("#phoneNum").blur(checkPhoneNumber);
});

/**
 * 校验输入框
 * @returns {boolean}
 */
//校验用户名正确与否 标准：2-20个字符
function checkUsername(){
    //拿到用户名
    var username = $("#username").val();
    //用正则表达式校验
    var username_reg=/^\w{2,20}$/;
    //校验结果
    var flag = username_reg.test(username);
    if(flag){
        //校验通过 去除输入框样式
        $("#username").css("border","");
    }else {
        //校验失败 让输入框变为红色
        $("#username").css("border","2px solid red");
    }
    //返回flag用于submit时校验
    return flag;
}
//校验密码和用户名逻辑一样
function checkPassword(){
    //拿到密码
    var password = $("#password").val();
    //用正则表达式校验
    var password_reg=/^\w{6,20}$/;
    //校验结果
    var flag = password_reg.test(password);
    if(flag){
        //校验通过 去除输入框样式
        $("#password").css("border","");
    }else {
        //校验失败 让输入框变为红色
        $("#password").css("border","2px solid red");
    }
    //返回flag用于submit时校验
    return flag;
}
//email校验
function checkEmail(){
    //拿到email
    var email = $("#email").val();
    //正则表达式
    var email_reg=/^\w+@\w+\.\w+$/;
    //校验结果
    var flag = email_reg.test(email);
    if(flag){
        //校验通过 去除输入框样式
        $("#email").css("border","");
    }else {
        //校验失败 让输入框变为红色
        $("#email").css("border","2px solid red");
    }
    //返回flag用于submit时校验
    return flag;
}
//姓名校验 不为空
function checkName(){
    //拿到密码
    var name = $("#realName").val();
    //校验结果
    var flag = name.length!=0;
    if(flag){
        //校验通过 去除输入框样式
        $("#realName").css("border","");
    }else {
        //校验失败 让输入框变为红色
        $("#realName").css("border","2px solid red");
    }
    //返回flag用于submit时校验
    return flag;
}
//手机号7-11位的数字
function checkPhoneNumber(){
    //拿到手机号
    var phoneNumber = $("#phoneNum").val();
    // 正则表达式校验
    var phoneNumber_reg=/^\d{7,11}$/;
    //校验
    var flag = phoneNumber_reg.test(phoneNumber);
    if(flag){
        //校验通过 去除输入框样式
        $("#phoneNum").css("border","");
    }else {
        //校验失败 让输入框变为红色
        $("#phoneNum").css("border","2px solid red");
    }
    //返回flag用于submit时校验
    return flag;
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
</script>


</body>

</html>