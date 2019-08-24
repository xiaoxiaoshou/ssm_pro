<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../include/head.jsp" />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>

    <link rel="stylesheet" type="text/css" href="${mybasePath}assets_backend/css/mychart.css"/>
</head>
<body>
<div class="welcome-left-container col-lg-12">
    <div class="data-show">
        <ul class="clearfix">
            <li class="col-sm-12 col-md-4 col-xs-12">
                <a href="javascript:;" class="clearfix">
                    <div class="icon-bg bg-org f-l">
                        <span class="iconfont">&#xe606;</span>
                    </div>
                    <div class="right-text-con">
                        <p class="name">今日总预约数</p>
                        <p><span class="color-org">1000</span>数据<span class="iconfont">&#xe619;</span></p>
                    </div>
                </a>
            </li>
            <li class="col-sm-12 col-md-4 col-xs-12">
                <a href="javascript:;" class="clearfix">
                    <div class="icon-bg bg-blue f-l">
                        <span class="iconfont">&#xe61a;</span>
                    </div>
                    <div class="right-text-con">
                        <p class="name">今日爽约数</p>
                        <p><span class="color-blue">10</span>数据<span class="iconfont">&#xe61a;</span></p>
                    </div>
                </a>
            </li>
            <li class="col-sm-12 col-md-4 col-xs-12">
                <a href="javascript:;" class="clearfix">
                    <div class="icon-bg bg-green f-l">
                        <span class="iconfont">&#xe605;</span>
                    </div>
                    <div class="right-text-con">
                        <p class="name">今日取消数</p>
                        <p><span class="color-green">10</span>数据<span class="iconfont">&#xe60f;</span></p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
    <!--图表-->
    <div class="chart-panel panel panel-default">
        <div class="panel-body" id="chart" style="height: 376px;">
        </div>
    </div>

    
</div>
<script src="${mybasePath}assets_backend/js/echarts.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('chart'));
    option = {
        title : {
            text: '一周预约情况',
            subtext: ''
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['总人数','爽约人数','取消人数']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['周一','周二','周三','周四','周五','周六','周日']
            }
        ],
        yAxis : [
            {
                type : 'value',
                axisLabel : {
                    formatter: '{value} 人'
                }
            }
        ],
        series : [
            {
                name:'总人数',
                type:'line',
                data:[50, 38, 41, 45, 41, 30, 28],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:'爽约人数',
                type:'line',
                data:[1, 3, 5, 8, 2, 1, 0],
                markPoint : {
                    data : [
                        {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            },
            {
                name:'取消人数',
                type:'line',
                data:[1, 0, 2, 3, 5, 2, 1],
                markPoint : {
                    data : [
                        {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
</body>
</html>

