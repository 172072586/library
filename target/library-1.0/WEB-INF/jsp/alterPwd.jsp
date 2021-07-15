<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/layui.js" ></script>
</head>
<body>
<div class="login-main">
    <!-- 表单选项 -->
    <div style="padding: 15px;">
        <c:if test="${reader!=null}">
        <form class="layui-form" action="alterReaderPwd.action" method="post">
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="text" id="id" name="reader_id" required  lay-verify="required" value="${reader.reader_id}" readonly="readonly"  autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="text"  name="reader_name" required  lay-verify="required" value="${reader.reader_name}" readonly="readonly"  autocomplete="off" class="layui-input"/>
                </div>
            </div>
            <!--原密码-->
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" name="oldPwd" id="oldPwd" required  lay-verify="required" placeholder="原密码" autocomplete="off" class="layui-input">
                    <div style="color: red" id="errorOld"></div>
                </div>
            </div>
            <!-- 新密码 -->
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" id="pwd" name="newPwd" required  lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
                    <div style="color: red" id="errorPwd"></div>
                </div>

            </div>
            <!-- 确认密码 -->
            <div class="layui-input-inline">
                <div class="layui-inline" style="width: 85%">
                    <input type="password" id="pass"  required  lay-verify="required" placeholder="重复新密码" autocomplete="off" class="layui-input">
                    <div style="color: red" id="errorPass"></div>
                </div>
            </div>
            <!--修改读者-->
                <div class="layui-input-inline login-btn" style="width: 85%">
                    <button type="submit"  lay-submit lay-filter="sub" class="layui-btn">点击修改</button>
                </div>
        </form>
        </c:if>


        <!--提交修改管理员密码-->
        <c:if test="${admin!=null}">
            <form class="layui-form" action="alterAdminPwd.action" method="post">
                    <div class="layui-input-inline">
                        <div class="layui-inline" style="width: 85%">
                            <input type="text" id="name" name="name" required  lay-verify="required" value="${admin.name}" readonly="readonly"  autocomplete="off" class="layui-input"/>
                        </div>
                    </div>

                <!--原密码-->
                <div class="layui-input-inline">
                    <div class="layui-inline" style="width: 85%">
                        <input type="password" name="oldPwd" id="adminPwd" required  lay-verify="required" placeholder="原密码" autocomplete="off" class="layui-input">
                        <div style="color: red" id="erroradminPwd"></div>
                    </div>
                </div>
                <!-- 新密码 -->
                <div class="layui-input-inline">
                    <div class="layui-inline" style="width: 85%">
                        <input type="password" id="adminnewPwd" name="newPwd" required  lay-verify="required" placeholder="新密码" autocomplete="off" class="layui-input">
                        <div style="color: red" id="errornewPwd"></div>
                    </div>

                </div>
                <!-- 确认密码 -->
                <div class="layui-input-inline">
                    <div class="layui-inline" style="width: 85%">
                        <input type="password" id="sure"  required  lay-verify="required" placeholder="重复新密码" autocomplete="off" class="layui-input">
                        <div style="color: red" id="errorSure"></div>
                    </div>
                </div>

               <!--修改管理员-->
                    <div class="layui-input-inline login-btn" style="width: 85%">
                        <button type="submit" lay-submit lay-filter="sub" class="layui-btn">点击修改</button>
                    </div>
            </form>
        </c:if>
    </div>
    <div id="msg">${msg}</div>
</div>
<script type="text/javascript">
        //验证原密码
        $("#oldPwd").blur(function () {
            if($("#oldPwd").val().trim().length>12 || $("#oldPwd").val().trim().length<2){
                $("#errorOld").html("密码超过11位/小于9位");
            }
        })
        $("#oldPwd").focus(function () {
            $("#errorOld").empty();
        })

        //验证新密码
        $("#pwd").blur(function () {
            if($("#pwd").val().trim().length>12 || $("#pwd").val().trim().length<2){
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


        //验证管理员密码
        //验证原密码
        $("#adminPwd").blur(function () {
            if($("#adminPwd").val().trim().length>12 || $("#adminPwd").val().trim().length<2){
                $("#erroradminPwd").html("密码超过11位/小于9位");
            }
        })
        $("#adminPwd").focus(function () {
            $("#erroradminPwd").empty();
        })

        //验证新密码
        $("#adminnewPwd").blur(function () {
            if($("#adminnewPwd").val().trim().length>12 || $("#adminnewPwd").val().trim().length<2){
                $("#errornewPwd").html("密码超过11位/小于9位");
            }
        })
        $("#adminnewPwd").focus(function () {
            $("#errornewPwd").empty();
        })


        //验证两次密码是否一致
        $("#sure").blur(function () {
            var pwd = $("#adminnewPwd").val();
            var pass = $("#sure").val();
            if(pwd!==pass){
                $("#errorSure").text("两次密码不一致");
            }
        })
        $("#sure").focus(function () {
            $("#errorSure").empty();
        })


</script>
</body>
</html>

