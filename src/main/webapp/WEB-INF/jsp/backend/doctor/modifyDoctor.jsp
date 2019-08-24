<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/head.jsp" />
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>修改医生</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />

</head>

<body>
<div class="x-body">
    <form class="layui-form" id="adddoctor">
        <div class="layui-form-item">
            <%--<label for="id" class="layui-form-label">
                <span class="x-red"></span>
            </label>--%>
            <div class="layui-input-inline">
                <input value="${doctor.id}" type="hidden" id="id" name="id" required="" lay-verify="id"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="doctorName" class="layui-form-label">
                <span class="x-red">*</span>医生姓名
            </label>
            <div class="layui-input-inline">
                <input value="${doctor.doctorName}" type="text" id="doctorName" name="doctorName" required="" lay-verify="doctorName"
                       autocomplete="off" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-block">
                <select lay-filter="aihao" id="doctorSex" name="doctorSex" required="" lay-verify="doctorSex">
                    <option value="">请选择性别</option>
                    <option value="男"
                            <c:if test="${doctor.doctorSex=='男'}">selected</c:if>
                        >男</option>
                    <option value="女"
                            <c:if test="${doctor.doctorSex=='女'}">selected</c:if>
                    >女</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="hospitalName" class="layui-form-label">
                <span class="x-red">*</span>所属医院名称
            </label>
            <div class="layui-input-inline">
                <input value="${doctor.hospitalName}" type="text" id="hospitalName" name="hospitalName" required="" lay-verify="hospitalName"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="officesName" class="layui-form-label">
                <span class="x-red">*</span>所属科室名称
            </label>
            <div class="layui-input-inline">
                <input  value="${doctor.officesName}" type="text" id="officesName" name="officesName" required="" lay-verify="officesName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="doctorTitle" class="layui-form-label">
                <span class="x-red">*</span>医生职称
            </label>
            <div class="layui-input-inline">
                <input  value="${doctor.doctorTitle}" type="text" id="doctorTitle" name="doctorTitle" required="" lay-verify="doctorTitle"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="doctorDegree" class="layui-form-label">
                <span class="x-red">*</span>学位
            </label>
            <div class="layui-input-inline">
                <input  value="${doctor.doctorDegree}" type="text" id="doctorDegree" name="doctorDegree" required="" lay-verify="doctorDegree"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="doctorForte" class="layui-form-label">
                <span class="x-red">*</span>医生特长
            </label>
            <div class="layui-input-block">
                <textarea id="doctorForte" placeholder="请输入内容" class="layui-textarea" name="doctorForte">
                    ${doctor.doctorForte}
                </textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label for="doctorAbout" class="layui-form-label">
                <span class="x-red">*</span>关于医生
            </label>
            <div class="layui-input-block">
                <textarea id="doctorAbout" placeholder="请输入内容" class="layui-textarea" name="doctorAbout">
                    ${doctor.doctorAbout}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <br>
            <button  class="layui-btn " lay-filter="add" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            doctorName: function(value){
                if(value.length < 1){
                    return '请输入医生名字';
                }
            },
            doctorSex:function(value){
                if(value == null || value == ""){
                    return '请选择医生性别';
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            $.ajax({
                url:'${mybasePath}backend/modifyDoctor',
                data:$("#adddoctor").serialize(),
                type:'post',
                success:function (result) {
                    if(result.status==1){
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                }
            })

            return false;
        });

    });
</script>

</body>

</html>
