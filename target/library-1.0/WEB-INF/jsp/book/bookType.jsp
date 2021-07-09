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
    <script type="text/javascript" src="js/jquery.js"></script>
    <title>图书类别</title>
    <style type="text/css">
        button{
            border-color: unset;
            height: 35px;
            width: 55px;
            color: white;
            background-color: #28B779;
            font-size: 20px;
        }

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/WEB-INF/jsp/common/header.jsp" flush="true"/>

    <div style="padding-left: 200px;">
        <a class="layui-btn layui-btn-normal" onclick="addType();" >添加类别</a>
    </div>
    <br>
    </div>
    <div style="padding-left: 200px; text-align: center;  color: #808080;">
        <table width="600px" border="1" style="border-color: #999999">
            <thead style="height: 50px; width: 100px;font-size: 20px;" >
            <tr bgcolor="#cccccc" >
                <td>类别名称</td>
                <td>操作</td>
            </tr>
            </thead >

            <tbody id="tbody" style="height: 500px; width:100px;">
            </tbody>
        </table>
    </div>

<script >
    /*layUI弹层：增加图书类型*/
    function addType() {
        layer.open({
            type: 2,
            title: '添加图书类型',
            skin: 'layui-layer-demo', //加上边框
            area: ['400px', '250px'], //宽高
            content: 'addBookType.action'
        });
    }

    /*layUI弹层功能：修改功能*/
    function editType(id) {
        layer.open({
            type: 2,
            title: '编辑图书类型',
            skin: 'layui-layer-demo', //加上边框
            area: ['400px', '250px'], //宽高
            content: 'editBookType.action?cid='+id
        });
    }

    $(function () {
        layui.use(['laypage', 'layer', 'table', 'element','jquery'], function(){
            laypage = layui.laypage //分页
                ,layer = layui.layer //弹层
                ,table = layui.table //表格
                ,element = layui.element; //元素操作
            var $ = layui.jquery;
        });
    })


</script>
<script type="text/javascript">
    $("button").click(function () {
        /*queryAllType();*/
        alert("点击")
    })
    $(function () {
        /*var index = parent.layer.getFrameIndex(window.name);*/ //获取窗口索引
        //$("#layui-layer-iframe1").close();
        queryAllType();



    })
    //查询图书类别
    function queryAllType() {
        var category = "";
        $.ajax({
            url:"queryType.action",
            dataType:"json",
            type:"post",
            success:function(data) {
                $("#tbody").empty();
                eachType(data);
            }
        })
    }

    //遍历返回的json格式type数据
    function eachType(data) {
        var category = "";
        $.each(data, function(i, n) {
            /*alert(n.cid+"==="+n.cname);*/
            var a = "";
            a+="<tr>" +
                "<td style='font-size: 20px'>" + n.cname + "</td>" +
                "<td><button id="+n.cid+" "+"onclick='editType("+n.cid+");'>修改</button>  <button id="+n.cid+" "+
                "onclick='removeType("+n.cid+");'>删除</button></tr>";
            category += a;
        });
        $("#tbody").append(category);
    }

    function removeType(id) {
        var cid = id;
        var result = confirm("确认删除图书？");
        if(true){
            $.ajax({
                url:"removeType.action",
                dataType:"json",
                type:"post",
                data:{"cid":cid},
                success:function(data) {

                }
            })
        }
    }
</script>
</body>
</html>