<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>图书管理系统</title>

    <style>
        .demo-carousel {
            height: 200px;
            line-height: 200px;
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="js/jquery.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" flush="true"/>

    <!-- 搜索条件表单 -->
    <div class="demoTable layui-form">
        <div class="layui-inline">
            <input class="layui-input" name="bname" id="bname" autocomplete="off" placeholder="请输入书名">
        </div>
        <div class="layui-inline">
            <input class="layui-input" name="author" id="author" autocomplete="off" placeholder="请输入作者">
        </div>
        <div class="layui-inline">
            <div class="layui-input-block">
                <select name="cid" id="cid">
                    <option value="">请选择书本类别</option>
                    <c:forEach items="${category}" var="ctg">
                        <option value="${ctg.cid}">${ctg.cname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</div>


<table class="layui-hide" id="demo" lay-filter="test"></table>

<div class="layui-tab-item layui-show">
    <div id="pageDemo"></div>
</div>
<script type="text/html" id="barDemo">
    <%-- 必须使用 button--%>
    <button class="layui-btn layui-btn-normal layui-btn-sm lend" lay-event="lend">借阅</button>
</script>

<script src="s/layui.js"></script>

<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function () {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , carousel = layui.carousel //轮播
            , upload = layui.upload //上传
            , element = layui.element //元素操作
            , slider = layui.slider //滑块


        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , height: 550
            , url: 'library/listBook.do' //数据接口
            , title: '图书表'
            , page: true
            , limit: 5
            , limits: [5, 10, 15, 20]
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'book_id', title: '书本编号', width: 150, sort: true}
                , {field: 'name', title: '书名', width: 200}
                , {field: 'author', title: '作者', width: 200, sort: true}
                , {field: 'publish', title: '出版社', width: 200, sort: true}
                , {field: 'ISBN', title: 'ISBN', width: 150, sort: true}
                , {field: 'pubdate', title: '出版日期', width: 120, sort: true}
                , {field: 'stock', title: '库存', width: 100}
                , {field: 'price', title: '价格', width: 100, sort: true}
                , {fixed: 'right', title: '操作',width: 200, align: 'center', toolbar: '#barDemo'}
            ]]

            //用于搜索结果重载
            , id: 'testReload'
        });
    })
</script>
</body>
</html>