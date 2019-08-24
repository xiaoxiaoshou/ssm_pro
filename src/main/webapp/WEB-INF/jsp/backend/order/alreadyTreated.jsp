<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/10
  Time: 11:05
  To change this template use File | Settings | File Templates.
  title：已就诊
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">
<%
    /********** 保存网站的基本路径 ***********/
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    //将该路径地址缓存到 session中 ,例如：http://localhost:8090/tjnu_ssh_1128/
    session.setAttribute("mybasePath", basePath);
%>
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
    <table class="layui-table">
        <thead>
        <tr>
            <th>订单编号</th>
            <th>用户编号</th>
            <th>医院</th>
            <th>科室</th>
            <th>医生</th>
            <th>就诊时间</th>
            <th>就诊时间段</th>
            <th>疾病信息</th>
            <th>订单创建时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.id}</td>
                <td>${order.userID}</td>
                <td>${order.hospitalName}</td>
                <td>${order.officesName}</td>
                <td>${order.doctorName}</td>
                <td>${order.transactDate}</td>
                <td>${order.transactTime}</td>
                <td>${order.diseaseInfo}</td>
                <td>${order.createTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--  分页 --%>
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
    </div>

</div>
<script>

</script>

</body>

</html>
