<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>添加读者页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <link rel="stylesheet" href="css/layui.css"  media="all">
    <link rel="css/modules/laydate/default/laydate.css" >
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/modules/layer/default/layer.css">
    <script src="js/laydate.js"></script> <!-- 要在layui 的前边不然时间插件失效 -->
    <script src="js/layui.js" ></script>
    <script src="js/jquery.js"></script>
    <style>
        body{padding: 20px;}
        .demo-input{padding-left: 10px; height: 38px; min-width: 262px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
        .demo-footer{padding: 50px 0; color: #999; font-size: 14px;}
        .demo-footer a{padding: 0 5px; color: #01AAED;}
    </style>
</head>
<body>
<form class="layui-form" action="submitAddReader.action" method="post" id="addbook" lay-filter="example">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">借阅号：</label>
            <div class="layui-input-inline">
                <input type="text" id="id" name="reader_id"  placeholder="请输入借阅号" required lay-verify="required" autocomplete="off" class="layui-input">
                <div id="errorId" style="color: red"></div>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                <div id="errorName" style="color: red"></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <c:set  var="sex" value="${reader.sex}" />
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-block" >
                <select name="sex" id="sex" required lay-verify="required">
                    <option value="">请选择性别</option>
                    <option value="男" >男</option>
                    <option value="女" >女</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出生日期：</label>
            <div class="layui-input-inline">
                <input type="text" name="birthday" required lay-verify="required" placeholder="请输入出生日期" autocomplete="off" class="layui-input" id="test1">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-inline">
                <input type="text" id="tel" name="telephone" required lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
                <div id="errorTel" style="color: red"></div>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">可借图书：</label>
            <div class="layui-input-inline">
                <input type="text" id="book" name="card_state" required lay-verify="required" placeholder="请输入可借图书" autocomplete="off" class="layui-input">
                <div id="errorBook" style="color: red"></div>
            </div>
        </div>
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">地址：</label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="address" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">密码：</label>
            <div class="layui-input-inline">
                <input type="text" id="pwd" name="passwor" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                <div id="errorPwd" style="color: red"></div>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <c:if test="${reader==null}"><!-- 查看是没有添加按钮的 -->
            <input type="submit" class="layui-btn"/>
            <input type="reset" class="layui-btn"/>
            </c:if>
            <!-- 修改需要修改按钮是没有添加按钮的 -->
            <c:if test="${code==1}">
                <button class="layui-btn" lay-submit="" required lay-filter="updatereader">立即修改</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </c:if>
        </div>
    </div>
</form>
<div id="msg">${msg}</div>
<script><!--layUI框架js-->
    lay('#version').html('-v'+ laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#test1' //指定元素
    });

    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
    })
</script>
<script type="text/javascript">
    <!--管理员添加读者功能js-->
    $(function () {
        if($("#msg").text() == "添加成功"){
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);//关闭弹出层
            alert("添加成功");
        }else if($("#msg").text() == "添加失败"){
            alert("添加失败 请重新添加");
        }
    })

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



        //验证手机号长度
        $("#tel").blur(function () {
            if($("#tel").val().length != 11){
                $("#errorTel").html("手机号需要等于11位");
            }
        })
        $("#tel").focus(function () {
            $("#errorTel").empty();
        })

        //验证可借图书
        $("#book").blur(function () {
            if($("#book").val() < 3){
                $("#errorBook").html("可借图书最少3本");
            }
        })
        $("#book").focus(function () {
            $("#errorBook").empty();
        })

    })
</script>
</body>
</html>
