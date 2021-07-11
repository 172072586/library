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
    <title>添加图书页面</title>
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
<form class="layui-form" action="submitAddBook.action" method="post" id="addbook" lay-filter="example">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">书名：</label>
            <div class="layui-input-inline">
                <input type="text" name="book_name"  required lay-verify="required" placeholder="请输入书名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">作者：</label>
            <div class="layui-input-inline">
                <input type="text" name="author" required lay-verify="required" placeholder="请输入作者" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">价格：</label>
            <div class="layui-input-inline">
                <input type="text" name="price" required lay-verify="required" placeholder="请输入价格" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出版日期：</label>
            <div class="layui-input-inline">
                <input type="text" name="pubdate" lay-verify="required" placeholder="请输入日期" autocomplete="off" class="layui-input" id="test1">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">出版社：</label>
            <div class="layui-input-inline">
                <input type="text" name="publish" required lay-verify="required" placeholder="请输入出版社" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">ISBN：</label>
            <div class="layui-input-inline">
                <input type="text" name="ISBN" required lay-verify="required" placeholder="请输入图书国际编号" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">库存：</label>
            <div class="layui-input-inline">
                <input type="text" name="stock" required lay-verify="required" placeholder="请输入库存" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">书本类别：</label>
            <div class="layui-input-block" >
                <select name="cid" id="class_id" required lay-verify="required">
                    <option value="">请选择书本类别</option>
                    <c:forEach items="${category}" var="ctg">
                        <option value="${ctg.cid}" <c:if test="${ctg.cid==bcid}">selected</c:if>>${ctg.cname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>

    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">语言：</label>
            <div class="layui-input-block">
                <select name="language" id="language" required lay-verify="required">
                    <option value="">请选择书本语言</option>
                    <option value="中文" >中文</option>
                    <option value="英语" >英语</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">书本描述：</label>
        <div class="layui-input-block">
            <textarea style="width:600px; height:150px" placeholder="请输入书本描述" name="introduction" required  lay-verify="required"  class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <input class="layui-btn" type="submit"/>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<div id="addmsg">${msg}</div>
<script>
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
    $(function () {
        if($("#addmsg").text() == "添加成功"){
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);//关闭弹出层
            alert("添加成功");

        }else if($("#addmsg").text() == "添加失败"){
            alert("添加失败 请重新添加");
        }
    })


</script>

</body>
</html>
