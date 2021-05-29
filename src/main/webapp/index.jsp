<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>欢迎访问echarts测试网站</title>

    <%--    <link rel="stylesheet" media="all" type="text/css" href="tabbed_pages/tabbed_pages.css" />--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/tabbed_pages.js"></script>
    <script src="js/tabbed_pages.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <!-- 引入jquery.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <%--    <script type="text/javascript">--%>
    <%--        onload = function() {--%>
    <%--            var e, i = 0;--%>
    <%--            while (e = document.getElementById('gallery').getElementsByTagName ('DIV') [i++]) {--%>
    <%--                if (e.className == 'on' || e.className == 'off') {--%>
    <%--                    e.onclick = function () {--%>
    <%--                        var getEls = document.getElementsByTagName('DIV');--%>
    <%--                        for (var z=0; z<getEls.length; z++) {--%>
    <%--                            getEls[z].className=getEls[z].className.replace('show', 'hide');--%>
    <%--                            getEls[z].className=getEls[z].className.replace('on', 'off');--%>
    <%--                        }--%>
    <%--                        this.className = 'on';--%>
    <%--                        var max = this.getAttribute('title');--%>
    <%--                        document.getElementById(max).className = "show";--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            }--%>
    <%--        }--%>
    <%--    </script>--%>
</head>


<body style=" text-align: center; ">
<h2>欢迎访问ssm框架+echarts测试网页</h2>
<h3>作者：柒晓白</h3>
<h3>时间：2018/7/13</h3>
<a href ="myeCharts">查看学生成绩柱状图</a>
<a href ="getPieCharts">查看学生成绩饼图</a>
<a href ="getSPieCharts">查看薪水饼图</a>
<a href ="getLineCharts">查看折线图</a>
<a href ="getMapCharts">查看地图</a>

<p>
<div id="pie" style="width: 500px;height: 300px;"></div>
<%--<a href ="index.jsp">返回首页</a>--%>

<script>
    //初始化echarts
    var pieCharts = echarts.init(document.getElementById("pie"));
    //设置属性
    pieCharts.setOption({
        title: {
            text: '薪资分类',
            subtext: '比例图',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: []
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        calculable: true,
        series: [
            {
                name: '薪水3',
                type: 'pie',
                radius: '55%',
                center: ['50%', '60%'],
                data: []
            }
        ]
    });
    //显示一段动画
    pieCharts.showLoading();
    //异步请求数据
    $.ajax({
        type: "post",
        async: true,
        url: '${pageContext.request.contextPath}/getSData',
        data: [],
        dataType: "json",
        success: function (result) {
            pieCharts.hideLoading();//隐藏加载动画
            pieCharts.setOption({
                title: {
                    text: '学生成绩2',
                    subtext: '成绩比3',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: []
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 1548
                                }
                            }
                        },
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '成绩4',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: result
                    }
                ]
            });
        }
    })
</script>


<div id="gallery">
    <div class="on" title="Constable"><span>John Constable</span></div>
    <div class="off" title="Monet"><span>Claude Monet</span></div>
    <div class="off" title="Vincent"><span>Vincent Van Gogh</span></div>
    <div class="off" title="Chagall"><span>Marc Chagall</span></div>
    <div class="off" title="Picasso"><span>Pablo Picasso</span></div>
</div>

<div id="Constable" class="show">


</div>

<div id="Monet" class="hide">

</div>

<div id="Vincent" class="hide">

</div>

<div id="Chagall" class="hide">

</div>

<div id="Picasso" class="hide">


</div>


</body>
</html>
