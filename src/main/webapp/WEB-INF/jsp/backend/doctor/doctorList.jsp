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
    <xblock>
        <button class="layui-btn" onclick="addDoctor()"><i class="layui-icon"></i>添加</button>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>医生编号</th>
            <th>医生姓名</th>
            <th>性别</th>
            <th>所属医院</th>
            <th>所属科室</th>
            <th>照片</th>
            <th>职称</th>
            <th>行政单位</th>
            <th>学位</th>
            <th>特长</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="doctor">
            <tr>
                <td>${doctor.id}</td>
                <td>${doctor.doctorName}</td>
                <td>${doctor.doctorSex}</td>
                <td>${doctor.hospitalName}</td>
                <td>${doctor.officesName}</td>
                <td>${doctor.doctorImg}</td>
                <td>${doctor.doctorTitle}</td>
                <td>${doctor.doctorAdministrative}</td>
                <td>${doctor.doctorDegree}</td>
                <td>${doctor.doctorForte}</td>
                <td class="td-manage">
                    <a title="修改"  onclick="editDoctor(${doctor.id})" href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page">
        <div>
            当前${pageInfo.pageNum}页,
            共${pageInfo.pages}页,
            共${pageInfo.total}条记录
        </div>
        <div class="page">
            <div>
                <a href="${mybasePath}backend/skipToNewPage?pageNum=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                   <a href="${mybasePath}backend/skipToNewPage?pageNum=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}"
                           var="pagenum">
                    <c:if test="${pagenum==pageInfo.pageNum}">
                            <span class="current">${pagenum}</span>
                    </c:if>
                    <c:if test="${pagenum!=pageInfo.pageNum}">
                        <a class="num" href="${mybasePath}backend/skipToNewPage?pageNum=${pagenum}">${pagenum}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="${mybasePath}backend/skipToNewPage?pageNum=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="${mybasePath}backend/skipToNewPage?pageNum=${pageInfo.pages}">尾页</a>
            </div>
        </div>
     </div>
</div>
<script>




    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }


    function addDoctor() {
        layer.open({
            type: 2,
            title: '添加医生',
            shadeClose: true,
            shade: 0.8,
            area: ['700px', '600px'],
            content: '${mybasePath}backend/skipaddDoctor' //iframe的url
        });
    }

    function editDoctor(id) {
        layer.open({
            type: 2,
            title: '修改医生信息',
            shadeClose: true,
            shade: 0.8,
            area: ['700px', '600px'],
            content: '${mybasePath}backend/skipModifyDoctor?id='+id
        });
    }

</script>
</body>

</html>
