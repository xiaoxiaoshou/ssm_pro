<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/13
  Time: 1:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/head.jsp" />
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>医院预约挂号系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">医院挂号系统</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" id="adminisator" >
        <input id="userName" name="userName" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="button" onclick="codeLogin()">
        <hr class="hr20" >
    </form>
</div>

<script>

    function codeLogin() {
        $.post(
            '${mybasePath}backend/login',
            $('#adminisator').serialize(),
            function (result) {
                if (result.status==1){
                    //跳转到首页

                    window.location.href="${mybasePath}backend/loginToHome?id="+result.data.id;
                } else{
                    layer.msg("用户名或密码错误");
                }

            }
        )
    }

</script>


<!-- 底部结束 -->
</body>
</html>
