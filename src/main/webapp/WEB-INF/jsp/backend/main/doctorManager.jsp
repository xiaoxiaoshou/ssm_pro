<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/10
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /********** 保存网站的基本路径 ***********/
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //将该路径地址缓存到 session中 ,例如：http://localhost:8090/tjnu_ssh_1128/
    session.setAttribute("mybasePath", basePath);

%>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>医院预约挂号系统</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${mybasePath}assets_backend/css/font.css">
    <link rel="stylesheet" href="${mybasePath}assets_backend/css/xadmin.css">
    <script type="text/javascript" src="${mybasePath}assets_backend/js/jquery.js"></script>

    <script src="${mybasePath}assets_backend/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${mybasePath}assets_backend/js/xadmin.js"></script>
    <script type="text/javascript" src="${mybasePath}assets_backend/js/cookie.js"></script>
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>
</head>
<body>


<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="${mybasePath}backend">医院预约挂号系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <c:if test="${empty loginsession}">
                <a href="${mybasePath}backend/skipToLogin">登录</a>
            </c:if>
            <c:if test="${not empty loginsession}">
                <a href="javascript:;">欢迎你:${loginsession.userName}</a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="${mybasePath}backend/cancellation">注销</a></dd>
                </dl>
            </c:if>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->

<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>挂号管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li date-refresh="1">
                        <a _href="${mybasePath}backend/skiporderlist">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>全部预约</cite>
                        </a>
                    </li >
                    <li date-refresh="1">
                        <a _href="${mybasePath}backend/skipWaitTreated">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>未就诊</cite>
                        </a>
                    </li >
                    <li date-refresh="1">
                        <a _href="${mybasePath}backend/skipAlreadyTreated">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>已就诊</cite>
                        </a>
                    </li >
                    <li date-refresh="1">
                        <a _href="${mybasePath}backend/skipCancelled">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>已取消</cite>
                        </a>
                    </li >
                    <li date-refresh="1">
                        <a _href="${mybasePath}backend/skipBreakAppointment">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>爽约</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->

<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>首页</li>-
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${mybasePath}backend/skipToHome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->

<!-- 底部开始 -->
<div class="footer">
    <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved</div>
</div>
</body>
</html>
