<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <base href="<%=basePath%>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册界面</title>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer.css">
    <script src="js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
    <script src="js/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <header class="layui-elip" style="width: 82%;;margin-top:40px">注册页</header>
    <!-- 表单选项 -->
    <form class="layui-form" action="library/submitAddReader.action" method="post">
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="reader_id" required  lay-verify="required" placeholder="请输入学号" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd"  required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-block">
            <div class="layui-inline" style="width: 85%">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="telephone" required lay-verify="required" placeholder="电话" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="name" required lay-verify="required" placeholder="姓名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="address" required lay-verify="required" placeholder="地址" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <div class="layui-input-inline">
                    <input type="text" name="birthday" lay-verify="required" placeholder="出生日期" autocomplete="off" class="layui-input" id="test1">
                </div>
            </div>
        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="toLogin.htm" class="fl">已有账号？立即登录</a></p>
    </form>
</div>
</body>
</html>