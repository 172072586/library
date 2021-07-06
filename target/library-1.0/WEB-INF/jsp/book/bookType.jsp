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
    <script src="js/layui.js"></script>
    <title>图书类别</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" flush="true"/>

    <div style="padding-left: 200px;">
        <a class="layui-btn layui-btn-normal" onclick="addType();">添加类别</a>
        <table class="layui-hide" id="demo" lay-filter="test"></table>

        <div class="layui-tab-item layui-show">
            <div id="pageDemo"></div>
        </div>
    </div>
</div>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
    </script>
    <script src="js/layui.js"></script>

<script type="text/javascript">
    layui.use(['laypage', 'layer', 'table', 'element','jquery'], function(){
        laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element; //元素操作
        var $ = layui.jquery;

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 550
            ,url: 'type/bookTypeList.do' //数据接口
            ,title: '图书表'
            ,cols: [[ //表头
                {field: 'cname', title: '类别名称', width:300, align:'center'}
                ,{fixed: 'right',title:'操作', width: 300, align:'center', toolbar: '#barDemo'}
            ]]
        });

    });
    function addType(){
        layui.use(['laypage', 'layer', 'table', 'element','jquery'], function(){
            layer = layui.layer //弹层
                ,element = layui.element; //元素操作
            var $ = layui.jquery;
            layer.prompt({title: '添加类别', formType: 2}, function(text, index){
                layer.close(index);
                $.ajax({
                    url:'type/addBookType.do',
                    data:{'cname':text},
                    dataType:'json',
                    type:'post',
                    success:function (data) {
                        if (data.success){
                            window.location.reload();
                        }else{
                            layer.msg(data.message);
                        }
                    }
                })

            });
        });
    }
</script>
</body>
</html>