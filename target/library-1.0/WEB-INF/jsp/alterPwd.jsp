<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>修改密码</title>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer.css">
    <script src="js/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <!-- 表单选项 -->
    <div style="padding: 15px;">
        <form class="layui-form" action="alterpwd.action" method="post">

            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" id="user" required  lay-verify="required" placeholder="原密码" autocomplete="off" class="layui-input">
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
                    <input type="hidden" name="state" value="${state}">
                    <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
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
                    <input type="password" id="rpwd"  required  lay-verify="required" placeholder="重复新密码" autocomplete="off" class="layui-input">
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
            <div class="layui-input-inline login-btn" style="width: 85%">
                <button type="submit" lay-submit lay-filter="sub" class="layui-btn">点击修改</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

