<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/12
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/head.jsp" />
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>添加科室</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

</head>

<body>
<div class="x-body">
    <form class="layui-form" id="addOffice">
        <div class="layui-form-item">
            <label for="officesName" class="layui-form-label">
                <span class="x-red">*</span>科室名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="officesName" name="officesName" required="" lay-verify="officesName" autocomplete="off" class="layui-input">
            </div>

            <label for="hospitalName" class="layui-form-label">
                <span class="x-red">*</span>所属医院
            </label>
            <div class="layui-input-inline">
                <select lay-filter="aihao" id="hospitalName" name="hospitalName" required="" lay-verify="hospitalName">
                    <option value="">请选择所属医院</option>
                    <c:forEach items="${hospitals}" var="hospital">
                        <option value="${hospital.hospitalName}">${hospital.hospitalName}</option>
                    </c:forEach>
                </select>
            </div>

        </div>

        <div class="layui-form-item layui-input-inline">
            <label for="doctorNum" class="layui-form-label">
                <span class="x-red">*</span>医生数量
            </label>
            <div class="layui-input-inline">
                <input type="text" id="doctorNum" name="doctorNum" required="" lay-verify="doctorNum" autocomplete="off" class="layui-input">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="officesHonor" class="layui-form-label">
                <span class="x-red">*</span>科室荣誉
            </label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" lay-verify="officesHonor" name="officesHonor"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label for="officesEquipment" class="layui-form-label">
                <span class="x-red">*</span>科室设备
            </label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" lay-verify="officesEquipment" name="officesEquipment"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label for="officesAbout" class="layui-form-label">
                <span class="x-red">*</span>科室简介
            </label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" lay-verify="officesAbout" name="officesAbout"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label for="officesDiagnosisScope" class="layui-form-label">
                <span class="x-red">*</span>科室诊疗范围
            </label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" class="layui-textarea" lay-verify="officesDiagnosisScope" name="officesDiagnosisScope"></textarea>
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center">
            <br/>
            <button class="layui-btn" lay-filter="add" lay-submit="">
                增加
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer'], function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            officesName: function(value) {
                if(value.length < 1) {
                    return '请输入医生名字';
                }
            },
            hospitalName: function(value) {
                if(value.length < 1) {
                    return '请输入所属医院名称';
                }
            },
            doctorNum:function (value) {
                var reg = /^\d+$|^\d+[.]?\d+$/;
                if(!reg.test(value)){
                    return '医生数量是填写数字';
                }
            },
            officesHonor:function (value) {
                if(value.length<1){
                    return '请填写科室荣誉'
                }
            },
            officesEquipment:function (value) {
                if(value.length<1){
                    return '请填写科室设备'
                }
            },
            officesAbout:function (value) {
                if(value.length<1){
                    return '请填写科室简介'
                }
            },
            officesDiagnosisScope:function (value) {
                if(value.length<1){
                    return '请填写科室治疗范围'
                }
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            $.post(
                '${mybasePath}backend/addOffice',
                $('#addOffice').serialize(),
                function (result) {
                    if(result.status==1){
                        layer.alert("添加成功成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                }
            )
            return false;
        });

    });



</script>

</body>

</html>
