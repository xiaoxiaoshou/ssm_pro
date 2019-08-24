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
    <title>修改医院</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />

</head>

<body>
<div class="x-body">
    <form class="layui-form" id="adddHospital">
        <div class="layui-form-item">
            <label for="id" class="layui-form-label">
                <span class="x-red"></span>
            </label>
            <div class="layui-input-inline">
                <input type="hidden" value="${hospitals.id}" id="id" name="id" required="" lay-verify="id"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="hospitalName" class="layui-form-label">
                <span class="x-red">*</span>医生名称
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${hospitals.hospitalName}" id="hospitalName" name="hospitalName" required="" lay-verify="hospitalName"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="hospitalPhone" class="layui-form-label">
                <span class="x-red">*</span>医院电话
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${hospitals.hospitalPhone}" id="hospitalPhone" name="hospitalPhone" required="" lay-verify="hospitalPhone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-input-inline">
            <label for="hospitalDeanName" class="layui-form-label"><span class="x-red">*</span>院长名字</label>
            <div class="layui-input-inline">
                <input type="text" value="${hospitals.hospitalDeanName}" id="hospitalDeanName" name="hospitalDeanName" required="" lay-verify="hospitalDeanName"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="hospitalYear" class="layui-form-label">
                <span class="x-red">*</span>建院年份
            </label>
            <div class="layui-input-inline">
                <input type="text" value="${hospitals.hospitalYear}" id="hospitalYear" name="hospitalYear" required="" lay-verify="hospitalYear"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="hospitalNature" class="layui-form-label">
                <span class="x-red">*</span>医院类型
            </label>
            <div class="layui-input-inline">
                <select lay-filter="aihao"  id="hospitalNature" name="hospitalNature" required="" lay-verify="hospitalNature">
                    <option value="">请选择医院类型</option>
                    <option value="综合医院"
                            <c:if test="${hospitals.hospitalNature=='综合医院'}">selected</c:if>
                    >综合医院</option>
                    <option value="专科医院"
                            <c:if test="${hospitals.hospitalNature=='专科医院'}">selected</c:if>
                    >专科医院</option>
                </select>
            </div>

            <label for="hospitalGrade" class="layui-form-label">
                <span class="x-red">*</span>医院等级
            </label>
            <div class="layui-input-inline">
                <select lay-filter="aihao" id="hospitalGrade" name="hospitalGrade" required="" lay-verify="hospitalGrade">
                    <option value="">请选择医院等级</option>
                    <option value="一级医院"
                            <c:if test="${hospitals.hospitalGrade=='一级医院'}">selected</c:if>
                    >一级医院</option>
                    <option value="二级医院"
                            <c:if test="${hospitals.hospitalGrade=='二级医院'}">selected</c:if>
                    >二级医院</option>
                    <option value="三级医院"
                            <c:if test="${hospitals.hospitalGrade=='三级医院'}">selected</c:if>
                    >三级医院</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="hospitalAddress" class="layui-form-label">
                <span class="x-red">*</span>医院地址
            </label>
            <div class="layui-input-block">
                <textarea id="hospitalAddress"  placeholder="请输入内容" class="layui-textarea" name="hospitalAddress">
                    ${hospitals.hospitalAddress}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="hospitalAbout" class="layui-form-label">
                <span class="x-red">*</span>医院简介
            </label>
            <div class="layui-input-block">
                <textarea id="hospitalAbout" placeholder="请输入内容" class="layui-textarea" name="hospitalAbout">
                    ${hospitals.hospitalAbout}
                </textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label for="hospitalHonor" class="layui-form-label">
                <span class="x-red">*</span>医院荣誉
            </label>
            <div class="layui-input-block">
                <textarea id="hospitalHonor" placeholder="请输入内容" class="layui-textarea" name="hospitalHonor">
                    ${hospitals.hospitalHonor}
                </textarea>
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center">
            <br/>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
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

        /*//自定义验证规则
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
        });*/

        //监听提交
        form.on('submit(add)', function(data){
            console.log(data);

            $.post(
                '${mybasePath}backend/modifyHospital',
                $('#adddHospital').serialize(),
                function (result) {
                    if(result.status==1){
                        layer.alert("修改成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            window.location.href='${mybasePath}backend/skipHospitalList'
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
