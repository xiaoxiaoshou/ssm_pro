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
    <title>增加医生</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />

</head>

<body>
<div class="x-body">
    <form class="layui-form" id="adddoctor">
        <div class="layui-form-item">
            <label for="doctorName" class="layui-form-label">
                <span class="x-red">*</span>医生姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="doctorName" name="doctorName" required="" lay-verify="doctorName"
                       autocomplete="off" class="layui-input">
            </div>

           <%-- <label for="doctorImg" class="layui-form-label">
                <span class="x-red">*</span>医生照片
            </label>
            <div class="layui-input-inline">
                <input type="file" id="doctorImg" name="doctorImg" required="" lay-verify="doctorImg"
                       autocomplete="off" class="layui-input">
            </div>--%>

        </div>

        <div class="layui-form-item layui-input-inline">
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-block">
                <select lay-filter="doctorSex" id="doctorSex" name="doctorSex" required="" lay-verify="doctorSex">
                    <option value="">请选择性别</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="hospitalName" class="layui-form-label">
                <span class="x-red">*</span>所属医院名称
            </label>
            <div class="layui-input-inline">
                <select lay-filter="hospitalName" id="hospitalName" name="hospitalName" required="" lay-verify="hospitalName">
                    <option value="">请选择所属医院</option>
                    <c:forEach items="${hospitals}" var="hospital">
                        <option value="${hospital.hospitalName}">${hospital.hospitalName}</option>
                    </c:forEach>
                </select>
            </div>

            <label for="officesName" class="layui-form-label">
                <span class="x-red">*</span>所属科室名称
            </label>
            <div class="layui-input-inline">
                <select lay-filter="officesName" id="officesName" onchange="changeOffice()" name="officesName" required="" lay-verify="officesName">
                    <option value="">请选择所属科室</option>
                    <c:forEach items="${offices}" var="office">
                        <option value="${office.officesName}">${office.officesName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="layui-form-item">
            <label for="doctorTitle" class="layui-form-label">
                <span class="x-red">*</span>医生职称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="doctorTitle" name="doctorTitle" required="" lay-verify="doctorTitle"
                       autocomplete="off" class="layui-input">
            </div>

            <label for="doctorDegree" class="layui-form-label">
                <span class="x-red">*</span>学位
            </label>
            <div class="layui-input-inline">
                <input type="text" id="doctorDegree" name="doctorDegree" required="" lay-verify="doctorDegree"
                       autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="doctorForte" class="layui-form-label">
                <span class="x-red">*</span>医生特长
            </label>
            <div class="layui-input-block">
                <textarea id="doctorForte" placeholder="请输入内容" class="layui-textarea" name="doctorForte"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label for="doctorAbout" class="layui-form-label">
                <span class="x-red">*</span>关于医生
            </label>
            <div class="layui-input-block">
                <textarea id="doctorAbout" placeholder="请输入内容" class="layui-textarea" name="doctorAbout"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <br/>
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                增加
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


            var doctorName = $('#doctorName').val();
            var doctorSex = $('#doctorSex').val();
            var hospitalName = $('#hospitalName').val();
            var officesName = $('#officesName').val();
            var doctorTitle = $('#doctorTitle').val();
            var doctorDegree = $('#doctorDegree').val();
            var doctorForte = $('#doctorForte').val();
            var doctorAbout = $('#doctorAbout').val();


            var formData = new FormData();
           /* formData.append("file",$("#doctorImg")[0].files[0]);*/
            formData.append("doctorName",doctorName);
            formData.append("doctorSex",doctorSex);
            formData.append("hospitalName",hospitalName);
            formData.append("officesName",officesName);
            formData.append("doctorTitle",doctorTitle);
            formData.append("doctorDegree",doctorDegree);
            formData.append("doctorForte",doctorForte);
            formData.append("doctorAbout",doctorAbout);

            /*$.ajax({
                url:'${mybasePath}backend/addDoctor',
                data:formData,
                type:'post',
               /!* dataType:'formData',*!/
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success:function (result) {
                    if(result.status==1){
                        layer.alert("增加成功", {icon: 6},function () {
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }
                }
            })*/

            $.post(
                '${mybasePath}backend/addDoctor',
                $('#adddoctor').serialize(),
                function (result) {
                    if(result.status==1){
                        layer.alert("增加成功", {icon: 6},function () {
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



        /*---------------------------------------------级联属性开始-------------------------------------------------*/
        //监听医院
        form.on('select(hospitalName)',function (data) {
            console.log(data.value)
            $.post(
                '${mybasePath}backend/findOfficesByHospitalName',
                {'hospitalName':data.value},
                function (result) {
                    if(result.status==1){
                        $('#officesName').html();
                        var Optionoffices = '<option class="layui-select-tips">'+'请选所属科室'+'</option>';
                        $.each(result.data,function (index,item) {
                            Optionoffices +='<option value='+item+'>'+item+'</option>';
                        })
                        $('#officesName').html(Optionoffices);
                        form.render();
                    }
                }
            )
            return false;
        })
        
        //监听所属科室
        form.on('select(officesName)',function (data) {
           console.log(data.value)
            $.post(
                '${mybasePath}backend/findHospitalByOffice',
                {'officeName':data.value},
                function (result) {
                    if(result.status==1){
                      var  hospitalName = result.data.hospitalName;

                        $('#hospitalName').val(hospitalName);
                        form.render();

                    }
                }
            )
            return false;
        })
        /*---------------------------------------------级联属性结束-------------------------------------------------*/
    });

</script>

</body>

</html>
