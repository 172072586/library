<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>添加图书类型页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <link rel="stylesheet" href="css/layui.css"  media="all">
    <link rel="css/modules/laydate/default/laydate.css" >
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
    <script src="js/layui.js" ></script>
    <style>
        body{padding: 20px;}
        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
        .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
        .demo-footer a{padding: 0 5px; color: #01AAED;}
    </style>
</head>
<body>
<form class="layui-form" action="addType.action" method="post" id="addbook" lay-filter="example">
    <div class="layui-form-item">
    <div class="layui-form-item layui-form-text">
        <div class="layui-inline">
            <label class="layui-form-label">图书类型：</label>
            <div class="layui-input-inline">
                <input type="text" id="cname" name="cname" class="layui-input"><br>
                <input type="submit" value="添加"class="layui-btn"/>
                <input type="reset" class="layui-btn"/>
            </div>
        </div>
    </div>
    </div>
    <div id="type">${type}</div>
</form>

<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;

    });

    $(function () {
        if($("#type").text()!= ""){
            alert("注册成功");
        }
    })
</script>
</body>
</html>
