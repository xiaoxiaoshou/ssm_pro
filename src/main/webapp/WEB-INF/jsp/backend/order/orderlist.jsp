<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/10
  Time: 11:05
  To change this template use File | Settings | File Templates.
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
            <th>订单状态</th>
            <th>订单创建时间</th>
           <%-- <th >操作</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="order">
            <tr>
                <td>${order.id}</td>
                <td>${order.userID}</td>
                <td>${order.hospitalName}</td>
                <td>${order.officesName}</td>
                <td>${order.doctorName}</td>
                <td>${order.transactDate}</td>
                <td>${order.transactTime}</td>
                <td>${order.diseaseInfo}</td>
                <td>
                    <c:if test="${order.isFinish ==0 }">
                        <c:if test="${order.isCancel ==0 }">
                            <c:if test="${order.isSuccess ==0 }">
                                <c:if test="${order.orderVer ==1 }">订单已提交(待审核)</c:if>
                            </c:if>
                        </c:if>
                    </c:if>
                    <c:if test="${order.isFinish ==0 }">
                        <c:if test="${order.isCancel ==0 }">
                            <c:if test="${order.isSend ==0 }">
                                <c:if test="${order.isSuccess ==1 }">
                                    <font color="#eb6468">预约成功(待通知)</font>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:if>
                    <c:if test="${order.isFinish ==0 }">
                        <c:if test="${order.isCancel ==0 }">
                            <c:if test="${order.isSend ==1 }">
                                <c:if test="${order.isSuccess ==1 }">
                                    <font color="#eb6468">预约成功(已通知)</font>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:if>
                    <c:if test="${order.isCancel ==1 }">
                        <font color="#000">已取消</font>
                    </c:if> <c:if test="${order.isFinish ==1 }">
                    <font color="#eb6468">订单已完成</font>
                </c:if></td>
                </td>
                <td>${order.createTime}</td>
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
    <%--  分页 --%>
    <div class="page">
        <div>
            当前${pageInfo.pageNum}页,
            共${pageInfo.pages}页,
            共${pageInfo.total}条记录
        </div>
        <div class="page">
            <div>
                <a href="${mybasePath}backend/skiporderlist?pageNum=1">首页</a>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <a href="${mybasePath}backend/skiporderlist?pageNum=${pageInfo.pageNum-1}">上一页</a>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}"
                           var="pagenum">
                    <c:if test="${pagenum==pageInfo.pageNum}">
                        <span class="current">${pagenum}</span>
                    </c:if>
                    <c:if test="${pagenum!=pageInfo.pageNum}">
                        <a class="num" href="${mybasePath}backend/skiporderlist?pageNum=${pagenum}">${pagenum}</a>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <a href="${mybasePath}backend/skiporderlist?pageNum=${pageInfo.pageNum+1}">下一页</a>
                </c:if>
                <a href="${mybasePath}backend/skiporderlist?pageNum=${pageInfo.pages}">尾页</a>
            </div>
        </div>
    </div>

</div>
<script>

</script>

</body>

</html>
