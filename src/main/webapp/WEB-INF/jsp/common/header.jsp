<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/modules/code.css">
    <link rel="stylesheet" href="css/modules/laydate/default/laydate.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <title></title>
    <style type="text/css">
        .layui-table-cell{
            height:36px;
            line-height: 36px;
        }
    </style>
</head>
<body>
<div class="layui-header">
    <c:if test="${admin!=null}">
        <div class="layui-logo" id="user">图书后台管理系统</div>
    </c:if>
    <c:if test="${reader!=null}">
        <div class="layui-logo" id="user">图书管理系统</div>
    </c:if>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">

        <c:if test="${admin!=null}">
            <li class="layui-nav-item"><a href="book.action">图书列表</a></li>
            <li class="layui-nav-item"><a href="bookType.action">类别列表</a></li>
            <li class="layui-nav-item"><a href="readerIndex.action">读者列表</a></li>
            <li class="layui-nav-item"><a href="listDisBackAdmin.action">借阅管理</a></li>
            <li class="layui-nav-item"><a onclick="alterPwd(${admin.id});">修改密码</a></li>
        </c:if>
        <c:if test="${reader!=null}">
            <li class="layui-nav-item"><a href="book.action">图书列表</a></li>
            <li class="layui-nav-item"><a href="listDisBack.action">已借阅图书</a></li>
            <li class="layui-nav-item"><a onclick="alterPwd(${reader.reader_id});">修改密码</a></li>
        </c:if>

    </ul>

    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;" id="use">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                ${reader.reader_name }
               ${admin.name}
            </a>
        </li>
        <li class="layui-nav-item"><a href="logout.action">退出</a></li>
    </ul>
</div>
<div style="padding: 15px;">
</div>
</body>
<script src="js/layui.js"></script>
<script>
    function alterPwd(id){//修改密码
        layer.open({
            type: 2,
            title: '修改密码',
            skin: 'layui-layer-demo', //加上边框
            area: ['520px', '420px'], //宽高
            content: 'toAlterPwd.action?id='+id
        });
    }
</script>
</html>
