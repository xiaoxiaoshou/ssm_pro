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
        <button class="layui-btn" onclick="addOffice()"><i class="layui-icon"></i>添加</button>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>科室编号</th>
            <th>科室名称</th>
            <th>所属医院</th>
            <th>医生数量</th>
            <th>科室荣誉</th>
            <th style="text-align: center">科室简介</th>
            <th>科室诊疗范围</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="office">
            <tr>
                <th>${office.id}</th>
                <th>${office.officesName}</th>
                <th>${office.hospitalName}</th>
                <th>${office.doctorNum}</th>
                <th>${office.officesHonor}</th>
                <th style="text-align: center">
                    <c:if test="${office.officesAbout == '' || empty office.officesAbout}">暂无相关信息</c:if>
                    <c:if test="${not empty office.officesAbout}"> ${office.officesAbout}</c:if>
                </th>
                <th>${office.officesDiagnosisScope}</th>
                <td class="td-manage">
                    <a title="修改"  onclick="editOffice(${office.id})" href="javascript:;">
                        <i class="layui-icon">&#xe63c;</i>
                    </a>
                    <a title="删除" onclick="deleteOffice(${office.id})" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--  分页 --%>
    <div class="page">
        <div>
            当前${pageInfo.pageNum}页,
            共${pageInfo.pages}页,
            共${pageInfo.total}条记录
        </div>
        <div class="page">
            <div>
                <a href="${mybasePath}backend/skipOfficeList?pageNum=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="${mybasePath}backend/skipOfficeList?pageNum=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}"
                           var="pagenum">
                    <c:if test="${pagenum==pageInfo.pageNum}">
                        <span class="current">${pagenum}</span>
                    </c:if>
                    <c:if test="${pagenum!=pageInfo.pageNum}">
                        <a class="num" href="${mybasePath}backend/skipOfficeList?pageNum=${pagenum}">${pagenum}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="${mybasePath}backend/skipOfficeList?pageNum=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="${mybasePath}backend/skipOfficeList?pageNum=${pageInfo.pages}">尾页</a>
            </div>
        </div>
    </div>

</div>
<script>


    /*添加科室*/
    function addOffice() {
        layer.open({
            type: 2,
            title: '添加科室',
            shadeClose: true,
            shade: 0.8,
            area: ['700px', '600px'],
            content: '${mybasePath}backend/skipaddOffice'
        });
    }

    /*修改*/
    function editOffice(id) {
        layer.open({
            type: 2,
            title: '修改科室信息',
            shadeClose: true,
            shade: 0.8,
            area: ['700px', '600px'],
            content: '${mybasePath}backend/skipModifyOffice?id='+id
        });
        //window.location.href="${mybasePath}backend/modifyOffice?id="+id;
    }

    /*删除*/
    function deleteOffice(id) {
        layer.confirm('确认要删除该科室吗？',function(id){

            //捉到所有被选中的，发异步进行删除
            $.post(
                '${mybasePath}backend/deleteOffice',
                {'id':id},
                function (result) {
                    if(result.status==1){
                        layer.msg('删除成功', {icon: 1});
                        x_admin_reload();
                    }
                }
            )

        });
    }

</script>
</body>
</html>
