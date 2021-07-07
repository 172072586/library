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
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
    <script src="js/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <header class="layui-elip" style="width: 82%;margin-top:40px">注册页</header>
    <!-- 表单选项 -->
    <form class="layui-form" action="register.action" method="post">
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="id" name="reader_id" required  lay-verify="required" placeholder="请输入学号" autocomplete="off" class="layui-input"/>
                <div id="errorId" style="color: red"></div>
            </div>
        </div>

        <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                <div style="color: red" id="errorPwd"></div>
            </div>
        </div>

        <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pass"  required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
                <div style="color: red" id="errorPass"></div>
            </div>
        </div>
        <div class="layui-input-block">
            <div class="layui-inline" style="width: 85%">
                <input type="radio" name="sex" value="男" title="男"  checked>
                <input type="radio" name="sex" value="女" title="女">
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="tel" name="telephone" required lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
                <div style="color: red" id="errorTel"></div>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="name" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                <div style="color: red" id="errorName"></div>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="address" name="address" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
                <div style="color: red" id="errorAddress"></div>
            </div>
        </div>
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <div class="layui-input-inline">
                    <input type="text" id="age" name="age" lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input" >
                    <div style="color: red" id="errorAge"></div>
                </div>
            </div>
        </div>
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn" id="submit">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="toLogin.action" class="fl">已有账号？返回登录</a></p>
        <p style="width: 85%"><a href="register.action" class="fr"></a>${msg}</p>

    </form>
</div>

<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        layer.tips('学号就是借阅号哦!', '#user');
    });


    $(function () {
        //验证账号长度
        $("#id").blur(function () {
           if($("#id").val().trim().length>11){
               $("#errorId").html("账号不能超过11位");
           }
           })
        $("#id").focus(function () {
            $("#errorId").empty();
        })

        //验证密码长度
        $("#pwd").blur(function () {
            if($("#pwd").val().trim().length>12 || $("#pwd").val().trim().length<9){
                $("#errorPwd").html("密码超过11位/小于9位");
            }
        })
        $("#pwd").focus(function () {
            $("#errorPwd").empty();
        })

        //验证两次密码是否一致

        $("#pass").blur(function () {
            var pwd = $("#pwd").val();
            var pass = $("#pass").val();
            if(pwd!==pass){
                $("#errorPass").text("两次密码不一致");
            }
        })
        $("#pass").focus(function () {
            $("#errorPass").empty();
        })

        //验证手机号长度
        $("#tel").blur(function () {
            if($(!"#tel").val().length=11){
                $("#errorTel").html("手机号需要等于11位");
            }
        })
        $("#tel").focus(function () {
            $("#errorTel").empty();
        })





        })
</script>
</body>
</html>