<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/11
  Time: 20:38
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
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>医院挂号系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="${mybasePath}assets_backend/css/font.css">
    <link rel="stylesheet" href="${mybasePath}assets_backend/css/xadmin.css">
    <%--<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>--%>
    <script type="text/javascript" src="${mybasePath}assets_backend/js/jquery.js"></script>

    <script src="${mybasePath}assets_backend/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${mybasePath}assets_backend/js/xadmin.js"></script>
    <script type="text/javascript" src="${mybasePath}assets_backend/js/cookie.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
   <%-- <xblock>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./order-add.html')"><i class="layui-icon"></i>添加</button>
    </xblock>--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>用户编号</th>
            <th>身份证</th>
            <th>姓名</th>
            <th>性别</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>手机</th>
            <th>注册时间</th>
            <th>注册ip</th>
            <th>最后登录时间</th>
            <th>最后登录ip</th>
            <th>验证码发送时间</th>
           <%-- <th>操作</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <th>${user.userId}</th>
                <th>${user.userIdenf}</th>
                <th>${user.userName}</th>
                <th>${user.userSex}</th>
                <th>${user.userPassword}</th>
                <th>${user.userEmail}</th>
                <th>${user.userMobile}</th>
                <th>${user.regTime}</th>
                <th>${user.regIp}</th>
                <th>${user.lastLoginTime}</th>
                <th>${user.lastLoginIp}</th>
                <th>${user.updateTime}</th>
               <%-- <td class="td-manage">
                    <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>
   <%-- &lt;%&ndash;  分页 &ndash;%&gt;
    <div class="page">
        <div>
            <c:if test="${pages.totalPage > 0}">
                <a class="prev" href="">&lt;&lt;</a>
                <c:forEach begin="${pages.pageNumStart }" end="${pages.pageNumEnd }"
                           varStatus="status">
                    <c:if test="test=${status.index == pages.currentPage }"></c:if>
                    <a <c:if test="${status.index == pages.currentPage }">class="current"</c:if>
                       <c:if test="${status.index != pages.currentPage }">class="num"</c:if>
                       href="javascript:;" > ${status.index }</a>
                </c:forEach>
                <a class="next" href="">&gt;&gt;</a>
            </c:if>
        </div>
    </div>--%>

</div>
<script>

</script>
</body>

</html>
