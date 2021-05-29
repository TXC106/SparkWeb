<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%--    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">--%>
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.common.min.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <!-- 引入jquery.js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>

<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 900px;height:600px;"></div>

<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('main'));
    var option;
    // 显示标题，图例和空的坐标轴
    myChart.showLoading();

    $.get('${pageContext.request.contextPath}/json/chengdu.json', function (geoJson) {

        myChart.hideLoading();

        echarts.registerMap('成都', geoJson);

        myChart.setOption(option = {
            title: {
                text: '',
                subtext: '',
                sublink: ''
            },
            tooltip: {
                trigger: 'item',
                formatter: '{b}<br/>{c} 个职位信息'
            },
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    dataView: {readOnly: false},
                    restore: {},
                    saveAsImage: {}
                }
            },
            visualMap: {
                min: 0,
                max: 2000,
                text: ['High', 'Low'],
                realtime: false,
                calculable: true,
                inRange: {
                    // color: ['lightskyblue', 'yellow', 'Gold', 'Orange', 'orangered', 'red']
                    // color: ['#d1d4da', '#bacae8', '#96b5ef', '#6797ef', '#3375e4', '#035cf5']
                    color: ['#d1d4da', '#6797ef', '#3375e4', '#035cf5']
                }
            },
            series: [
                {
                    name: '职位地域分布',
                    type: 'map',
                    mapType: '成都', // 自定义扩展图表类型
                    label: {
                        show: true
                    },
                    data: [
                        {name: '高新区', value: 1680},
                        {name: '锦江区', value: 464},
                        {name: '简阳市', value: 6},
                        {name: '龙泉驿区', value: 287},
                        {name: '蒲江县', value: 1},
                        {name: '新都区', value: 127},
                        {name: '青羊区', value: 473},
                        {name: '崇州市', value: 37},
                        {name: '双流区', value: 260},
                        {name: '大邑县', value: 6},
                        {name: '都江堰市', value: 16},
                        {name: '彭州市', value: 20},
                        {name: '温江区', value: 120},
                        {name: '天府新区', value: 90},
                        {name: '成华区', value: 272},
                        {name: '邛崃市', value: 15},
                        {name: '武侯区', value: 1074}
                    ],
                    // // 自定义名称映射
                    // nameMap: {
                    //     'Central and Western': '中西区',
                    //     'Eastern': '东区',
                    //     'Islands': '离岛',
                    //     'Kowloon City': '九龙城',
                    //     'Kwai Tsing': '葵青',
                    //     'Kwun Tong': '观塘',
                    //     'North': '北区',
                    //     'Sai Kung': '西贡',
                    //     'Sha Tin': '沙田',
                    //     'Sham Shui Po': '深水埗',
                    //     'Southern': '南区',
                    //     'Tai Po': '大埔',
                    //     'Tsuen Wan': '荃湾',
                    //     'Tuen Mun': '屯门',
                    //     'Wan Chai': '湾仔',
                    //     'Wong Tai Sin': '黄大仙',
                    //     'Yau Tsim Mong': '油尖旺',
                    //     'Yuen Long': '元朗'
                    // }
                }
            ]
        });
    });

    option && myChart.setOption(option);


    <%--var names = [];    //类别数组（实际用来盛放X轴坐标值）--%>
    <%--var nums = [];    //销量数组（实际用来盛放Y坐标值）--%>

    <%--$.ajax({--%>
    <%--    type: "post",--%>
    <%--    async: true,            //异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）--%>
    <%--    url: "${pageContext.request.contextPath}/hello",    //请求发送到TestServlet处--%>
    <%--    data: {},--%>
    <%--    dataType: "json",        //返回数据形式为json--%>
    <%--    success: function (result) {--%>
    <%--        //请求成功时执行该函数内容，result即为服务器返回的json对象--%>
    <%--        if (result) {--%>
    <%--            for (var i = 0; i < result.length; i++) {--%>
    <%--                names.push(result[i].itime);    //挨个取出类别并填入类别数组--%>
    <%--            }--%>
    <%--            for (var i = 0; i < result.length; i++) {--%>
    <%--                nums.push(result[i].inum);    //挨个取出销量并填入销量数组--%>
    <%--            }--%>
    <%--            myChart.hideLoading();    //隐藏加载动画--%>
    <%--            myChart.setOption({        //加载数据图表--%>
    <%--                series: [--%>
    <%--                {--%>
    <%--                    name: '成都市频率',--%>
    <%--                    type: 'map',--%>
    <%--                    mapType: '成都', // 自定义扩展图表类型--%>
    <%--                    label: {--%>
    <%--                        show: true--%>
    <%--                    },--%>
    <%--                    data: result,--%>
    <%--                    // 自定义名称映射--%>
    <%--                    nameMap: {--%>
    <%--                        'Central and Western': '中西区',--%>
    <%--                        'Eastern': '东区',--%>
    <%--                        'Islands': '离岛',--%>
    <%--                        'Kowloon City': '九龙城',--%>
    <%--                        'Kwai Tsing': '葵青',--%>
    <%--                        'Kwun Tong': '观塘',--%>
    <%--                        'North': '北区',--%>
    <%--                        'Sai Kung': '西贡',--%>
    <%--                        'Sha Tin': '沙田',--%>
    <%--                        'Sham Shui Po': '深水埗',--%>
    <%--                        'Southern': '南区',--%>
    <%--                        'Tai Po': '大埔',--%>
    <%--                        'Tsuen Wan': '荃湾',--%>
    <%--                        'Tuen Mun': '屯门',--%>
    <%--                        'Wan Chai': '湾仔',--%>
    <%--                        'Wong Tai Sin': '黄大仙',--%>
    <%--                        'Yau Tsim Mong': '油尖旺',--%>
    <%--                        'Yuen Long': '元朗'--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            ]--%>
    <%--            });--%>

    <%--        }--%>

    <%--    },--%>
    <%--    error: function (errorMsg) {--%>
    <%--        //请求失败时执行该函数--%>
    <%--        alert("图表请求数据失败!");--%>
    <%--        myChart.hideLoading();--%>
    <%--    }--%>
    <%--})--%>
</script>
</body>
</html>